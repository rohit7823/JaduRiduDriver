import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_place/google_place.dart';
import 'package:jadu_ride_driver/core/common/dialog_state.dart';
import 'package:jadu_ride_driver/core/common/navigation_option.dart';
import 'package:jadu_ride_driver/helpers_impls/my_dialog_impl.dart';
import 'package:jadu_ride_driver/presentation/app_navigation/change_screen.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/my_app_bar.dart';
import 'package:jadu_ride_driver/presentation/ui/app_text_style.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';
import 'package:jadu_ride_driver/utills/dialog_controller.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';
import 'package:mobx/mobx.dart';
import '../../core/common/screen.dart';
import '../../core/common/screen_wtih_extras.dart';
import '../stores/select_location_store.dart';

class SelectLocationScreen extends StatefulWidget {
  final LatLon currentLocation;

  const SelectLocationScreen({Key? key, required this.currentLocation})
      : super(key: key);

  @override
  State<SelectLocationScreen> createState() => _SelectLocationScreenState();
}

class _SelectLocationScreenState extends State<SelectLocationScreen> {
  late final SelectLocationStore _store;
  late final List<ReactionDisposer> _disposers;
  late final TextEditingController _editingController;
  late final DialogController controller;

  @override
  void initState() {
    _store = SelectLocationStore(widget.currentLocation);
    _editingController = TextEditingController();
    controller = DialogController(dialog: MyDialogImpl(buildContext: context));
    super.initState();

    _disposers = [
      reaction((p0) => _store.currentChange, (p0) {
        if (p0 != null) {
          debugPrint("arguemnt ${p0.argument}");
          ChangeScreen.from(context, p0.screen,
              onCompleted: _store.clear, result: p0.argument);
        }
      }),
      reaction((p0) => _store.selected, (p0) {
        if (p0 != null) {
          _store.onDone(p0);
        }
      }),
      /*reaction((p0) => _store.dialogManager.currentErrorState, (p0) {
        if(p0 == DialogState.displaying) {
          controller.show(_store.dialogManager.errorData!, p0, close: _store.dialogManager.closeErrorDialog);
        }
      })*/
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
    return WillPopScope(
      onWillPop: () async {
        _store.onChange(ScreenWithExtras(
            screen: Screen.dashBoard,
            argument: false,
            option: NavigationOption(option: Option.none)));
        return false;
      },
      child: Scaffold(
        appBar: MyAppBar(
          isPop: true,
          onPop: () {
            _store.onChange(ScreenWithExtras(
                screen: Screen.dashBoard,
                argument: false,
                option: NavigationOption(option: Option.none)));
          },
        ),
        body: Column(
          children: [
            TextField(
              style: AppTextStyle.mcqTextStyle,
              maxLines: 1,
              onChanged: _store.onSearchQuery,
              controller: _editingController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                suffixIcon: Material(
                    child: InkWell(
                        onTap: () {
                          _editingController.text = "";
                          _store.onSearchQuery("");
                        },
                        child: const Icon(Icons.close))),
                contentPadding: EdgeInsets.all(0.03.sw),
                hintText: StringProvider.searchHere,
                hintStyle: AppTextStyle.placerHolderStyle,
                enabledBorder: const UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColors.appBlack), //<-- SEE HERE
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primary), //<-- SEE HERE
                ),
              ),
            ).paddings(horizontal: 0.05.sw, vertical: 0.05.sw),
            expand(
                flex: 1,
                child: Observer(
                  builder: (context) => AnimatedCrossFade(
                      firstChild: Center(
                        child: _store.noDataNotify?.text(),
                      ),
                      secondChild: _store.predictions.isNotEmpty
                          ? ListView.separated(
                              itemBuilder: (context, index) =>
                                  predictionItem(_store.predictions[index]),
                              separatorBuilder: (context, index) => SizedBox(
                                    height: 0.01.sw,
                                  ),
                              itemCount: _store.predictions.length)
                          : const SizedBox.shrink(),
                      crossFadeState: _store.noDataNotify == null
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                      duration: const Duration(milliseconds: 500)),
                ))
          ],
        ),
      ),
    );
  }

  Widget predictionItem(AutocompletePrediction prediction) => Material(
        child: InkWell(
          onTap: () {
            _store.onSelectPrediction(prediction);
          },
          child: Container(
            width: 0.05.sw,
            padding: EdgeInsets.all(0.05.sw),
            child: Row(
              children: [
                Column(
                  children: [
                    const Icon(Icons.place),
                    if (prediction.distanceMeters != null)
                      Text(meterToKM(prediction.distanceMeters!)),
                  ],
                ).paddings(right: 0.05.sw),
                expand(flex: 1, child: Text(prediction.description!))
              ],
            ),
          ),
        ),
      );

  String meterToKM(int meter) {
    var distanceString = "";
    if (meter > -1 && meter < 1000) {
      distanceString = "${meter.toInt()} M";
    } else if (meter > 1000) {
      var km = roundDouble(meter / 1000, 1);
      if (km > 200) {
        distanceString = "";
      } else {
        distanceString = "$km KM";
      }
    }

    return distanceString;
  }


  double roundDouble(double value, int places) {
    num mod = pow(10.0, places);
    return ((value * mod).round().toDouble() / mod);
  }
}
