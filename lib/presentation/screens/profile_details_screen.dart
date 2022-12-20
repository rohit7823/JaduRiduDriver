 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jadu_ride_driver/core/common/app_route.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';
import 'package:mobx/mobx.dart';

import '../../core/common/dialog_state.dart';
import '../../core/common/gender_radio_button.dart';
import '../../core/common/profile_short_description.dart';
import '../../core/domain/package.dart';
import '../../helpers_impls/my_dialog_impl.dart';
import '../../utills/app_date_picker.dart';
import '../../utills/dialog_controller.dart';
import '../../utills/image_chooser_dialog.dart';
import '../custom_widgets/app_snack_bar.dart';
import '../custom_widgets/mobile_number_with_codes_text_field.dart';
import '../custom_widgets/my_app_bar_without_logo.dart';
import '../custom_widgets/my_profile_text_input.dart';
import '../custom_widgets/my_text_input.dart';
import '../custom_widgets/outline_drop_down.dart';
import '../stores/profile_details_description_view_model.dart';
import '../ui/app_button_themes.dart';
import '../ui/app_text_style.dart';
import '../ui/image_assets.dart';
import '../ui/string_provider.dart';
import '../ui/theme.dart';

class ProfileDetailsScreen extends StatefulWidget {
  ProfileDetailsScreen({Key? key, required this.profileShortDescription})
      : super(key: key);
  ProfileShortDescription profileShortDescription;

  @override
  State<ProfileDetailsScreen> createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {
  late final ProfileDescriptionStore _store;
  late final List<ReactionDisposer> _disposers;
  late final DialogController _dialogController;
  late final TextEditingController textEditingController;

  //String userName =

  @override
  void initState() {
    _store = ProfileDescriptionStore();
    textEditingController = TextEditingController();
    //_store.onSave();
    //debugPrint(widget.profileShortDescription.driverName);
    //debugPrint(widget.profileShortDescription.driverImageURL);
    _dialogController =
        DialogController(dialog: MyDialogImpl(buildContext: context));
    super.initState();
    _disposers = [
      reaction((p0) => _store.dialogManager.filePickerState, (p0) {
        if (p0 == DialogState.displaying) {
          ImageChooserDialog.showChooseDialog(context,
              fromCamera: _store.chooseFromCamera,
              fromGallery: _store.chooseFromGallery,
              onDismiss: _store.onClose);
        }
      }),
      reaction((p0) => _store.dialogManager.currentErrorState, (p0) {
        if (p0 is DialogState && p0 == DialogState.displaying) {
          _dialogController.show(_store.dialogManager.errorData!, p0,
              positive: _store.onError,
              close: _store.dialogManager.closeErrorDialog);
        }
      }),
      /*reaction((p0) => _store.currentChange, (p0) {
        if (p0 != null && p0 is ScreenWithExtras) {
          ChangeScreen.from(context, p0.screen,
              onCompleted: _store.clear, result: p0.argument);
        }
      }),*/
      reaction((p0) => _store.informMessage, (p0) {
        if (p0 is String && p0.isNotEmpty) {
          AppSnackBar.show(context, message: p0, clear: () {
            _store.informMessage = "";
          });
        }
      }),

      //another.............
      reaction((p0) => _store.selectedState, (p0) {
        if (p0 != null && p0 is Package) {
          _store.getDistricts();
        }
      }),
      reaction((p0) => _store.selectedDistrict, (p0) {
        if (p0 != null && p0 is Package) {
          _store.getCities();
        }
      }),
      reaction((p0) => _store.dialogManager.currentErrorState, (p0) {
        if (p0 is DialogState && p0 == DialogState.displaying) {
          _dialogController.show(_store.dialogManager.errorData!, p0,
              close: _store.dialogManager.closeErrorDialog,
              positive: _store.onRetry);
        }
      }),
      /*reaction((p0) => _store.currentChange, (p0) {
        if (p0 != null && p0 is ScreenWithExtras) {
          ChangeScreen.to(context, p0.screen, onComplete: _store.clear);
        }
      })*/
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBarWithOutLogo(
      ),
      body: SafeArea(
        child: Column(
          children: [
            expand(flex: 3, child: _upperSideContent()),
            expand(flex: 7, child: _lowerSideContent())
          ],
        ),
      ),
    );
  }

  Widget _upperSideContent() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Column(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.primary,
                 borderRadius: BorderRadius.only(bottomRight: Radius.circular(100.r))),
                child:Align(
                    alignment: Alignment.topLeft,
                    child: fitBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           StringProvider.manageProfile
                                  .text(AppTextStyle.enterNumberStyle),

                        ],
                      ).padding(
                        insets: EdgeInsets.symmetric(horizontal: 0.04.sw)
                      ),
                    ),
                  ),

              ),
            ),
            Expanded(
                flex: 3,
                child: Container(
                  color: AppColors.white,
                ))
          ],
        ),
        InkWell(
          onTap: _store.selectImage,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 0.02.sw),
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  padding: EdgeInsets.all(0.02.sw),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.white),
                  child: Observer(
                    builder: (BuildContext context) {
                      return _store.selectedImage != null
                          ? CircleAvatar(
                        radius: 0.15.sw,
                        backgroundColor: AppColors.lightGray,
                        foregroundImage: FileImage(_store.selectedImage!),
                      )
                          : _store.image.isNotEmpty
                          ? CircleAvatar(
                        radius: 0.15.sw,
                        foregroundImage: NetworkImage(_store.image),
                        backgroundColor: AppColors.lightGray,
                      )
                          : CircleAvatar(
                        radius: 0.15.sw,
                        foregroundImage: const AssetImage(
                            "assets/images/flag_india.png"),
                        backgroundColor: AppColors.lightGray,
                      );
                    },
                  ),
                ),


                Container(
                  padding: EdgeInsets.all(0.01.sw),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    border: Border.all(color: AppColors.Abbey),
                  ),
                  child: const Icon(
                    Icons.edit,
                    color: AppColors.appBlack,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
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
              padding:
                  EdgeInsets.symmetric(horizontal: 0.05.sw, vertical: 0.05.sw),
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 0.01.sw),
                  child: const Text("Name"),
                ),
                Observer(
                  builder: (BuildContext context) {
                    return MyTextInput(
                      key: ObjectKey(_store.gettingLoader),
                      onTextChange: _store.name,
                      inputAction: TextInputAction.next,
                      isMandatory: false,
                      keyboardType: TextInputType.name,
                      initialText: _store.userName,
                      placeholderText: StringProvider.enterYourName,
                    ).padding(insets: EdgeInsets.only(bottom: 0.04.sw));
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(left: 0.01.sw),
                  child: const Text("Email"),
                ),
                Observer(
                  builder: (BuildContext context) {
                    return MyTextInput(
                      key: ObjectKey(_store.gettingLoader),
                      onTextChange: _store.email,
                      inputAction: TextInputAction.next,
                      isMandatory: false,
                      keyboardType: TextInputType.emailAddress,
                      initialText: _store.userEmail,
                      placeholderText: StringProvider.enterYourEmail,
                    ).padding(insets: EdgeInsets.only(bottom: 0.04.sw));
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(left: 0.01.sw),
                  child: const Text("Phone"),
                ),
                Observer(
                  builder: (BuildContext context) {
                    return MobileNumberWithCodesTextField(
                            key: ObjectKey(_store.gettingLoader),
                            node: FocusNode(),
                            controller: TextEditingController(
                                text: _store.userMobileNumber),
                            onTextChange: _store.mobileNumber,
                            codes: _store.codes,
                            isMandatory: false,
                            onCodeSelect: _store.onNumberCode,
                            onNumberCleared: _store.mobileNumberCleared,
                            gettingLoader: _store.gettingLoader)
                        .padding(insets: EdgeInsets.only(bottom: 0.04.sw));
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(left: 0.01.sw),
                  child: const Text("State"),
                ),
                Observer(
                  builder: (BuildContext context) {
                    return OutlineDropDown(
                            items: _store.states,
                            onSelected: _store.onState,
                            placeHolder: StringProvider.notItems,
                            loader: _store.gettingLoader,
                            current: _store.selectedState)
                        .padding(insets: EdgeInsets.only(bottom: 0.04.sw));
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(left: 0.01.sw),
                  child: const Text("District"),
                ),
                Observer(
                  builder: (BuildContext context) {
                    return OutlineDropDown(
                            items: _store.districts,
                            onSelected: _store.onDistrict,
                            loader: _store.gettingDistrictsLoader,
                            placeHolder: StringProvider.notItems,
                            current: _store.selectedDistrict)
                        .padding(insets: EdgeInsets.only(bottom: 0.04.sw));
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(left: 0.01.sw),
                  child: Text("City"),
                ),
                Observer(
                  builder: (BuildContext context) {
                    return OutlineDropDown(
                            items: _store.cities,
                            onSelected: _store.onCity,
                            loader: _store.gettingCitiesLoader,
                            placeHolder: StringProvider.notItems,
                            current: _store.selectedCity)
                        .padding(insets: EdgeInsets.only(bottom: 0.04.sw));
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(left: 0.01.sw),
                  child: const Text("Select Gender"),
                ),
                Row(
                  children: [
                    Observer(
                      builder: (BuildContext context) {
                        return Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Radio(
                                value: GenderRadio.male,
                                groupValue: _store.selected,
                                onChanged: _store.onRadioSelected,
                                activeColor: Colors.black,
                              ),
                              const Text(
                                "Male",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: Colors.black),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                    Observer(
                      builder: (BuildContext context) {
                        return Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Radio(
                                value: GenderRadio.female,
                                groupValue: _store.selected,
                                onChanged: _store.onRadioSelected,
                                activeColor: Colors.black,
                              ),
                              const Text("Female",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      color: Colors.black))
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 0.01.sw),
                  child: const Text("Date Of Birth"),
                ),
                InkWell(
                  onTap: _store.openDatePicker,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        border: Border.all(color: AppColors.appGreens),
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0x1a000000),
                              blurRadius: 20,
                              spreadRadius: 0,
                              offset: Offset(0, 10))
                        ]),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 0.05.sw, horizontal: 0.05.sw),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 8,
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Observer(builder: (BuildContext context) {
                                    return Text(_store.finalCurrentDate,
                                        style: TextStyle(
                                            color: AppColors.secondaryVariant,
                                            fontSize: 16.sp));
                                  })
                                ],
                              ),
                            ),
                          ),
                          const Expanded(
                              flex: 1,
                              child: Icon(
                                Icons.date_range,
                                color: Colors.red,
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          expand(
              flex: 2,
              child: Align(
                alignment: Alignment.center,
                child: Observer(
                  builder: (BuildContext context) {
                    return ElevatedButton(
                        style: AppButtonThemes.defaultStyle.copyWith(
                            backgroundColor:
                                MaterialStateProperty.all(AppColors.Acadia)),
                        onPressed: _store.onSave,
                        child: _store.uploadingLoader
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                StringProvider.save,
                                style: AppTextStyle.btnTextStyleWhite,
                              ));
                  },
                ),
              ))
        ],
      ),
    );
  }
}
