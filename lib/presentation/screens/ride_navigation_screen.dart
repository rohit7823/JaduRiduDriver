import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jadu_ride_driver/core/domain/ride_id.dart';
import 'package:jadu_ride_driver/presentation/stores/ride_navigation_store.dart';
import 'package:jadu_ride_driver/presentation/ui/app_text_style.dart';
import 'package:jadu_ride_driver/presentation/ui/image_assets.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';
import 'package:mobx/mobx.dart';

class RideNavigationScreen extends StatefulWidget {
  RideId rideId;

  RideNavigationScreen({Key? key, required this.rideId}) : super(key: key);

  @override
  State<RideNavigationScreen> createState() => _RideNavigationScreenState();
}

class _RideNavigationScreenState extends State<RideNavigationScreen> {
  late final RideNavStore _store;
  late final List<ReactionDisposer> _disposers;

  @override
  void initState() {
    _store = RideNavStore(widget.rideId);
    super.initState();

    _disposers = [];
  }

  @override
  void dispose() {
    _store.dispose();
    for (var element in _disposers) {
      element();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                  children: [
                    Observer(builder: (context) {
                      return GoogleMap(
                          indoorViewEnabled: true,
                          markers: _store.points,
                          polylines: _store.lines,
                          onMapCreated: _store.onMapCreated,
                          myLocationEnabled: true,
                          initialCameraPosition: CameraPosition(
                              zoom: 16, target: _store.ids.currentLocation));
                    })
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
                      if (_store.pickUpRoute != null) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            expand(
                              flex: 8,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  StringProvider.pickUpLocation.text(
                                      AppTextStyle.findAccountStyle.copyWith(
                                          fontWeight: FontWeight.w600)),
                                  _store.pickUpRoute!.summary.text(
                                      AppTextStyle.applicationSubmittedStyle)
                                ],
                              ),
                            ),
                            expand(
                                flex: 2,
                                child: fitBox(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SvgPicture.asset(ImageAssets.navigation)
                                          .padding(
                                              insets:
                                                  EdgeInsets.only(bottom: 5)),
                                      "Navigate".text(
                                          AppTextStyle.driveDocumentNameStyle)
                                    ],
                                  ),
                                ))
                          ],
                        );
                      }

                      return const SizedBox.shrink();
                    },
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
