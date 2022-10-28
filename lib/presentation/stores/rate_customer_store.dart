import 'package:flutter/cupertino.dart';
import 'package:jadu_ride_driver/core/common/alert_action.dart';
import 'package:jadu_ride_driver/core/common/alert_behaviour.dart';
import 'package:jadu_ride_driver/core/common/alert_data.dart';
import 'package:jadu_ride_driver/core/common/alert_option.dart';
import 'package:jadu_ride_driver/core/common/navigation_option.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/common/screen.dart';
import 'package:jadu_ride_driver/core/common/screen_wtih_extras.dart';
import 'package:jadu_ride_driver/core/domain/ride_ids.dart';
import 'package:jadu_ride_driver/modules/app_module.dart';
import 'package:jadu_ride_driver/presentation/stores/message_informer.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/utills/dialog_manager.dart';
import 'package:mobx/mobx.dart';
import 'package:jadu_ride_driver/presentation/stores/navigator.dart';

import '../../core/repository/rate_customer_repository.dart';

part 'rate_customer_store.g.dart';

class RateCustomerStore = IRateCustomerStore with _$RateCustomerStore;

abstract class IRateCustomerStore extends AppNavigator with Store {
  RideIds _ids;
  final _repository = dependency<RateCustomerRepository>();
  final informer = MessageInformer();
  final dialogMgr = DialogManager();

  IRateCustomerStore(this._ids) {
    _validateInputs();
  }

  @observable
  String customerReview = "";

  @observable
  double customerRating = 0;

  @observable
  bool enableBtn = false;

  @observable
  bool uploadingReviewLoader = false;

  @action
  onCustomerReview(String review) {
    customerReview = review;
  }

  @action
  onCustomerRating(double rating) {
    customerRating = rating;
  }

  @action
  _validateInputs() async {
    while (true) {
      await Future.delayed(const Duration(milliseconds: 100));
      if (customerReview.isEmpty) {
        enableBtn = false;
      } else {
        enableBtn = true;
      }
    }
  }

  @action
  submitReview() async {
    uploadingReviewLoader = true;
    var response = await _repository.submitReview(
        _ids.rideId, customerRating, customerReview);
    if (response is Success) {
      var data = response.data;
      uploadingReviewLoader = false;
      switch (data != null && data.status) {
        case true:
          if (data!.isSubmitted) {
            informer.informUi(data.message);
            onChange(ScreenWithExtras(
                screen: Screen.dashBoard,
                option: NavigationOption(option: Option.popAll)));
          }
          break;
        default:
          informer.informUi(data?.message ?? "");
      }
    } else if (response is Error) {
      uploadingReviewLoader = false;
      dialogMgr.initErrorData(AlertData(
          StringProvider.error,
          null,
          StringProvider.appId,
          response.message ?? "",
          StringProvider.okay,
          null,
          null,
          AlertBehaviour(
              option: AlertOption.none,
              action: AlertAction.submitCustomerReview)));
    }
  }

  onError(AlertAction? action) {
    if (action == AlertAction.submitCustomerReview) {
      debugPrint("okay clicked!!");
    }
  }
}
