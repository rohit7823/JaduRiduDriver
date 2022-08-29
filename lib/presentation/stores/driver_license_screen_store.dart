import 'dart:io';

import 'package:jadu_ride_driver/core/repository/driver_license_repository.dart';
import 'package:jadu_ride_driver/modules/app_module.dart';
import 'package:jadu_ride_driver/presentation/stores/uploader.dart';
import 'package:mobx/mobx.dart';

part 'driver_license_screen_store.g.dart';

class DriverLicenseStore = _DriverLicenseScreenStore with _$DriverLicenseStore;

abstract class _DriverLicenseScreenStore with Store {
  final _repository = dependency<DriverLicenseRepository>();
  final uploader = Uploader();

  @observable
  String license = "";

  @observable
  String reEnteredLicense = "";

  @observable
  bool enableBtn = false;

  @observable
  File? selectedImage;

  _DriverLicenseScreenStore() {
    _validateInputs();
  }

  @action
  _validateInputs() async {
    while (true) {
      await Future.delayed(const Duration(milliseconds: 300));
      if (license.isEmpty) {
        enableBtn = false;
      } else if (reEnteredLicense.isNotEmpty) {
        enableBtn = false;
      } else if (selectedImage == null) {
        enableBtn = false;
      } else {
        if (license.toLowerCase() != reEnteredLicense.toLowerCase()) {
          enableBtn = false;
        } else {
          enableBtn = true;
        }
      }
    }
  }

  @action
  onClose() {
    selectedImage = null;
  }
}
