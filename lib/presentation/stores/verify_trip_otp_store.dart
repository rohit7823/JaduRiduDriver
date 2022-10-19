import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:jadu_ride_driver/core/common/screen.dart';
import 'package:jadu_ride_driver/core/common/screen_wtih_extras.dart';
import 'package:jadu_ride_driver/core/domain/ride_ids.dart';
import 'package:jadu_ride_driver/core/domain/verify_trip_otp_response.dart';
import 'package:jadu_ride_driver/presentation/stores/message_informer.dart';
import 'package:jadu_ride_driver/utills/socket_io.dart';
import 'package:mobx/mobx.dart';
import 'package:jadu_ride_driver/presentation/stores/navigator.dart';
import '../../core/common/socket_events.dart';

part 'verify_trip_otp_store.g.dart';

class VerifyTripOtpStore = _IVerifyTripOtpStore with _$VerifyTripOtpStore;

abstract class _IVerifyTripOtpStore extends AppNavigator with Store {
  final messageInformer = MessageInformer();

  @observable
  bool enableBtn = false;

  String otp = "";

  RideIds ids;

  _IVerifyTripOtpStore(this.ids);

  bool _isValid = false;

  @observable
  bool sendingLoader = false;

  @observable
  bool reSendingOtpLoader = false;

  @action
  otpEntered(String enteredOtp) {
    otp = enteredOtp;
    if (_isValid) {
      enableBtn = true;
    }
  }

  @action
  reSendOtp() async {
    reSendingOtpLoader = true;
  }

  @action
  verify() async {
    sendingLoader = true;
    SocketIO.client.emit(SocketEvents.verifyOtp.value,
        {"rideId": ids.rideId, "driverId": ids.driverId, "otp": otp});
    SocketIO.client.on(SocketEvents.isOtpVerified.value, (data) {
      debugPrint("isOtpVerified $data");
      var response = VerifyTripOtpResponse.fromJson(data);
      if (response.status) {
        onChange(
            ScreenWithExtras(screen: Screen.rideNavigation, argument: true));
      }
      sendingLoader = false;
      messageInformer.informUi(response.msg);
    });
  }

  @action
  String? validateOtp(String? otp) {
    if (otp != null) {
      var regEp = RegExp(r"[0-9]{4}");
      enableBtn = regEp.hasMatch(otp);
    }
    return null;
  }
}
