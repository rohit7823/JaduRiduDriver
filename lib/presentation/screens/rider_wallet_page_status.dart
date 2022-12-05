import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadu_ride_driver/presentation/ui/app_text_style.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';
import 'package:lottie/lottie.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';



class RiderWalletStatus extends StatefulWidget {
  Object? argument;
  RiderWalletStatus({Key? key, required this.argument}) : super(key: key);

  @override
  State<RiderWalletStatus> createState() => _RiderWalletStatusState();
}

class _RiderWalletStatusState extends State<RiderWalletStatus> {


  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            expand(
                flex: 9,
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (widget.argument is PaymentSuccessResponse)
                        Lottie.asset(AnimationAssets.paymentSuccess,
                            repeat: false, height: 0.30.sh),
                      if (widget.argument is PaymentSuccessResponse || widget.argument is ExternalWalletResponse)
                        StringProvider.rechargeSuccessful
                            .text(AppTextStyle.headingTextStyle),
                      if (widget.argument is PaymentSuccessResponse)
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            StringProvider.paymentId.text(AppTextStyle
                                .rideSpecificDetailCountStyle
                                .copyWith(color: AppColors.Acadia)),
                            if (widget.argument is PaymentSuccessResponse)
                              (widget.argument as PaymentSuccessResponse)
                                  .orderId !=
                                  null
                                  ? (widget.argument as PaymentSuccessResponse)
                                  .orderId!
                                  .toUpperCase()
                                  .text(AppTextStyle
                                  .rideSpecificDetailCountStyle
                                  .copyWith(color: AppColors.lightGray))
                                  : const SizedBox.shrink()
                          ],
                        ).paddings(top: 0.02.sw),
                      if (widget.argument is PaymentFailureResponse)
                        Lottie.asset(AnimationAssets.paymentFailure,
                            repeat: false, height: 0.30.sh),
                      if (widget.argument is PaymentFailureResponse)
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            StringProvider.reason.text(AppTextStyle
                                .rideSpecificDetailCountStyle
                                .copyWith(color: AppColors.Acadia)),
                            (widget.argument as PaymentFailureResponse)
                                .message !=
                                null
                                ? (widget.argument as PaymentFailureResponse)
                                .message!
                                .text(AppTextStyle
                                .rideSpecificDetailCountStyle)
                                : const SizedBox.shrink()
                          ],
                        ),
                      if (widget.argument is ExternalWalletResponse)
                        Lottie.asset(AnimationAssets.paymentSuccess,
                            repeat: false, height: 0.30.sh),
                      if (widget.argument is ExternalWalletResponse)
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            StringProvider.paymentVia.text(AppTextStyle
                                .rideSpecificDetailCountStyle
                                .copyWith(color: AppColors.Acadia)),
                            (widget.argument as ExternalWalletResponse)
                                .walletName !=
                                null
                                ? (widget.argument as ExternalWalletResponse)
                                .walletName!
                                .text(AppTextStyle
                                .rideSpecificDetailCountStyle)
                                : const SizedBox.shrink()
                          ],
                        )
                    ],
                  ),
                )),
            expand(
                flex: 1,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                      width: double.maxFinite,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          StringProvider.back,
                        ),
                      )),
                ))
          ],
        ),
      ),
    );
  }
}

class AnimationAssets {
  static const paymentSuccess = "assets/animations/transaction_completed.json";
  static const paymentFailure = "assets/animations/payment_failed.json";
}