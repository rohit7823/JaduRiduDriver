import 'dart:io';

import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jadu_ride_driver/core/helpers/file_picker.dart';
import 'package:jadu_ride_driver/modules/app_module.dart';
import '../presentation/ui/string_provider.dart';
import '../presentation/ui/theme.dart';

class ImageFilePicker implements FilePicker {
  final _imagePicker = dependency<ImagePicker>();
  final _cropper = dependency<ImageCropper>();

  @override
  Future<File?> chooseFromGallery() async {
    var result = await _imagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 70);
    return await _processFile(result);
  }

  @override
  Future clickViaCamera() async {
    var result = await _imagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 70);
    return await _processFile(result);
  }

  Future<File?> _processFile(XFile? result) async {
    if (result != null) {
      var croppedFile = await _cropper
          .cropImage(sourcePath: result.path, aspectRatioPresets: [
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

      if (croppedFile != null) {
        return File(croppedFile.path);
      }
    }

    return null;
  }
}
