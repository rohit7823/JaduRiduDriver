import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jadu_ride_driver/core/common/dialog_state.dart';
import 'package:jadu_ride_driver/core/common/screen_wtih_extras.dart';
import 'package:jadu_ride_driver/helpers_impls/my_dialog_impl.dart';
import 'package:jadu_ride_driver/modules/app_module.dart';
import 'package:jadu_ride_driver/presentation/app_navigation/change_screen.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/car_subtypes_view.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/my_app_bar.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/my_text_input.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/vehicle_categories_view.dart';
import 'package:jadu_ride_driver/presentation/stores/add_vehicle_screen_store.dart';
import 'package:jadu_ride_driver/presentation/stores/shared_store.dart';
import 'package:jadu_ride_driver/presentation/ui/app_button_themes.dart';
import 'package:jadu_ride_driver/presentation/ui/app_text_style.dart';
import 'package:jadu_ride_driver/presentation/ui/image_assets.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';
import 'package:jadu_ride_driver/utills/dialog_controller.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';
import 'package:mobx/mobx.dart';

class AddVechicleScreen extends StatefulWidget {
  SharedStore sharedStore;
  AddVechicleScreen({Key? key, required this.sharedStore}) : super(key: key);

  @override
  State<AddVechicleScreen> createState() => _AddVechicleScreenState();
}

class _AddVechicleScreenState extends State<AddVechicleScreen> {
  late final AddVehicleStore _store;
  late final DialogController _dialogController;
  late final List<ReactionDisposer> _disposers;

  @override
  void initState() {
    _store = AddVehicleStore();
    _dialogController =
        DialogController(dialog: MyDialogImpl(buildContext: context));
    super.initState();

    _disposers = [
      reaction((p0) => _store.currentChange, (p0) {
        if (p0 != null) {
          ChangeScreen.to(context, p0.screen, arguments: p0.argument, onComplete: _store.clear);
        }
      }),
      reaction((p0) => _store.dialogManager.currentErrorState, (p0) {
        if (p0 is DialogState && p0 == DialogState.displaying) {
          _dialogController.show(_store.dialogManager.errorData!, p0,
              positive: _store.onError,
              close: _store.dialogManager.closeErrorDialog);
        }
      }),
      reaction((p0) => _store.selectedCategory, (p0) {
        _store.addCar();
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: MyAppBar(),
      body: Column(
        children: [
          Expanded(flex: 2, child: _upperSideContent()),
          Expanded(flex: 8, child: _lowerSideContent())
        ],
      ),
    );
  }

  Widget _upperSideContent() {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(100.r))),
      child: Align(
        alignment: Alignment.topLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                flex: 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    fitBox(
                        child: StringProvider.addYourVehicle
                            .text(AppTextStyle.enterNumberStyle)
                            .padding(insets: EdgeInsets.only(bottom: 0.02.sw))),
                    fitBox(
                        child: StringProvider.pleaseEnterTheRequiredField
                            .text(AppTextStyle.enterNumberSubHeadingStyle))
                  ],
                )),
            Expanded(
                flex: 2,
                child: fitBox(
                  child: SvgPicture.asset(
                    ImageAssets.userCar,
                    width: 0.20.sw,
                    height: 0.20.sw,
                  ),
                ))
          ],
        ).padding(
            insets:
                EdgeInsets.symmetric(horizontal: 0.05.sw, vertical: 0.03.sw)),
      ),
    );
  }

  Widget _lowerSideContent() {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          expand(
              flex: 8,
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 0.05.sw),
                children: [
                  Observer(builder: (context) {
                    return VehicleCategoriesView(
                            categories: _store.vCategories,
                            onSelected: _store.onSelectCategory,
                            placeHolder: "no items",
                            loader: _store.gettingDataLoader,
                            current: _store.selectedCategory)
                        .padding(
                            insets: EdgeInsets.symmetric(vertical: 0.05.sw));
                  }),
                  Observer(builder: (context) {
                    return CarCategoriesView(
                            ccategories: _store.carCategories,
                            onSelectedcar: _store.onSelectcarCategory,
                            carplaceHolder: "no items",
                            carloader: _store.addingcLoader,
                            currentcar: _store.selectcar)
                        .padding(
                            insets: EdgeInsets.symmetric(vertical: 0.05.sw));
                  }),
                  Observer(
                    builder: (context) => MyTextInput(
                        onTextChange: _store.onVehicleNumber,
                        placeholderText: StringProvider.vehicleNumber,
                        keyboardType: TextInputType.text,
                        inputAction: TextInputAction.done,
                        textCapitalization: TextCapitalization.characters,
                        isMandatory: !_store.vehicleNumber.isNotEmpty
                    ),
                  )
                ],
              )),
          expand(
              flex: 2,
              child: Align(
                child: Observer(builder: (context) {
                  return ElevatedButton(
                      onPressed: _store.enableBtn ? _store.addVehicle : null,
                      style: _store.enableBtn
                          ? AppButtonThemes.defaultStyle
                          : AppButtonThemes.cancelBtnStyle,
                      child: _store.addingLoader
                          ? const CircularProgressIndicator(
                              color: AppColors.white,
                            )
                          : StringProvider.continuee
                              .text(AppTextStyle.btnTextStyleWhite));
                }),
              ))
        ],
      ),
    );
  }
}
