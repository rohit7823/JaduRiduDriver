import 'dart:io';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadu_ride_driver/core/common/alert_action.dart';
import 'package:jadu_ride_driver/core/common/alert_behaviour.dart';
import 'package:jadu_ride_driver/core/common/alert_data.dart';
import 'package:jadu_ride_driver/core/common/alert_option.dart';
import 'package:jadu_ride_driver/core/common/payment_method.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/common/screen.dart';
import 'package:jadu_ride_driver/core/common/screen_wtih_extras.dart';
import 'package:jadu_ride_driver/core/common/uploader_implementation.dart';
import 'package:jadu_ride_driver/core/domain/upi_id.dart';
import 'package:jadu_ride_driver/core/helpers/storage.dart';
import 'package:jadu_ride_driver/core/repository/payment_details_repository.dart';
import 'package:jadu_ride_driver/helpers_impls/image_file_picker.dart';
import 'package:jadu_ride_driver/modules/app_module.dart';
import 'package:jadu_ride_driver/presentation/stores/navigator.dart';
import 'package:jadu_ride_driver/presentation/stores/uploader.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/utills/dialog_manager.dart';
import 'package:mobx/mobx.dart';

part 'payment_details_store.g.dart';

class PaymentDetailStore = _PaymentDetailsStore with _$PaymentDetailStore;

abstract class _PaymentDetailsStore extends AppNavigator with Store {
  final _repository = dependency<PaymentDetailsRepository>();
  final _storage = dependency<Storage>();
  final dialogManager = DialogManager();
  final _picker = ImageFilePicker();
  final uploader = Uploader(implementation: UploaderImplementation.real);

  List<PaymentMethod> methods = PaymentMethod.values;

  @observable
  bool enableBtn = false;

  @observable
  File? selectedImage;

  @observable
  List<UpiID> upis = [];

  @observable
  UpiID? selectedUpi;

  @observable
  bool gettingUpisLoader = false;

  @observable
  String upiID = "";

  @observable
  String upiStatusLabel = "";

  @observable
  String informMessage = "";

  bool validUpi = false;

  @observable
  bool uploadingLoader = false;

  _PaymentDetailsStore() {
    getInitialData();
    _validateInputs();
  }

  @action
  clearSelectedImage() {
    selectedImage = null;
  }

  openImagePicker() {
    dialogManager.openFilePicker();
  }

  @action
  fromGallery() async {
    selectedImage = await _picker.chooseFromGallery();
  }

  @action
  fromCamera() async {
    selectedImage = await _picker.clickViaCamera();
  }

  @action
  onSelectUpi(UpiID? upiID) {
    selectedUpi = upiID;
    //onUpiId(this.upiID);
  }

  @action
  onUpiId(String id) async {
    upiID = id;
    /*await Future.delayed(const Duration(milliseconds: 500));
    var fullUpiId = "$upiID${selectedUpi?.name}";
    var response = await _repository.validateUpi(fullUpiId);

    if (response is Success) {
      var data = response.data;
      switch (data != null && data.status) {
        case true:
          if (data!.isValid) {
            upiStatusLabel = StringProvider.UpiIsValid;
            validUpi = true;
          } else {
            upiStatusLabel = StringProvider.UpiIsInValid;
            validUpi = false;
          }
          break;
        default:
          validUpi = false;
      }
    } else if (response is Error) {
      validUpi = false;
    }*/
  }

  @action
  _validateInputs() async {
    while (true) {
      if (upiID.isEmpty) {
        enableBtn = false;
      } else if (selectedImage == null) {
        enableBtn = false;
      } else {
        enableBtn = true;
      }
      await Future.delayed(const Duration(milliseconds: 300));
    }
  }

  @action
  getInitialData() async {
    gettingUpisLoader = true;
    var response = await _repository.getUpiIds();

    if (response is Success) {
      var data = response.data;
      gettingUpisLoader = false;
      switch (data != null && data.status) {
        case true:
          upis = data!.upis;
          selectedUpi = upis.first;
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
                  option: AlertOption.none, action: AlertAction.getUpis)));
      }
    } else if (response is Error) {
      gettingUpisLoader = false;
      dialogManager.initErrorData(AlertData(
          StringProvider.error,
          null,
          StringProvider.appId,
          response.message ?? "",
          StringProvider.retry,
          null,
          null,
          AlertBehaviour(
              option: AlertOption.none, action: AlertAction.getUpis)));
    }
  }

  @action
  onDone() async {
    uploadingLoader = true;
    var userId = _storage.userId();
    var response = await _repository.paymentDetails(
        userId,
        selectedImage!,
        "$upiID${selectedUpi?.name}", uploader.start);

    if (response is Success) {
      var data = response.data;
      uploadingLoader = false;
      switch (data != null && data.status) {
        case true:
          if (data!.isSubmitted) {
            informMessage = data.message;
            onChange(
                ScreenWithExtras(screen: Screen.addAllDetails, argument: true));
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
                    action: AlertAction.uploadPaymentDetails)));
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
                  action: AlertAction.uploadPaymentDetails)));
      }
    } else if (response is Error) {
      uploadingLoader = false;
      dialogManager.initErrorData(AlertData(
          StringProvider.error,
          null,
          StringProvider.appId,
          response.message ?? "",
          StringProvider.retry,
          null,
          null,
          AlertBehaviour(
              option: AlertOption.none,
              action: AlertAction.uploadPaymentDetails)));
    }
  }

  onError(AlertAction? action) {
    if (action == AlertAction.uploadPaymentDetails) {
      onDone();
    }
  }
}
