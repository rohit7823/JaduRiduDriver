import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadu_ride_driver/presentation/app_navigation/sereen_argument_models/emergency_screen_argument.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/emgency_ride_location_widget.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/navigate_back.dart';
import 'package:jadu_ride_driver/presentation/stores/emergency_place_store.dart';
import 'package:jadu_ride_driver/presentation/ui/app_text_style.dart';
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
    _disposers = [
      reaction((p0) => _store.scrollToIdx, (p0) {
        debugPrint(
            "scrollToIndex ${_controller.positions.elementAt(p0).minScrollExtent}");
        _controller.animateTo(
            _controller.positions.elementAt(p0).minScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.bounceInOut);
      })
    ];
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
              flex: 7,
              child: Container(
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
                  itemBuilder: (context, index) => Container(
                      padding: EdgeInsets.all(0.02.sw),
                      color: index.isOdd
                          ? const Color(0xffF7F7F7)
                          : AppColors.white,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: index == 0
                                ? BorderRadius.only(
                                    topLeft: Radius.circular(16.r),
                                    topRight: Radius.circular(16.r))
                                : BorderRadius.zero),
                        child: Material(
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
                                            _store.screenData
                                                .emergencyPlaces[index].icon,
                                            width: 35,
                                            height: 35,
                                          ),
                                          if (_store.screenData
                                              .emergencyPlaces[index].isOpen)
                                            StringProvider.currentlyOpen.text(
                                                AppTextStyle
                                                    .rideSpecificDetailCountStyle
                                                    .copyWith(
                                                        color: AppColors.Apple),
                                                TextOverflow.ellipsis,
                                                TextAlign.center),
                                          if (!_store.screenData
                                              .emergencyPlaces[index].isOpen)
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
                                        _store.screenData.emergencyPlaces[index]
                                            .name
                                            .text(AppTextStyle.btnTextStyle
                                                .copyWith(fontSize: 16.sp))
                                            .paddings(bottom: 0.01.sw),
                                        _store.screenData.emergencyPlaces[index]
                                            .address
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
                          ),
                        ),
                      )),
                ),
              ))
        ],
      ),
    );
  }
}
