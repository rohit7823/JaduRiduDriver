import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jadu_ride_driver/core/common/dialog_state.dart';
import 'package:jadu_ride_driver/core/common/screen_wtih_extras.dart';
import 'package:jadu_ride_driver/helpers_impls/my_dialog_impl.dart';
import 'package:jadu_ride_driver/modules/app_module.dart';
import 'package:jadu_ride_driver/presentation/app_navigation/change_screen.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/app_snack_bar.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/dob_view.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/guideline_view.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/image_viewer.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/invalid_input.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/my_app_bar.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/my_text_input.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/progress_button.dart';
import 'package:jadu_ride_driver/presentation/screens/upload_image_view.dart';
import 'package:jadu_ride_driver/presentation/stores/driver_license_screen_store.dart';
import 'package:jadu_ride_driver/presentation/stores/uploader.dart';
import 'package:jadu_ride_driver/presentation/ui/app_text_style.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';
import 'package:jadu_ride_driver/utills/app_date_picker.dart';
import 'package:jadu_ride_driver/utills/dialog_controller.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';
import 'package:jadu_ride_driver/utills/image_chooser_dialog.dart';
import 'package:mobx/mobx.dart';

class DriverLicenseScreen extends StatefulWidget {
  const DriverLicenseScreen({Key? key}) : super(key: key);

  @override
  State<DriverLicenseScreen> createState() => _DriverLicenseScreenState();
}

class _DriverLicenseScreenState extends State<DriverLicenseScreen> {
  late final DriverLicenseStore _store;
  late final List<ReactionDisposer> _disposers;
  late final DialogController _dialogController;

  @override
  void initState() {
    _store = DriverLicenseStore();
    _dialogController =
        DialogController(dialog: MyDialogImpl(buildContext: context));
    super.initState();

    _disposers = [
      reaction((p0) => _store.imagePicker, (p0) {
        if (p0 is DialogState && p0 == DialogState.displaying) {
          ImageChooserDialog.showChooseDialog(context,
              fromCamera: _store.fromCamera,
              fromGallery: _store.fromGallery, onDismiss: () {
            _store.imagePicker = DialogState.notDisplaying;
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
      reaction((p0) => _store.currentChange, (p0) {
        if (p0 != null && p0 is ScreenWithExtras) {
          ChangeScreen.from(context, p0.screen,
              result: p0.argument, onCompleted: _store.clear);
        }
      }),
      reaction((p0) => _store.informMessage, (p0) {
        if (p0 is String && p0.isNotEmpty) {
          AppSnackBar.show(context, message: p0, clear: () {
            _store.informMessage = "";
          });
        }
      }),
      reaction((p0) => _store.dialogManager.datePickerState, (p0) {
        if (p0 is DialogState && p0 == DialogState.displaying) {
          AppDatePicker.show(context, DateTime.now(), DateTime(2000),
              DateTime(2050), _store.onSelectDate,
              dismissed: _store.dialogManager.closeDatePicker);
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
            child: StringProvider.driverLicense
                .text(AppTextStyle.enterNumberStyle)
                .padding(
                    insets: EdgeInsets.symmetric(
                        horizontal: 0.05.sw, vertical: 0.03.sw))),
      ),
    );
  }

  Widget _lowerSideContent() {
    return Align(
      child: Column(
        children: [
          expand(
            flex: 8,
            child: ListView(
              padding:
                  EdgeInsets.symmetric(horizontal: 0.05.sw, vertical: 0.05.sw),
              children: [
                Observer(
                  builder: (BuildContext context) {
                    return ImageViewer(
                        selectedImage: _store.selectedImage,
                        onClose: _store.onClose);
                  },
                ),
                StringProvider.pleaseEnterDrivingLicenseNumber
                    .text(AppTextStyle.enterDrivingLicNumberStyle)
                    .padding(insets: EdgeInsets.only(bottom: 0.05.sw)),
                Observer(
                  builder: (context) => MyTextInput(
                      key: ValueKey(_store.prefillLoader),
                      onTextChange: _store.driverLicense,
                      keyboardType: TextInputType.streetAddress,
                      inputAction: TextInputAction.next,
                      placeholderText: StringProvider.driverLicenseNumber,
                      initialText: _store.license,
                      isMandatory: !_store.license.isNotEmpty),
                ).padding(insets: EdgeInsets.only(bottom: 0.05.sw)),
                Observer(
                  builder: (context) => MyTextInput(
                      key: ValueKey(_store.prefillLoader),
                      onTextChange: _store.repeatedDriverLicense,
                      keyboardType: TextInputType.streetAddress,
                      inputAction: TextInputAction.done,
                      placeholderText:
                          StringProvider.reEnterDriverLicenseNumber,
                      initialText: _store.reEnteredLicense,
                      isMandatory: !_store.reEnteredLicense.isNotEmpty),
                ),
                Observer(
                  builder: (BuildContext context) {
                    return InvalidInput(invalidText: _store.warnMessage);
                  },
                ),
                StringProvider.expiryDateOfLicense
                    .text(AppTextStyle.enterDrivingLicNumberStyle)
                    .padding(
                        insets: EdgeInsets.only(top: 0.05.sw, bottom: 0.03.sw)),
                Observer(
                  builder: (BuildContext context) {
                    return DobView(
                      value: _store.selectedDate,
                      onClick: _store.openDatePicker,
                      isMandatory: _store.selectedDate != StringProvider.expiry
                          ? false
                          : true,
                    );
                  },
                ),
                GuideLineView(guildLine: StringProvider.imageChooseGuidLine),
                GuideLineView(guildLine: StringProvider.imageChooseGuidLine2),
                UploadImageView(
                  title: StringProvider.uploadDriverLicense,
                  onClick: _store.openImageChoosingDialog,
                )
              ],
            ),
          ),
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
