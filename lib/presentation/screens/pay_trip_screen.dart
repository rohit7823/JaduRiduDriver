import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadu_ride_driver/core/common/screen.dart';
import 'package:jadu_ride_driver/core/domain/ride_ids.dart';
import 'package:jadu_ride_driver/modules/app_module.dart';
import 'package:jadu_ride_driver/presentation/app_navigation/change_screen.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/destination.dart';
import 'package:jadu_ride_driver/presentation/stores/pay_trip_store.dart';
import 'package:jadu_ride_driver/presentation/stores/shared_store.dart';
import 'package:jadu_ride_driver/presentation/ui/app_button_themes.dart';
import 'package:jadu_ride_driver/presentation/ui/app_text_style.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';
import 'package:mobx/mobx.dart';

class PayTripScreen extends StatefulWidget {
  RideIds rideIds;
  SharedStore sharedStore;

  PayTripScreen({Key? key, required this.rideIds, required this.sharedStore})
      : super(key: key);

  @override
  State<PayTripScreen> createState() => _PayTripScreenState();
}

class _PayTripScreenState extends State<PayTripScreen> {
  late final PayTripStore _store;
  late final List<ReactionDisposer> _disposers;

  @override
  void initState() {
    _store = PayTripStore(widget.rideIds);
    super.initState();
    _disposers = [
      reaction((p0) => widget.sharedStore.rideFareResponse,
          fireImmediately: true, (p0) {
        if (p0 != null) {
          _store.initiateRideFare(p0);
        }
      }),
      reaction((p0) => _store.currentChange, (p0) {
        if (p0 != null) {
          dependency<ChangeScreen>().to(
            context,
            p0.screen,
            option: p0.option,
            onComplete: _store.clear,
            arguments: p0.argument,
          );
        }
      }),
      reaction(
          (p0) => widget.sharedStore.driverBookings.distinctAfterPayment.data,
          (p0) {
        if (p0) {
          _store.navigateToReviewCustomer();
          widget.sharedStore.driverBookings.distinctAfterPayment.clear();
        }
      })
    ];
  }

  @override
  void dispose() {
    for (var element in _disposers) {
      element();
    }
    widget.sharedStore.driverBookings.distinctAfterPayment.clearCache();
    widget.sharedStore.driverBookings.distinctPaymentAcceptance.clearCache();
    widget.sharedStore.driverBookings.distinctPaymentAcceptance.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Column(
          children: [
            expand(flex: 3, child: _upperSideContent()),
            expand(flex: 7, child: _lowerSideContent())
          ],
        ),
      ),
    );
  }

  Widget _upperSideContent() {
    return Container(
      width: 1.sw,
      padding: EdgeInsets.symmetric(horizontal: 0.05.sw, vertical: 0.05.sw),
      decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(50.r))),
      child: Observer(
        builder: (BuildContext context) => _store.totalRideFareResponse != null
            ? Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  "₹${_store.totalRideFareResponse!.totalFare}"
                      .text(AppTextStyle.enterNumberStyle.copyWith(
                          fontSize: 45.sp, fontWeight: FontWeight.w700))
                      .paddings(bottom: 0.03.sw),
                  "${widget.rideIds.customerName} to pay in cash"
                      .text()
                      .paddings(bottom: 0.03.sw),
                  "OR".text().paddings(bottom: 0.03.sw)
                ],
              )
            : const SizedBox.shrink(),
      ),
    );
  }

  Widget _lowerSideContent() {
    return Column(children: [
      expand(
          flex: 8,
          child: Observer(builder: (context) {
            if (_store.totalRideFareResponse != null) {
              return Align(
                child: fitBox(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 0.70.sw,
                        padding: EdgeInsets.all(0.03.sw),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: AppColors.primary, width: 1)),
                        child:
                            Image.network(_store.totalRideFareResponse!.qrCode),
                      ).paddings(bottom: 0.04.sw),
                      StringProvider.scanQrCodeToPay.text(AppTextStyle
                          .btnTextStyle
                          .copyWith(color: AppColors.primaryVariant))
                    ],
                  ),
                ),
              );
            }
            return const SizedBox.shrink();
          })),
      expand(
          flex: 2,
          child: Align(
            child: Observer(builder: (context) {
              if (widget.sharedStore.driverBookings.distinctPaymentAcceptance
                      .data !=
                  null) {
                return ElevatedButton(
                    onPressed: widget.sharedStore.driverBookings
                            .distinctPaymentAcceptance.data
                        ? _store.amountCollected
                        : null,
                    style: widget.sharedStore.driverBookings
                            .distinctPaymentAcceptance.data
                        ? AppButtonThemes.defaultStyle.copyWith(
                            backgroundColor: const MaterialStatePropertyAll(
                                AppColors.primaryVariant))
                        : AppButtonThemes.cancelBtnStyle,
                    child: StringProvider.amountCollected
                        .text(AppTextStyle.btnTextStyleWhite));
              }
              return ElevatedButton(
                  onPressed: null,
                  style: AppButtonThemes.cancelBtnStyle,
                  child: StringProvider.amountCollected
                      .text(AppTextStyle.btnTextStyleWhite));
            }),
          ))
    ]);
  }
}
