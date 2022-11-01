import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jadu_ride_driver/core/common/ride_stages.dart';
import 'package:jadu_ride_driver/core/common/screen.dart';
import 'package:jadu_ride_driver/core/domain/ride_navigation_data.dart';
import 'package:jadu_ride_driver/presentation/app_navigation/change_screen.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/app_button.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/ride_timer_widget.dart';
import 'package:jadu_ride_driver/presentation/stores/ride_navigation_store.dart';
import 'package:jadu_ride_driver/presentation/stores/shared_store.dart';
import 'package:jadu_ride_driver/presentation/ui/app_text_style.dart';
import 'package:jadu_ride_driver/presentation/ui/image_assets.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';
import 'package:jadu_ride_driver/utills/app_pip_service.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';
import 'package:mobx/mobx.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'package:timelines/timelines.dart';

import '../custom_widgets/app_snack_bar.dart';

class RideNavigationScreen extends StatefulWidget {
  RideNavigationData rideId;
  SharedStore sharedStore;

  RideNavigationScreen(
      {Key? key, required this.rideId, required this.sharedStore})
      : super(key: key);

  @override
  State<RideNavigationScreen> createState() => _RideNavigationScreenState();
}

class _RideNavigationScreenState extends State<RideNavigationScreen>
    with WidgetsBindingObserver {
  late final RideNavStore _store;
  late final List<ReactionDisposer> _disposers;

  @override
  void initState() {
    widget.sharedStore.onRideStarted();
    widget.sharedStore.onRideFare();
    _store = RideNavStore(widget.rideId);
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _disposers = [
      reaction((p0) => _store.messageInformer.currentMsg, (p0) {
        if (p0.isNotEmpty) {
          AppSnackBar.show(context,
              message: p0, clear: _store.messageInformer.clear);
        }
      }),
      reaction((p0) => _store.currentChange, (p0) {
        if (p0 != null) {
          if (p0.screen == Screen.verifyTripOtp) {
            ChangeScreen.to(context, p0.screen,
                arguments: p0.argument,
                onComplete: _store.clear,
                fromScreen: _store.onVerifiedOtp);
          } else if (p0.screen == Screen.payTrip) {
            ChangeScreen.to(context, p0.screen,
                arguments: p0.argument,
                option: p0.option,
                onComplete: _store.clear);
          } else {
            ChangeScreen.from(context, p0.screen, onCompleted: _store.clear);
          }
        }
      }),
      reaction((p0) => widget.sharedStore.dropLocationData,
          fireImmediately: true, (p0) {
        if (p0 != null) {
          _store.placeDropCoordinates(p0);
        }
      })
    ];
  }

  @override
  void dispose() {
    _store.dispose();
    for (var element in _disposers) {
      element();
    }
    _store.rideDirectionNavigationService.stop();
    _store.rideDirectionNavigationService.stopOverlay();
    AppPipService.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    debugPrint("AppLifeState $state");
    if (state == AppLifecycleState.resumed) {
      _store.rideDirectionNavigationService.stopOverlay();
    }
  }

  @override
  Widget build(BuildContext context) {
    return WithForegroundTask(
      child: WillPopScope(
        onWillPop: () async {
          //_store.stropLocationSender();
          return false;
        },
        child: SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                expand(
                    flex: 2,
                    child: Container(
                      width: 1.sw,
                      padding: EdgeInsets.symmetric(vertical: 0.05.sw),
                      decoration: const BoxDecoration(color: AppColors.primary),
                      child: fitBox(
                        fit: BoxFit.contain,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Observer(
                              builder: (BuildContext context) {
                                return Padding(
                                  padding: EdgeInsets.only(bottom: 0.03.sw),
                                  child: FilterChip(
                                    elevation: 7.1,
                                    padding: EdgeInsets.all(0.02.sw),
                                    disabledColor: AppColors.white,
                                    label: _store.currentRideStage.name.text(
                                        AppTextStyle.transactionDateStyle),
                                    onSelected: null,
                                    backgroundColor: AppColors.white,
                                    avatar: SvgPicture.asset(
                                        _store.currentServiceIconPath),
                                  ),
                                );
                              },
                            ),
                            Observer(
                              builder: (BuildContext context) => _store.customer
                                  .text(AppTextStyle.rideNavCustomerNameStyle
                                      .copyWith(
                                          color: AppColors.Acadia,
                                          fontWeight: FontWeight.w600)),
                            )
                          ],
                        ),
                      ),
                    )),
                expand(
                    flex: 9,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Observer(builder: (context) {
                          return GoogleMap(
                              indoorViewEnabled: true,
                              markers: _store.points,
                              polylines: _store.lines,
                              onMapCreated: _store.onMapCreated,
                              myLocationEnabled: true,
                              initialCameraPosition: CameraPosition(
                                  zoom: 16,
                                  target: _store
                                      .rideNavigationData.currentLocation));
                        }),
                        Observer(builder: (context) {
                          if (_store.currentRideStage == RideStages.ongoing &&
                              _store.destinations.isNotEmpty) {
                            return Column(children: [
                              expand(flex: 1, child: _dropLocation()),
                              const Divider(
                                color: AppColors.lightGray,
                                height: 0.5,
                              ),
                              Container(
                                width: 1.sw,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 0.05.sw, vertical: 0.05.sw),
                                decoration:
                                    const BoxDecoration(color: AppColors.white),
                                child: Align(
                                  child: SwipeableButtonView(
                                      onFinish: _store.onEndTrip,
                                      onWaitingProcess: _store.endTripWaiting,
                                      isFinished: _store.endTripLoader,
                                      indicatorColor: AlwaysStoppedAnimation(
                                          AppColors.Acadia),
                                      activeColor: AppColors.primary,
                                      buttonWidget:
                                          SvgPicture.asset(ImageAssets.swipe),
                                      buttonText: StringProvider.endTrip),
                                ),
                              )
                            ]);
                          }
                          return const SizedBox.shrink();
                        })
                      ],
                    )),
                Observer(builder: (context) {
                  if (_store.currentRideStage != RideStages.ongoing) {
                    return expand(
                        flex: 3,
                        child: Align(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 0.05.sw, vertical: 0.02.sw),
                            width: 1.sw,
                            decoration:
                                const BoxDecoration(color: AppColors.white),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Observer(builder: (context) {
                                  if (_store.pickUpRoute != null &&
                                      _store.currentRideStage ==
                                          RideStages.pickUp) {
                                    return expand(
                                      flex: 1,
                                      child: Align(
                                          alignment: Alignment.topCenter,
                                          child: _pickUpLocation()),
                                    );
                                  }
                                  return const SizedBox.shrink();
                                }),
                                Observer(builder: (context) {
                                  if (_store.pickUpRoute != null &&
                                      _store.currentRideStage ==
                                          RideStages.waiting) {
                                    return expand(
                                      flex: 1,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          expand(
                                            flex: 6,
                                            child: Align(
                                              child: RideTimerWidget(
                                                key: ObjectKey(
                                                    _store.timerDuration),
                                                duration: _store.timerDuration,
                                                title:
                                                    "Waiting for ${_store.customer}",
                                                onTimeout:
                                                    _store.onArrivedTimeOut,
                                              ).paddings(bottom: 0.01.sw),
                                            ),
                                          ),
                                          expand(
                                            flex: 4,
                                            child: Align(
                                              child: SwipeableButtonView(
                                                  onFinish: _store.onStartTrip,
                                                  onWaitingProcess:
                                                      _store.verifyOtp,
                                                  isFinished:
                                                      _store.tripStartLoader,
                                                  indicatorColor:
                                                      AlwaysStoppedAnimation(
                                                          AppColors.Acadia),
                                                  activeColor:
                                                      AppColors.primary,
                                                  buttonWidget:
                                                      SvgPicture.asset(
                                                          ImageAssets.swipe),
                                                  buttonText:
                                                      StringProvider.startTrip),
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  }
                                  return const SizedBox.shrink();
                                })
                              ],
                            ),
                          ),
                        ));
                  }

                  return const SizedBox.shrink();
                })
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _pickUpLocation() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        expand(
            flex: 6,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                expand(
                  flex: 9,
                  child: Align(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StringProvider.pickUpLocation.text(
                            AppTextStyle.findAccountStyle.copyWith(
                                fontWeight: FontWeight.w600, fontSize: 15.sp)),
                        _store.pickUpRoute!.legs.first.startAddress.text(
                          AppTextStyle.applicationSubmittedStyle,
                          TextOverflow.ellipsis,
                        )
                      ],
                    ).paddings(right: 0.01.sw),
                  ),
                ),
                expand(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.center,
                      child: fitBox(
                        child: InkWell(
                          onTap: _store.onNavigate,
                          borderRadius: BorderRadius.circular(12.r),
                          child: Container(
                            padding: EdgeInsets.all(0.05.sw),
                            decoration: BoxDecoration(
                                boxShadow: allShadow(),
                                color: AppColors.Acadia,
                                borderRadius: BorderRadius.circular(12.r),
                                shape: BoxShape.rectangle),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                  ImageAssets.navigation,
                                  color: AppColors.white,
                                ).padding(
                                    insets: const EdgeInsets.only(bottom: 5)),
                                StringProvider.navigate.text(AppTextStyle
                                    .driveDocumentNameStyle
                                    .copyWith(color: AppColors.white))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ))
              ],
            )),
        expand(
          flex: 4,
          child: AppButton(
              onClick: _store.onClientLocated,
              label: StringProvider.clientLocated),
        )
      ],
    );
  }

  Widget _dropLocation() {
    return NotificationListener<DraggableScrollableNotification>(
      onNotification: (DraggableScrollableNotification notification) {
        _store.updateSheetExtentFactor(notification.extent);
        return false;
      },
      child: DraggableScrollableSheet(
          maxChildSize: 1,
          minChildSize: 0.27,
          initialChildSize: 0.27,
          snap: false,
          snapSizes: const [0.5, 0.75],
          builder: (context, controller) {
            return Observer(
              builder: (BuildContext context) {
                return Container(
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: AppColors.lightGray,
                          offset: Offset(
                            5.0,
                            5.0,
                          ),
                          blurRadius: 7.0,
                          spreadRadius: 2.0,
                        )
                      ],
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                              (1.0 - _store.sheetExtentFactor) * 22),
                          topRight: Radius.circular(
                              (1.0 - _store.sheetExtentFactor) * 22))),
                  child: Timeline.builder(
                      padding: EdgeInsets.symmetric(
                          horizontal: 0.05.sw, vertical: 0.03.sw),
                      controller: controller,
                      itemBuilder: (context, idx) {
                        if (idx == 0) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 0.15.sw,
                                child: const Divider(
                                  thickness: 5,
                                ),
                              ),
                              fitBox(
                                child: StringProvider.yourStops
                                    .text(AppTextStyle.tripPaymentMethodStyle),
                              ),
                              InkWell(
                                onTap: () {
                                  _store.onRideStopTapped(
                                      _store.destinations[idx]);
                                },
                                child: TimelineTile(
                                    nodeAlign: TimelineNodeAlign.start,
                                    contents: Container(
                                      width: 0.90.sw,
                                      padding: EdgeInsets.all(0.05.sw),
                                      decoration: BoxDecoration(
                                          color: AppColors.white,
                                          borderRadius:
                                              BorderRadius.circular(16.r),
                                          boxShadow: allShadow()),
                                      child: Row(
                                        children: [
                                          expand(
                                              flex: 8,
                                              child: _store
                                                  .destinations[idx].name
                                                  .text(AppTextStyle
                                                      .driverPersonalDetailStyle)
                                                  .paddings(right: 0.02.sw)),
                                          expand(
                                              flex: 2,
                                              child: fitBox(
                                                child: InkWell(
                                                  onTap: () {
                                                    _store
                                                        .onRideStopNavigateTapped(
                                                            _store.destinations[
                                                                idx]);
                                                  },
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.r),
                                                  child: Container(
                                                    padding:
                                                        EdgeInsets.all(0.05.sw),
                                                    decoration: BoxDecoration(
                                                        boxShadow: allShadow(),
                                                        color: AppColors.Acadia,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.r),
                                                        shape:
                                                            BoxShape.rectangle),
                                                    child: SvgPicture.asset(
                                                      ImageAssets.navigation,
                                                      color: AppColors.white,
                                                    ),
                                                  ),
                                                ),
                                              ))
                                        ],
                                      ),
                                    ).paddings(left: 0.03.sw, bottom: 0.03.sw),
                                    node: TimelineNode(
                                      indicator: Container(
                                        width: 15,
                                        height: 15,
                                        decoration: const BoxDecoration(
                                            color: AppColors.primaryVariant,
                                            shape: BoxShape.circle),
                                      ),
                                      startConnector: DecoratedLineConnector(
                                        thickness: 3,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: _store.destinations.first !=
                                                    _store.destinations[idx]
                                                ? [
                                                    AppColors.primaryVariant,
                                                    AppColors.primary
                                                        .withOpacity(0.4)
                                                  ]
                                                : [
                                                    AppColors.white,
                                                    AppColors.white
                                                  ],
                                          ),
                                        ),
                                      ),
                                      endConnector: SizedBox(
                                        child: DecoratedLineConnector(
                                          thickness: 3,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: _store
                                                          .destinations.last !=
                                                      _store.destinations[idx]
                                                  ? [
                                                      AppColors.primary
                                                          .withOpacity(0.4),
                                                      AppColors.primaryVariant
                                                    ]
                                                  : [
                                                      AppColors.white,
                                                      AppColors.white
                                                    ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )),
                              ).paddings(top: 0.05.sw)
                            ],
                          );
                        }
                        return InkWell(
                          onTap: () {
                            _store.onRideStopTapped(_store.destinations[idx]);
                          },
                          child: TimelineTile(
                              nodeAlign: TimelineNodeAlign.start,
                              contents: Container(
                                width: 0.90.sw,
                                padding: EdgeInsets.all(0.05.sw),
                                decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(16.r),
                                    boxShadow: allShadow()),
                                child: Row(
                                  children: [
                                    expand(
                                        flex: 8,
                                        child: _store.destinations[idx].name
                                            .text(AppTextStyle
                                                .driverPersonalDetailStyle)
                                            .paddings(right: 0.02.sw)),
                                    expand(
                                        flex: 2,
                                        child: fitBox(
                                          child: InkWell(
                                            onTap: () {
                                              _store.onRideStopNavigateTapped(
                                                  _store.destinations[idx]);
                                            },
                                            borderRadius:
                                                BorderRadius.circular(12.r),
                                            child: Container(
                                              padding: EdgeInsets.all(0.05.sw),
                                              decoration: BoxDecoration(
                                                  boxShadow: allShadow(),
                                                  color: AppColors.Acadia,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.r),
                                                  shape: BoxShape.rectangle),
                                              child: SvgPicture.asset(
                                                ImageAssets.navigation,
                                                color: AppColors.white,
                                              ),
                                            ),
                                          ),
                                        ))
                                  ],
                                ),
                              ).paddings(left: 0.03.sw, bottom: 0.03.sw),
                              node: TimelineNode(
                                indicator: Container(
                                  width: 15,
                                  height: 15,
                                  decoration: const BoxDecoration(
                                      color: AppColors.primaryVariant,
                                      shape: BoxShape.circle),
                                ),
                                startConnector: DecoratedLineConnector(
                                  thickness: 3,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: _store.destinations.first !=
                                              _store.destinations[idx]
                                          ? [
                                              AppColors.primaryVariant,
                                              AppColors.primary.withOpacity(0.4)
                                            ]
                                          : [AppColors.white, AppColors.white],
                                    ),
                                  ),
                                ),
                                endConnector: SizedBox(
                                  child: DecoratedLineConnector(
                                    thickness: 3,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: _store.destinations.last !=
                                                _store.destinations[idx]
                                            ? [
                                                AppColors.primary
                                                    .withOpacity(0.4),
                                                AppColors.primaryVariant
                                              ]
                                            : [
                                                AppColors.white,
                                                AppColors.white
                                              ],
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                        );
                      },
                      itemCount: _store.destinations.length),
                );
              },
            );
          }),
    );
  }
}
