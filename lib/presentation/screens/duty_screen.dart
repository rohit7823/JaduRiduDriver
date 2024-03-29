import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';
import 'package:jadu_ride_driver/core/common/dialog_state.dart';
import 'package:jadu_ride_driver/core/common/driver_status.dart';
import 'package:jadu_ride_driver/helpers_impls/expired_document_dialog.dart';
import 'package:jadu_ride_driver/helpers_impls/my_dialog_impl.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/app_snack_bar.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/booking_arrived_widget.dart';
import 'package:jadu_ride_driver/presentation/stores/duty_screen_store.dart';
import 'package:jadu_ride_driver/presentation/stores/shared_store.dart';
import 'package:jadu_ride_driver/presentation/ui/app_text_style.dart';
import 'package:jadu_ride_driver/presentation/ui/image_assets.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';
import 'package:jadu_ride_driver/utills/dialog_controller.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';
import 'package:mobx/mobx.dart';

class DutyScreen extends StatefulWidget {
  final SharedStore sharedStore;

  const DutyScreen({Key? key, required this.sharedStore}) : super(key: key);

  @override
  State<DutyScreen> createState() => _DutyScreenState();
}

class _DutyScreenState extends State<DutyScreen> with TickerProviderStateMixin {
  late final DutyStore _store;
  late final List<ReactionDisposer> _disposers;
  late final DialogController _dialogController;
  late final DialogController _alertController;

  @override
  void initState() {
    _store = DutyStore(
        TabController(length: DriverStatus.values.length, vsync: this));
    _dialogController =
        DialogController(dialog: MyDialogImpl(buildContext: context));
    _alertController =
        DialogController(dialog: ExpiredDocumentDialog(buildContext: context));
    debugPrint("booking store ${widget.sharedStore.driverBookings.hashCode}");
    super.initState();

    _disposers = [
      reaction((p0) => _store.errorMsg, (p0) {
        if (p0 is String && p0.isNotEmpty) {
          AppSnackBar.show(context, message: p0, clear: () {
            _store.errorMsg = "";
          });
        }
      }),
      reaction((p0) => _store.informMessage, (p0) {
        if (p0.isNotEmpty) {
          AppSnackBar.show(context, message: p0, clear: () {
            _store.informMessage = "";
          });
        }
      }),
      reaction((p0) => _store.dialogManager.currentErrorState, (p0) {
        if (p0 is DialogState && p0 == DialogState.displaying) {
          _dialogController.show(_store.dialogManager.errorData!, p0,
              close: _store.dialogManager.closeErrorDialog,
              positive: _store.onError);
        }
      }),
      reaction((p0) => _store.alertDialogManager.currentErrorState, (p0) {
        if (p0 == DialogState.displaying) {
          _alertController.show(_store.alertDialogManager.errorData!, p0,
              close: _store.alertDialogManager.closeErrorDialog,
              positive: _store.onError,
              negative: null);
        }
      }),
      reaction((p0) => widget.sharedStore.driverBookings.alreadyBookedMsg,
          (p0) {
        if (p0.isNotEmpty) {
          AppSnackBar.show(context, message: p0, clear: () {
            widget.sharedStore.driverBookings.alreadyBookedMsg = "";
          });
        }
      }),
      reaction((p0) => _store.currentChange, (p0) {
        if (p0 != null) {
          widget.sharedStore.onChange(p0);
        }
      }),
      reaction((p0) => widget.sharedStore.driverBookings.onRideData, (p0) {
        if (p0 != null) {
          widget.sharedStore.afterAcceptBooking(p0);
        }
      }),
      reaction((p0) => widget.sharedStore.notificationPayload, (p0) {
        if (p0 != null) {
          widget.sharedStore.driverBookings
              .initCurrentBooking(p0.bookingDetails, context);
          widget.sharedStore.notificationPayload = null;
        }
      }),
      reaction((p0) => widget.sharedStore.selectedLocation, (p0) {
        if (p0 is DetailsResult) {
          _store.setGoToLocation(p0);
        } else if (p0 is bool) {
          _store.setGoToLocation(null);
        }
        widget.sharedStore.selectedLocation = null;
      }),
    ];
  }

  @override
  void dispose() {
    for (var element in _disposers) {
      element();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        expand(flex: 2, child: _upperSideContent()),
        Divider(
          color: AppColors.Gray,
          height: 1,
        ),
        expand(flex: 7, child: _lowerSideContent())
      ],
    ));
  }

  Widget _upperSideContent() {
    return Align(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              flex: 5,
              child: Observer(
                builder: (BuildContext context) {
                  return AnimatedContainer(
                    color: _store.selectedStatus == DriverStatus.offDuty ||
                            _store.selectedStatus == DriverStatus.goTo
                        ? AppColors.primaryVariant
                        : AppColors.primary,
                    padding: EdgeInsets.symmetric(
                        vertical: 0.04.sw, horizontal: 0.05.sw),
                    duration: const Duration(milliseconds: 400),
                    child: Row(
                      children: [
                        expand(
                            flex: 2, child: SvgPicture.asset(ImageAssets.car)),
                        expand(
                            flex: 7,
                            child: Container(
                              height: 0.10.sw,
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(20.r),
                                  border:
                                      Border.all(color: AppColors.lightGray)),
                              child: TabBar(
                                indicator: BoxDecoration(
                                    color: AppColors.primaryVariant,
                                    borderRadius: BorderRadius.circular(20.r)),
                                // padding: EdgeInsets.all(0.01.sw),
                                controller: _store.tabController,
                                onTap: _store.onDriverStatusChanged,
                                labelColor: AppColors.white,
                                automaticIndicatorColorAdjustment: false,
                                unselectedLabelColor: AppColors.appBlack,
                                tabs: DriverStatus.values.map((status) {
                                  return fitBox(
                                    child: Padding(
                                      padding: EdgeInsets.all(0.01.sw),
                                      child: Tab(text: status.name),
                                    ),
                                  );
                                }).toList(),
                              ),
                            )),
                        expand(
                            flex: 2,
                            child: GestureDetector(
                              onTap: _store.onNotificationScreen,
                              child: SvgPicture.asset(
                                ImageAssets.notifications,
                                color: AppColors.Acadia,
                                width: 30,
                                height: 30,
                              ),
                            ))
                      ],
                    ),
                  );
                },
              )),
          Expanded(
              flex: 8,
              child: Container(
                color: AppColors.white,
                padding: EdgeInsets.symmetric(
                    vertical: 0.02.sw, horizontal: 0.05.sw),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        expand(
                            flex: 5,
                            child: Observer(
                              builder: (BuildContext context) {
                                return Column(
                                  children: [
                                    StringProvider.bookingCount
                                        .text(AppTextStyle.selectRechargeStyle),
                                    if (_store.gettingSummaryLoader)
                                      SizedBox(
                                          width: 0.05.sw,
                                          height: 0.05.sw,
                                          child:
                                              const CircularProgressIndicator(
                                            color: AppColors.primaryVariant,
                                          )),
                                    if (!_store.gettingSummaryLoader)
                                      _store.bookingCount.text(
                                          AppTextStyle.detailsTypeItemTextStyle)
                                  ],
                                );
                              },
                            )),
                        expand(
                            flex: 5,
                            child: Observer(
                              builder: (BuildContext context) {
                                return Column(
                                  children: [
                                    StringProvider.operatorBill
                                        .text(AppTextStyle.selectRechargeStyle),
                                    if (_store.gettingSummaryLoader)
                                      SizedBox(
                                          width: 0.05.sw,
                                          height: 0.05.sw,
                                          child:
                                              const CircularProgressIndicator(
                                            color: AppColors.primaryVariant,
                                          )),
                                    if (!_store.gettingSummaryLoader)
                                      _store.operatorBill.text(
                                          AppTextStyle.detailsTypeItemTextStyle)
                                  ],
                                );
                              },
                            ))
                      ],
                    ).padding(insets: EdgeInsets.only(bottom: 0.02.sw)),
                    Observer(
                      builder: (context) => fitBox(
                        child:
                            "${StringProvider.lastUpdated}${_store.timeStamp}"
                                .text(AppTextStyle.placerHolderStyle),
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }

  Widget _lowerSideContent() {
    return Align(
      child: Observer(
        builder: (BuildContext context) {
          return Stack(
            children: [
              GoogleMap(
                key: widget.sharedStore.driverBookings.googleMap,
                initialCameraPosition: CameraPosition(
                    zoom: 16,
                    target: LatLng(widget.sharedStore.currentLocation!.latitude,
                        widget.sharedStore.currentLocation!.longitude)),
                indoorViewEnabled: true,
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                trafficEnabled: true,
                mapToolbarEnabled: true,
                buildingsEnabled: true,
                minMaxZoomPreference:
                    const MinMaxZoomPreference(3, double.maxFinite),
                onMapCreated: (controller) {
                  widget.sharedStore.driverBookings
                      .onMapCreate(controller, context);
                },
                markers: widget.sharedStore.driverBookings.customers.toSet(),
              ),
              Observer(
                builder: (context) => _store.selectedGoToLocation != null
                    ? Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: 0.80.sw,
                          padding: EdgeInsets.all(0.03.sw),
                          decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.5),
                              boxShadow: allShadow(),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16.r),
                                  topRight: Radius.circular(16.r))),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              StringProvider.selectedLocation
                                  .text()
                                  .paddings(bottom: 0.01.sw),
                              Text(
                                _store.selectedGoToLocation!,
                                style: AppTextStyle.rechargeDoneStyle.copyWith(
                                    fontWeight: FontWeightManager.medium,
                                    fontSize: 16.sp),
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                child: widget.sharedStore.driverBookings.customers.isNotEmpty
                    ? BookingArrivedWidget(
                        details: widget.sharedStore.driverBookings.details,
                        estimateKm:
                            widget.sharedStore.driverBookings.estimatedKm,
                        eta: widget.sharedStore.driverBookings.eta,
                        passTimer: widget.sharedStore.driverBookings.passTimer,
                        vehicleType:
                            widget.sharedStore.driverBookings.vehicleType,
                        pickUpLocation:
                            widget.sharedStore.driverBookings.pickUpLocation,
                        dropLocation:
                            widget.sharedStore.driverBookings.dropLocation,
                        onPass: widget.sharedStore.onPass,
                        onOkay: widget.sharedStore.onOkay,
                        soundUrl: widget
                            .sharedStore.driverBookings.bookingAlertSoundUrl,
                        estimateFare: widget.sharedStore.driverBookings.fare,
                      )
                    : const SizedBox.shrink(),
              ),
              /*Align(
                alignment: Alignment.bottomLeft,
                child: Observer(
                  builder: (context) => FloatingActionButton(
                    onPressed: widget.sharedStore.emergencyLoading
                        ? null
                        : widget.sharedStore.onClickEmergency,
                    backgroundColor: AppColors.primaryVariant,
                    tooltip: StringProvider.bookAnEmergencyRide,
                    hoverElevation: 12,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.r)),
                    child: widget.sharedStore.emergencyLoading
                        ? const CircularProgressIndicator(
                            color: AppColors.white,
                          )
                        : const Icon(
                            Icons.emergency,
                            color: AppColors.white,
                            size: 35,
                          ),
                  ).paddings(all: 0.05.sw),
                ),
              )*/
            ],
          );
        },
      ),
    );
  }
}
