import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadu_ride_driver/core/common/dialog_state.dart';
import 'package:jadu_ride_driver/core/common/screen_wtih_extras.dart';
import 'package:jadu_ride_driver/helpers_impls/my_dialog_impl.dart';
import 'package:jadu_ride_driver/modules/app_module.dart';
import 'package:jadu_ride_driver/presentation/app_navigation/change_screen.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/guideline_view.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/image_viewer.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/my_text_input.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/progress_button.dart';
import 'package:jadu_ride_driver/presentation/screens/upload_image_view.dart';
import 'package:jadu_ride_driver/presentation/stores/audit_general_store.dart';
import 'package:jadu_ride_driver/presentation/stores/car_inside_store.dart';
import 'package:jadu_ride_driver/presentation/stores/left_side_exterior_store.dart';
import 'package:jadu_ride_driver/presentation/stores/number_plate_store.dart';
import 'package:jadu_ride_driver/presentation/stores/chasis_number_screen_store.dart';
import 'package:jadu_ride_driver/presentation/stores/right_side_exterior_store.dart';
import 'package:jadu_ride_driver/presentation/stores/uploader.dart';
import 'package:jadu_ride_driver/presentation/ui/app_text_style.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';
import 'package:jadu_ride_driver/utills/dialog_controller.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';
import 'package:jadu_ride_driver/utills/image_chooser_dialog.dart';
import 'package:mobx/mobx.dart';

class AuditGeneralScreen extends StatefulWidget {
  final Store storeInstance;
  const AuditGeneralScreen({Key? key, required this.storeInstance})
      : super(key: key);

  @override
  State<AuditGeneralScreen> createState() => _AuditGeneralScreenState();
}

class _AuditGeneralScreenState extends State<AuditGeneralScreen> {
  late final Store _store;
  late final List<ReactionDisposer> _disposers;
  late final AuditGeneralStore _auditGeneralStore;
  late final DialogController _dialogController;

  @override
  void initState() {
    _store = widget.storeInstance;
    _auditGeneralStore = AuditGeneralStore(_store);
    _dialogController =
        DialogController(dialog: MyDialogImpl(buildContext: context));
    super.initState();
    _disposers = [
      reaction((p0) => _auditGeneralStore.dialogManager.filePickerState, (p0) {
        if (p0 is DialogState && p0 == DialogState.displaying) {
          ImageChooserDialog.showChooseDialog(context,
              fromCamera: _auditGeneralStore.fromCamera,
              fromGallery: _auditGeneralStore.fromGallery,
              onDismiss: _auditGeneralStore.dialogManager.clearFilePicker);
        }
      }),
      reaction((p0) => _auditGeneralStore.dialogManager.currentErrorState,
          (p0) {
        if (p0 is DialogState && p0 == DialogState.displaying) {
          _dialogController.show(
              _auditGeneralStore.dialogManager.errorData!, p0,
              close: _auditGeneralStore.dialogManager.closeErrorDialog,
              positive: _auditGeneralStore.onError);
        }
      }),
      reaction((p0) => _auditGeneralStore.currentChange, (p0) {
        if (p0 != null && p0 is ScreenWithExtras) {
          ChangeScreen.from(context, p0.screen,
              result: p0.argument, onCompleted: _auditGeneralStore.clear);
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
    return Column(
      children: [
        expand(flex: 1, child: _upperSideContent()),
        expand(flex: 9, child: _lowerSideContent())
      ],
    );
  }

  Widget _upperSideContent() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(100.r),
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r)),
      ),
      child: Align(
        alignment: Alignment.topLeft,
        child: fitBox(
            child: _provideTitle().text(AppTextStyle.enterNumberStyle).padding(
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
                padding: EdgeInsets.symmetric(
                    horizontal: 0.05.sw, vertical: 0.04.sw),
                children: [
                  Observer(
                    builder: (BuildContext context) {
                      return ImageViewer(
                          selectedImage: _auditGeneralStore.selectedImage,
                          onClose: _auditGeneralStore.onClose);
                    },
                  ),
                  _provideChasisNumberInputSection(),
                  GuideLineView(guildLine: StringProvider.imageChooseGuidLine),
                  GuideLineView(guildLine: StringProvider.imageChooseGuidLine2),
                  UploadImageView(
                    onClick: _auditGeneralStore.onUpload,
                    title: '${StringProvider.upload} ${_provideTitle()}',
                  )
                ],
              )),
          const Divider(color: AppColors.lightGray, height: 0.05),
          expand(
              flex: 2,
              child: Align(
                child: Observer(
                  builder: (BuildContext context) {
                    return ProgressButton(
                      enableBtn: _auditGeneralStore.enableBtn,
                      onPress: _auditGeneralStore.onDone,
                      uploader: _auditGeneralStore.uploader,
                    );
                  },
                ),
              ))
        ],
      ),
    );
  }

  Widget _provideChasisNumberInputSection() {
    if (_store is ChasisNumberStore) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StringProvider.enterChaisNumber
              .text(AppTextStyle.enterDrivingLicNumberStyle)
              .padding(insets: EdgeInsets.only(bottom: 0.03.sw)),
          Observer(
            builder: (BuildContext context) {
              return MyTextInput(
                      onTextChange: _auditGeneralStore.onChasisNumber,
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.done,
                      initialText: _auditGeneralStore.chasisNumber,
                      placeholderText: StringProvider.chasisNumber,
                      isMandatory: true)
                  .padding(insets: EdgeInsets.only(bottom: 0.03.sw));
            },
          ),
        ],
      );
    }

    return const SizedBox.shrink();
  }

  String _provideTitle() {
    if (_store is ChasisNumberStore) {
      return StringProvider.chasisNumberImage;
    } else if (_store is NumberPlateStore) {
      return StringProvider.backSideWithNumberPlate;
    } else if (_store is LSExteriorStore) {
      return StringProvider.leftSideExterior;
    } else if (_store is RSExteriorStore) {
      return StringProvider.rightSideExterior;
    } else if (_store is InsideCarStore) {
      return StringProvider.carInside;
    }

    return "";
  }
}
