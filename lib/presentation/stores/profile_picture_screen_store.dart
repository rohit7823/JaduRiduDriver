import 'dart:io';
import 'package:flutter/material.dart';
import 'package:jadu_ride_driver/core/common/alert_action.dart';
import 'package:jadu_ride_driver/core/common/alert_behaviour.dart';
import 'package:jadu_ride_driver/core/common/alert_data.dart';
import 'package:jadu_ride_driver/core/common/alert_option.dart';
import 'package:jadu_ride_driver/core/common/dialog_state.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/common/screen.dart';
import 'package:jadu_ride_driver/core/common/screen_wtih_extras.dart';
import 'package:jadu_ride_driver/core/common/uploader_implementation.dart';
import 'package:jadu_ride_driver/core/helpers/storage.dart';
import 'package:jadu_ride_driver/core/repository/profile_picture_repository.dart';
import 'package:jadu_ride_driver/modules/app_module.dart';
import 'package:jadu_ride_driver/presentation/stores/navigator.dart';
import 'package:jadu_ride_driver/presentation/stores/uploader.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';
import 'package:jadu_ride_driver/utills/dialog_manager.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';
import 'package:mobx/mobx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

part 'profile_picture_screen_store.g.dart';

class ProfilePictureStore = _ProfilePictureScreenStore
    with _$ProfilePictureStore;

abstract class _ProfilePictureScreenStore extends AppNavigator with Store {
  final _repository = dependency<ProfilePictureRepository>();
  final _storage = dependency<Storage>();
  final dialogManager = DialogManager();
  final uploader = Uploader(implementation: UploaderImplementation.real);
  late final ImagePicker _picker;
  late final ImageCropper _cropper;

  @observable
  bool enableBtn = false;

  @observable
  String informMessage = "";

  _ProfilePictureScreenStore() {
    _validateInputs();
    _picker = ImagePicker();
    _cropper = ImageCropper();
  }

  @observable
  DialogState openImagePicker = DialogState.notDisplaying;

  @observable
  File? selectedImage;

  @action
  prefillData() async {;
    var response = await _repository.setImage(_storage.userId());
    if(response.data != null) {
      response.data.forEach((key, value) async {
        if(key == "assets") {
          selectedImage = await urlToFile(value);
        }
      });
    }
  }

  @action
  selectImage() {
    openImagePicker = DialogState.displaying;
  }

  @action
  chooseFromCamera() async {
    var image =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 80);

    if (image != null) {
      var croppedImage = await _cropImage(image);
      if (croppedImage != null) {
        selectedImage = File(croppedImage.path);
        debugPrint(
            "selected from camera: ${selectedImage?.path} mime type: ${selectedImage?.absolute}");
      }
    } else {
      debugPrint("image not chosen");
    }
  }

  @action
  chooseFromGallery() async {
    var image =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

    if (image != null) {
      var croppedImage = await _cropImage(image);
      if (croppedImage != null) {
        selectedImage = File(croppedImage.path);
        debugPrint(
            "selected from gallery: ${selectedImage?.path} mime type: ${selectedImage?.absolute}");
      }
    } else {
      debugPrint("image not chosen");
    }
  }

  @action
  onClose() {
    openImagePicker = DialogState.notDisplaying;
  }

  Future<CroppedFile?> _cropImage(XFile image) async {
    return await _cropper
        .cropImage(sourcePath: image.path, aspectRatioPresets: [
      CropAspectRatioPreset.square,
      CropAspectRatioPreset.ratio3x2,
      CropAspectRatioPreset.original,
      CropAspectRatioPreset.ratio4x3,
      CropAspectRatioPreset.ratio16x9
    ], uiSettings: [
      AndroidUiSettings(
        statusBarColor: AppColors.primary,
        toolbarTitle: StringProvider.crop,
        initAspectRatio: CropAspectRatioPreset.original,
        lockAspectRatio: false,
      ),
      IOSUiSettings(
        aspectRatioLockEnabled: false,
        title: StringProvider.crop,
      )
    ]);
  }

  @action
  clearImage() {
    selectedImage = null;
  }

  @action
  _validateInputs() async {
    while (true) {
      await Future.delayed(const Duration(milliseconds: 300));
      if (selectedImage == null) {
        enableBtn = false;
      } else {
        enableBtn = true;
      }
    }
  }

  @action
  onDone() async {
    var userId = _storage.userId();
    var response =
        await _repository.uploadImage(userId, selectedImage!, uploader.start);
    if (response is Success) {
      var data = response.data;

      switch (data != null && data.status) {
        case true:
          if (data!.isUploaded) {
            informMessage = data.message;
            onChange(ScreenWithExtras(
                screen: Screen.addAllDetails, argument: data.isUploaded));
          } else {
            dialogManager.initErrorData(AlertData(
                StringProvider.error,
                null,
                StringProvider.appId,
                data.message,
                StringProvider.retry,
                null,
                null,
                AlertBehaviour(
                    option: AlertOption.none,
                    action: AlertAction.uploadProfileImage)));
          }
          break;
        default:
          dialogManager.initErrorData(AlertData(
              StringProvider.error,
              null,
              StringProvider.appId,
              data?.message ?? "",
              StringProvider.retry,
              null,
              null,
              AlertBehaviour(
                  option: AlertOption.none,
                  action: AlertAction.uploadProfileImage)));
      }
    } else if (response is Error) {
      dialogManager.initErrorData(AlertData(
          StringProvider.error,
          null,
          StringProvider.appId,
          response.message ?? "",
          StringProvider.retry,
          null,
          null,
          AlertBehaviour(
              option: AlertOption.invokeOnBarrier,
              action: AlertAction.uploadProfileImage)));
    }
  }

  onError(AlertAction? action) {
    if (action == AlertAction.uploadProfileImage) {
      onDone();
    }
  }
}
