import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jadu_ride_driver/core/common/driver_status.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/app_snack_bar.dart';
import 'package:jadu_ride_driver/presentation/stores/duty_screen_store.dart';
import 'package:jadu_ride_driver/presentation/stores/shared_store.dart';
import 'package:jadu_ride_driver/presentation/ui/app_text_style.dart';
import 'package:jadu_ride_driver/presentation/ui/image_assets.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';
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

  @override
  void initState() {
    _store = DutyStore(TabController(length: DriverStatus.values.length, vsync: this));
    super.initState();

    _disposers = [
      reaction((p0) => _store.errorMsg, (p0) {
        if(p0 is String && p0.isNotEmpty) {
          AppSnackBar.show(context, message: p0, clear: () {
            _store.errorMsg = "";
          });
        }
      })
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
          Observer(
            builder: (BuildContext context) {
              return AnimatedContainer(
                color: _store.selectedStatus == DriverStatus.offDuty || _store.selectedStatus == DriverStatus.goTo ? AppColors.primaryVariant : AppColors.primary,
                padding:
                EdgeInsets.symmetric(vertical: 0.04.sw, horizontal: 0.05.sw),
                duration: const Duration(milliseconds: 400),
                child: Row(
                  children: [
                    expand(flex: 2, child: SvgPicture.asset(ImageAssets.car)),
                    expand(
                        flex: 7,
                        child: Container(
                          height: 0.10.sw,
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(20.r),
                              border: Border.all(color: AppColors.lightGray)
                          ),
                          child: TabBar(
                            indicator: BoxDecoration(
                                color: AppColors.primaryVariant,
                                borderRadius: BorderRadius.circular(20.r)
                            ),
                            padding: EdgeInsets.all(0.01.sw),
                            controller: _store.tabController,
                            onTap: _store.onDriverStatusChanged,
                            labelColor: AppColors.white,
                            unselectedLabelColor: AppColors.Gray,
                            tabs: DriverStatus.values.map((status) {
                              return fitBox(
                                child: Tab(
                                  text: status.name
                                ),
                              );
                            }).toList(),
                          ),
                        )),
                    expand(
                        flex: 2,
                        child: SvgPicture.asset(
                          ImageAssets.notifications,
                          color: AppColors.Acadia,
                          width: 30,
                          height: 30,
                        ))
                  ],
                ),
              );
            },
          ),
          Container(
            color: AppColors.white,
            padding:
            EdgeInsets.symmetric(vertical: 0.02.sw, horizontal: 0.05.sw),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    expand(
                        flex: 5,
                        child: Column(
                          children: [
                            StringProvider.bookingCount
                                .text(AppTextStyle.selectRechargeStyle),
                            _store.bookingCount
                                .text(AppTextStyle.detailsTypeItemTextStyle)
                          ],
                        )),
                    expand(
                        flex: 5,
                        child: Column(
                          children: [
                            StringProvider.operatorBill
                                .text(AppTextStyle.selectRechargeStyle),
                            _store.operatorBill
                                .text(AppTextStyle.detailsTypeItemTextStyle)
                          ],
                        ))
                  ],
                ).padding(insets: EdgeInsets.only(bottom: 0.03.sw)),
                fitBox(
                  child: "${StringProvider.lastUpdated}${_store.timeStamp}"
                      .text(AppTextStyle.placerHolderStyle),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _lowerSideContent() {
    return Align(
      child: GoogleMap(
        key: widget.sharedStore.googleMap,
        initialCameraPosition: CameraPosition(
            zoom: 12,
            target: LatLng(widget.sharedStore.currentLocation!.latitude,
                widget.sharedStore.currentLocation!.longitude)),
        indoorViewEnabled: true,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        trafficEnabled: true,
        mapToolbarEnabled: true,
        buildingsEnabled: true,
        minMaxZoomPreference: const MinMaxZoomPreference(3, double.maxFinite),
      ),
    );
  }
}
