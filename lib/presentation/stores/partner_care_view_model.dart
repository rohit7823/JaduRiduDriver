import 'package:flutter/cupertino.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/gradient_progress_indicator.dart';
import 'package:jadu_ride_driver/utills/my_utils.dart';
import 'package:mobx/mobx.dart';

import '../../core/helpers/validator.dart';
import '../../core/repository/partner_care_repository.dart';
import '../../modules/app_module.dart';

part 'partner_care_view_model.g.dart';

class PartnerCareStore = _PartnerCareViewModel with _$PartnerCareStore;

abstract class _PartnerCareViewModel with Store {
  final _repository = dependency<PartnerCareRepository>();
  final _validator = dependency<Validator>();

  @observable
  bool isLoading = false;

  @observable
  String userInputName = "";

  @observable
  String userInputEmail = "";

  @observable
  String userInputSubject = "";

  @observable
  String userInputMsg = "";

  @observable
  String errorMsg = "";

  @observable
  String errorMessageMsg = "";

  @observable
  String informMessage = "";

  @action
  onName(String name) {
    userInputName = name;
  }

  @action
  onEmail(String email) {
    userInputEmail = email;
  }

  @action
  onSubject(String subject) {
    userInputSubject = subject;
  }

  @action
  onMessage(String msg) {
    userInputMsg = msg;
  }

  @action
  onPressed(
      TextEditingController _nameController,
      TextEditingController _emailController,
      TextEditingController _subjectController,
      TextEditingController _msgController) async {

    if (_validator.isEmailValid(userInputEmail) == false ||
        userInputMsg.isEmpty) {
      isLoading = true;
    } else {
      isLoading = true;
      var response = await _repository.uploadPartnerCare(
          userInputName, userInputEmail, userInputSubject, userInputMsg);
      if (response is Success) {
        var data = response.data;
        switch (data != null && data.status) {
          case true:
            if (data!.isUploaded) {
              informMessage = data.message;
             _nameController.clear();
             _emailController.clear();
             _subjectController.clear();
             _msgController.clear();
              MyUtils.toastMessage("Success....");
              isLoading = false;
            }
        }
      } else if (response is Error) {
        MyUtils.toastMessage("Error found....");
      }
      isLoading = false;
      //debugPrint(response.toString());
    }
  }

  @action
  validateInput() async {
    while (true) {
      if (userInputEmail.isEmpty) {
        errorMsg = "Your email is empty";
        isLoading = false;
      } else if (_validator.isEmailValid(userInputEmail) == false) {
        errorMsg = "Please enter correct email";
        isLoading = false;
      } else {
        errorMsg = "";
      }
      await Future.delayed(const Duration(milliseconds: 300));
    }
  }

  @action
  validateInputMessage() async {
    while (true) {
      //debugPrint(_validator.isEmailValid(userInputEmail).toString());
      if (userInputMsg.isEmpty) {
        errorMessageMsg = "Your message is empty";
      } else {
        errorMessageMsg = "";
      }
      await Future.delayed(const Duration(milliseconds: 300));
    }
  }
}
