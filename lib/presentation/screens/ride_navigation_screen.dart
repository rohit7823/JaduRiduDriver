import 'package:floating/floating.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jadu_ride_driver/core/domain/ride_id.dart';
import 'package:jadu_ride_driver/presentation/app_navigation/change_screen.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/app_button.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/ripple_widget.dart';
import 'package:jadu_ride_driver/presentation/stores/ride_navigation_store.dart';
import 'package:jadu_ride_driver/presentation/ui/app_text_style.dart';
import 'package:jadu_ride_driver/presentation/ui/image_assets.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';
import 'package:jadu_ride_driver/utills/app_pip_service.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';
import 'package:mobx/mobx.dart';

import '../custom_widgets/app_snack_bar.dart';

class RideNavigationScreen extends StatefulWidget {
  RideNavigationData rideId;

  RideNavigationScreen({Key? key, required this.rideId}) : super(key: key);

  @override
  State<RideNavigationScreen> createState() => _RideNavigationScreenState();
}

class _RideNavigationScreenState extends State<RideNavigationScreen>
    with WidgetsBindingObserver {
  late final RideNavStore _store;
  late final List<ReactionDisposer> _disposers;

  @override
  void initState() {
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
          ChangeScreen.from(context, p0.screen, onCompleted: _store.clear);
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
    WidgetsBinding.instance.removeObserver(this);
    AppPipService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PiPSwitcher(
      childWhenEnabled: Container(
          decoration:
              BoxDecoration(color: AppColors.Acadia, shape: BoxShape.circle),
          child: Image.asset(
            ImageAssets.logo,
            width: 50,
            height: 50,
          )),
      childWhenDisabled: WillPopScope(
        onWillPop: () async {
          _store.stropLocationSender();
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
                      padding: EdgeInsets.symmetric(
                          horizontal: 0.05.sw, vertical: 0.05.sw),
                      decoration: const BoxDecoration(color: AppColors.white),
                      child: Column(
                        children: [
                          Observer(
                            builder: (BuildContext context) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: 0.03.sw),
                                child: FilterChip(
                                  label: _store.currentRideStage.name
                                      .text(AppTextStyle.transactionDateStyle),
                                  onSelected: null,
                                  backgroundColor: AppColors.primary,
                                  avatar: SvgPicture.asset(
                                      _store.currentServiceIconPath),
                                ),
                              );
                            },
                          ),
                          Observer(
                            builder: (BuildContext context) => _store.customer
                                .text(AppTextStyle.rideNavCustomerNameStyle),
                          )
                        ],
                      ),
                    )),
                expand(
                    flex: 8,
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
                      ],
                    )),
                expand(
                    flex: 3,
                    child: Container(
                      padding: EdgeInsets.all(0.05.sw),
                      width: 1.sw,
                      decoration: const BoxDecoration(color: AppColors.white),
                      child: Observer(
                        builder: (BuildContext context) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if (_store.pickUpRoute != null)
                                _pickUpLocation().padding(
                                    insets: EdgeInsets.only(bottom: 0.05.sw)),
                              AppButton(
                                  onClick: _store.onClientLocated,
                                  label: StringProvider.clientLocated)
                            ],
                          );

                          return const SizedBox.shrink();
                        },
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _pickUpLocation() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        expand(
          flex: 8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StringProvider.pickUpLocation.text(AppTextStyle.findAccountStyle
                  .copyWith(fontWeight: FontWeight.w600)),
              fitBox(
                child: _store.pickUpRoute!.summary
                    .text(AppTextStyle.applicationSubmittedStyle),
              )
            ],
          ).paddings(right: 0.03.sw),
        ),
        expand(
            flex: 2,
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  fitBox(
                    child: RippleWidget(
                      radius: BorderRadius.circular(16.r),
                      shadowAllowed: true,
                      paddingAllowed: true,
                      action: _store.onNavigate,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(ImageAssets.navigation).padding(
                              insets: const EdgeInsets.only(bottom: 5)),
                          StringProvider.navigate
                              .text(AppTextStyle.driveDocumentNameStyle)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ))
      ],
    );
  }
}
