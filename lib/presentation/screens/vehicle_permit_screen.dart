import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadu_ride_driver/core/common/dialog_state.dart';
import 'package:jadu_ride_driver/core/common/screen_wtih_extras.dart';
import 'package:jadu_ride_driver/helpers_impls/my_dialog_impl.dart';
import 'package:jadu_ride_driver/presentation/app_navigation/change_screen.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/dob_view.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/guideline_view.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/image_viewer.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/mcq_view.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/my_app_bar.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/my_text_input.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/progress_button.dart';
import 'package:jadu_ride_driver/presentation/screens/upload_image_view.dart';
import 'package:jadu_ride_driver/presentation/stores/uploader.dart';
import 'package:jadu_ride_driver/presentation/stores/vehicle_permit_screen_store.dart';
import 'package:jadu_ride_driver/presentation/ui/app_text_style.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';
import 'package:jadu_ride_driver/utills/app_date_picker.dart';
import 'package:jadu_ride_driver/utills/dialog_controller.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';
import 'package:jadu_ride_driver/utills/image_chooser_dialog.dart';
import 'package:mobx/mobx.dart';

class VehiclePermitScreen extends StatefulWidget {
  const VehiclePermitScreen({Key? key}) : super(key: key);

  @override
  State<VehiclePermitScreen> createState() => _VehiclePermitScreenState();
}

class _VehiclePermitScreenState extends State<VehiclePermitScreen> {
  late final VehiclePermitStore _store;
  late final List<ReactionDisposer> _disposers;
  late final DialogController _dialogController;

  @override
  void initState() {
    _store = VehiclePermitStore();
    _dialogController =
        DialogController(dialog: MyDialogImpl(buildContext: context));
    super.initState();

    _disposers = [
      reaction((p0) => _store.dialogManager.currentErrorState, (p0) {
        if (p0 is DialogState && p0 == DialogState.displaying) {
          _dialogController.show(_store.dialogManager.errorData!, p0,
              positive: _store.onError,
              close: _store.dialogManager.closeErrorDialog);
        }
      }),
      reaction((p0) => _store.dialogManager.filePickerState, (p0) {
        if (p0 is DialogState && p0 == DialogState.displaying) {
          ImageChooserDialog.showChooseDialog(context,
              fromCamera: _store.fromCamera,
              fromGallery: _store.fromGallery,
              onDismiss: _store.dialogManager.clearFilePicker);
        }
      }),
      reaction((p0) => _store.dialogManager.datePickerState, (p0) {
        if (p0 is DialogState && p0 == DialogState.displaying) {
          AppDatePicker.show(context, DateTime.now(), DateTime(1970),
              DateTime(2050), _store.onSelectDate,
              dismissed: _store.dialogManager.closeDatePicker);
        }
      }),
      reaction((p0) => _store.currentChange, (p0) {
        if (p0 != null && p0 is ScreenWithExtras) {
          ChangeScreen.from(context, p0.screen,
              result: p0.argument, onCompleted: _store.clear);
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
    return Scaffold(
      appBar: MyAppBar(),
      body: Column(
        children: [
          expand(flex: 1, child: _upperSideContent()),
          expand(flex: 9, child: _lowerSideContent())
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
        child: fitBox(
                child: StringProvider.vehiclePermit
                    .text(AppTextStyle.enterNumberStyle))
            .padding(
                insets: EdgeInsets.symmetric(
                    horizontal: 0.05.sw, vertical: 0.03.sw)),
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
                padding: EdgeInsets.symmetric(
                    horizontal: 0.05.sw, vertical: 0.05.sw),
                children: [
                  Observer(builder: (BuildContext context) {
                    return ImageViewer(
                        selectedImage: _store.selectedImage,
                        onClose: _store.clearImage);
                  }),
                  Observer(
                    builder: (BuildContext context) {
                      return McqView(
                          question: StringProvider.isYourVehiclePermitIssued,
                          value: _store.isIssued,
                          onClick: _store.onIssued);
                    },
                  ),
                  StringProvider.issuedDateOfVehiclePermit
                      .text(AppTextStyle.enterDrivingLicNumberStyle)
                      .padding(insets: EdgeInsets.only(bottom: 0.05.sw)),
                  Observer(
                    builder: (BuildContext context) {
                      return DobView(
                        onClick: _store.onChoose,
                        value: _store.selectedDate,
                        isMandatory: true,
                      ).padding(insets: EdgeInsets.only(bottom: 0.03.sw));
                    },
                  ),
                  StringProvider.pleaseEnterVehiclePermitNumber
                      .text(AppTextStyle.enterDrivingLicNumberStyle)
                      .padding(insets: EdgeInsets.only(bottom: 0.05.sw)),
                  MyTextInput(
                          onTextChange: _store.onVehiclePermit,
                          keyboardType: TextInputType.text,
                          inputAction: TextInputAction.done,
                          placeholderText: StringProvider.vehiclePermitNumber,
                          isMandatory: true)
                      .padding(insets: EdgeInsets.only(bottom: 0.02.sw)),
                  GuideLineView(guildLine: StringProvider.imageChooseGuidLine),
                  GuideLineView(guildLine: StringProvider.imageChooseGuidLine2)
                      .padding(insets: EdgeInsets.only(bottom: 0.03.sw)),
                  UploadImageView(
                      onClick: _store.onUpload,
                      title: StringProvider.uploadVehiclePermit)
                ],
              )),
          const Divider(
            color: AppColors.lightGray,
            height: 0.05,
          ),
          expand(
              flex: 2,
              child: Align(
                child: Observer(
                  builder: (BuildContext context) {
                    return ProgressButton(
                        enableBtn: _store.enableBtn,
                        uploader: _store.uploader,
                        onPress: _store.onDone);
                  },
                ),
              ))
        ],
      ),
    );
  }
}
