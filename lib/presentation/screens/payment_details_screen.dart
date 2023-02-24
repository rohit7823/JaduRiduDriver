import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jadu_ride_driver/core/common/dialog_state.dart';
import 'package:jadu_ride_driver/core/common/screen_wtih_extras.dart';
import 'package:jadu_ride_driver/helpers_impls/my_dialog_impl.dart';
import 'package:jadu_ride_driver/presentation/app_navigation/change_screen.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/app_snack_bar.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/image_viewer.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/my_app_bar.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/payment_method_drop_down.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/progress_button.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/upi_id_text_field.dart';
import 'package:jadu_ride_driver/presentation/stores/payment_details_store.dart';
import 'package:jadu_ride_driver/presentation/ui/app_text_style.dart';
import 'package:jadu_ride_driver/presentation/ui/image_assets.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';
import 'package:jadu_ride_driver/utills/dialog_controller.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';
import 'package:jadu_ride_driver/utills/image_chooser_dialog.dart';
import 'package:mobx/mobx.dart';

class PaymentDetailsScreen extends StatefulWidget {
  const PaymentDetailsScreen({Key? key}) : super(key: key);

  @override
  State<PaymentDetailsScreen> createState() => _PaymentDetailsScreenState();
}

class _PaymentDetailsScreenState extends State<PaymentDetailsScreen> {
  late final PaymentDetailStore _store;
  late final List<ReactionDisposer> _disposers;
  late final DialogController _controller;
  late final TextEditingController _editingController;

  @override
  void initState() {
    _store = PaymentDetailStore();
    _editingController = TextEditingController(text: _store.upiID);
    _controller = DialogController(dialog: MyDialogImpl(buildContext: context));
    super.initState();

    _disposers = [
      reaction((p0) => _store.currentChange, (p0) {
        if (p0 != null && p0 is ScreenWithExtras) {
          ChangeScreen.from(context, p0.screen,
              result: p0.argument, onCompleted: _store.clear);
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
      reaction((p0) => _store.dialogManager.currentErrorState, (p0) {
        if (p0 is DialogState && p0 == DialogState.displaying) {
          _controller.show(_store.dialogManager.errorData!, p0,
              positive: _store.onError,
              close: _store.dialogManager.closeErrorDialog);
        }
      }),
      reaction((p0) => _store.informMessage, (p0) {
        if (p0 is String && p0.isNotEmpty) {
          AppSnackBar.show(context, message: p0, clear: () {
            _store.informMessage = "";
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
            child: StringProvider.paymentDetails
                .text(AppTextStyle.enterNumberStyle)
                .padding(
                    insets: EdgeInsets.symmetric(
                        horizontal: 0.05.sw, vertical: 0.03.sw))),
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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    DefaultPaymentMethodView(current: _store.methods.first)
                        .padding(insets: EdgeInsets.only(top: 0.05.sw)),
                    Padding(
                      padding: EdgeInsets.only(top: 0.10.sw, bottom: 0.07.sw),
                      child: Container(
                          width: 1.sw,
                          height: 0.03.sw,
                          color: AppColors.lightPink),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: fitBox(
                        child: StringProvider.provideYourAlternatePaymentDetails
                            .text(AppTextStyle.requiredStepsStyle)
                            .padding(
                                insets: EdgeInsets.only(
                                    bottom: 0.04.sw, left: 0.05.sw)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 0.05.sw),
                      child: Observer(builder: (BuildContext context) {
                        return UpiIdTextField(
                          key: ValueKey(_store.prefillLoader),
                          upiIds: _store.upis,
                          loading: _store.gettingUpisLoader,
                          onSelect: _store.onSelectUpi,
                          selected: _store.selectedUpi,
                          onChange: _store.onUpiId,
                          controller: _editingController,
                          placeHolder: StringProvider.enterUpiId,
                          upiValidationLabel: _store.upiStatusLabel,
                        );
                      }),
                    ),
                    fitBox(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 0.05.sw),
                        child: InkWell(
                          overlayColor: MaterialStateProperty.all(
                              AppColors.primaryVariant.withOpacity(.5)),
                          borderRadius: BorderRadius.circular(16.r),
                          onTap: _store.openImagePicker,
                          child: Container(
                            width: 0.90.sw,
                            padding: EdgeInsets.all(.05.sw),
                            decoration: BoxDecoration(
                              color: AppColors.white.withOpacity(.9),
                              borderRadius: BorderRadius.circular(16.r),
                              boxShadow: const [
                                BoxShadow(
                                  color: AppColors.lightGray,
                                  offset: Offset(
                                    5.0,
                                    5.0,
                                  ),
                                  blurRadius: 10.0,
                                  spreadRadius: 2.0,
                                ), //BoxShadow
                                BoxShadow(
                                  color: AppColors.lightGray,
                                  offset: Offset(0.0, 0.0),
                                  blurRadius: 0.0,
                                  spreadRadius: 0.0,
                                ), //BoxShadow
                              ],
                            ),
                            child: Row(
                              children: [
                                expand(
                                    flex: 9,
                                    child: StringProvider.uploadQrCode.text(
                                        AppTextStyle.detailsTypeItemTextStyle)),
                                expand(
                                    flex: 1,
                                    child: SvgPicture.asset(
                                      ImageAssets.upload,
                                      color: AppColors.Gray,
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Observer(builder: (BuildContext context) {
                      return ImageViewer(
                          selectedImage: _store.selectedImage,
                          onClose: _store.clearSelectedImage);
                    })
                  ],
                ),
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
