import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jadu_ride_driver/presentation/app_navigation/sereen_argument_models/emergency_screen_argument.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/app_button.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/emgency_ride_location_widget.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/navigate_back.dart';
import 'package:jadu_ride_driver/presentation/stores/emergency_place_store.dart';
import 'package:jadu_ride_driver/presentation/ui/app_text_style.dart';
import 'package:jadu_ride_driver/presentation/ui/image_assets.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';
import 'package:mobx/mobx.dart';

class EmergencyPlaceSearchScreen extends StatefulWidget {
  EmergencyScreenArgument data;

  EmergencyPlaceSearchScreen({Key? key, required this.data}) : super(key: key);

  @override
  State<EmergencyPlaceSearchScreen> createState() =>
      _EmergencyPlaceSearchScreenState();
}

class _EmergencyPlaceSearchScreenState
    extends State<EmergencyPlaceSearchScreen> {
  late final EmergencyPlaceStore _store;
  late final ScrollController _controller;
  late List<ReactionDisposer> _disposers;

  @override
  void initState() {
    _store = EmergencyPlaceStore(widget.data);
    _controller = ScrollController();
    super.initState();
    _disposers = [];
  }

  @override
  void dispose() {
    for (var element in _disposers) {
      element.call();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: NavigateBack(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          expand(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StringProvider.chooseHospital
                      .text(AppTextStyle.enterNumberStyle)
                      .paddings(horizontal: 0.05.sw, bottom: 0.05.sw),
                  Observer(
                    builder: (context) => EmergencyRideLocationWidget(
                      starting: _store.origin,
                      ending: _store.destination,
                      onSelectEnding: _store.onSelectEnding,
                      onSelectStaring: _store.onSelectStarting,
                    ),
                  )
                ],
              )),
          expand(
              flex: 6,
              child: _store.screenData.emergencyPlaces.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            ImageAssets.emergency,
                            width: .15.sw,
                            height: .15.sw,
                          ),
                          StringProvider.noHospitalsFoundNearYour
                              .text(
                                  AppTextStyle.btnTextStyle
                                      .copyWith(fontSize: 20.sp),
                                  TextOverflow.ellipsis,
                                  TextAlign.center)
                              .paddings(all: 0.03.sw)
                        ],
                      ),
                    )
                  : Container(
                      width: .90.sw,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        boxShadow: allShadow(),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: ListView.builder(
                        itemCount: _store.screenData.emergencyPlaces.length,
                        shrinkWrap: true,
                        controller: _controller,
                        itemBuilder: (context, index) => Observer(
                          builder: (context) => Container(
                              padding: EdgeInsets.all(0.02.sw),
                              color: _store.destination ==
                                      _store.screenData.emergencyPlaces[index]
                                  ? Theme.of(context).primaryColor
                                  : index.isOdd
                                      ? const Color(0xffF7F7F7)
                                      : AppColors.white,
                              child: InkWell(
                                onTap: () {
                                  _store.onTapPlace(
                                      _store.screenData.emergencyPlaces[index]);
                                },
                                child: Row(
                                  children: [
                                    expand(
                                        flex: 2,
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Column(
                                            children: [
                                              Image.network(
                                                _store
                                                    .screenData
                                                    .emergencyPlaces[index]
                                                    .icon,
                                                width: 35,
                                                height: 35,
                                                color: _store.destination ==
                                                        _store.screenData
                                                                .emergencyPlaces[
                                                            index]
                                                    ? AppColors.white
                                                    : Theme.of(context)
                                                        .primaryColor,
                                              ),
                                              if (_store
                                                  .screenData
                                                  .emergencyPlaces[index]
                                                  .isOpen)
                                                StringProvider.currentlyOpen.text(
                                                    AppTextStyle
                                                        .rideSpecificDetailCountStyle
                                                        .copyWith(
                                                            color: AppColors
                                                                .Apple),
                                                    TextOverflow.ellipsis,
                                                    TextAlign.center),
                                              if (!_store
                                                  .screenData
                                                  .emergencyPlaces[index]
                                                  .isOpen)
                                                StringProvider.closedNow.text(
                                                    AppTextStyle
                                                        .rideSpecificDetailCountStyle,
                                                    TextOverflow.ellipsis,
                                                    TextAlign.center)
                                            ],
                                          ),
                                        ).paddings(all: 0.02.sw)),
                                    expand(
                                        flex: 8,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            _store.screenData
                                                .emergencyPlaces[index].name
                                                .text(AppTextStyle.btnTextStyle
                                                    .copyWith(
                                                        fontSize: 16.sp,
                                                        color: _store
                                                                    .destination ==
                                                                _store.screenData
                                                                        .emergencyPlaces[
                                                                    index]
                                                            ? AppColors.white
                                                            : AppColors.Gray))
                                                .paddings(bottom: 0.01.sw),
                                            _store.screenData
                                                .emergencyPlaces[index].address
                                                .text(AppTextStyle
                                                    .rideSpecificDetailCountStyle
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeightManager
                                                                .medium,
                                                        color: AppColors.Acadia,
                                                        fontSize: 12.sp)),
                                          ],
                                        ).paddings(all: 0.02.sw)),
                                  ],
                                ),
                              )),
                        ),
                      ),
                    )),
          expand(
              flex: 1,
              child: Align(
                child: AppButton(
                  onClick: _store.onProceed,
                  btnColor: AppColors.Acadia,
                  label: StringProvider.proceed,
                  child: StringProvider.proceed
                      .text(AppTextStyle.btnTextStyleWhite),
                ),
              ))
        ],
      ),
    );
  }
}
