import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jadu_ride_driver/core/common/booking_status.dart';
import 'package:jadu_ride_driver/core/common/service_type.dart';
import 'package:jadu_ride_driver/core/domain/customer_details.dart';
import 'package:jadu_ride_driver/presentation/ui/app_button_themes.dart';
import 'package:jadu_ride_driver/presentation/ui/app_text_style.dart';
import 'package:jadu_ride_driver/presentation/ui/image_assets.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

class BookingArrivedWidget extends StatefulWidget {
  CustomerDetails? details;
  String estimateKm;
  String eta;
  int passTimer;
  String vehicleType;
  String pickUpLocation;
  Function(BookingStatus) onPass;
  Function(BookingStatus) onOkay;

  BookingArrivedWidget(
      {Key? key,
      required this.details,
      required this.passTimer,
      required this.vehicleType,
      required this.estimateKm,
      required this.onPass,
      required this.onOkay,
      required this.pickUpLocation,
      required this.eta})
      : super(key: key);

  @override
  State<BookingArrivedWidget> createState() => _BookingArrivedWidgetState();
}

class _BookingArrivedWidgetState extends State<BookingArrivedWidget> {
  late Duration passDuration;
  late Timer ticker;
  //String timerStr = "";

  @override
  void initState() {
    passDuration = Duration(seconds: widget.passTimer);
    super.initState();
    ticker = Timer.periodic(const Duration(seconds: 1), (timer) {
      const reduceBy = 1;
      setState(() {
        final second = passDuration.inSeconds - reduceBy;
        if (second > 0) {
          passDuration = Duration(seconds: second);
        } else {
          widget.onPass(BookingStatus.passBooking);
        }
      });
    });
  }

  @override
  void dispose() {
    ticker.cancel();
    super.dispose();
  }

  String strDigits(int n) => n.toString().padLeft(2, '0');

  @override
  Widget build(BuildContext context) {
    final timerStr = strDigits(passDuration.inSeconds.remainder(60));
    return Stack(
      children: [
        ColorFiltered(
            colorFilter: ColorFilter.mode(
                AppColors.primaryVariant.withOpacity(0.7), BlendMode.srcOut),
            child: Stack(
              fit: StackFit.passthrough,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    backgroundBlendMode: BlendMode.dstOut,
                  ), // This one will handle background +// difference out
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 0.4.sw,
                    width: 0.4.sw,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(100.sw),
                    ),
                  ),
                ),
              ],
            )),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 0.05.sw),
            child: SizedBox(
              width: 1.sw,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 0.03.sw),
                    child: Container(
                      padding: EdgeInsets.all(0.04.sw),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          //boxShadow: allShadow(),
                          color: AppColors.white),
                      child: fitBox(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (widget.details != null)
                              CircleAvatar(
                                radius: 30,
                                foregroundImage:
                                    NetworkImage(widget.details!.image),
                              ).padding(
                                  insets: EdgeInsets.only(right: 0.02.sw)),
                            if (widget.details != null)
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  widget.details!.name
                                      .text(AppTextStyle
                                          .applicationSubmittedStyle)
                                      .padding(
                                          insets:
                                              const EdgeInsets.only(bottom: 5)),
                                  if (widget.details != null)
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: AppColors.primary,
                                        ),
                                        "${widget.details!.rating}".text(
                                            AppTextStyle
                                                .applicationSubmittedStyle)
                                      ],
                                    )
                                ],
                              )
                          ],
                        ),
                      ),
                    ),
                  ),
                  fitBox(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OutlinedButton(
                                style: AppButtonThemes.passBtnTheme,
                                onPressed: () {
                                  widget.onPass(BookingStatus.passBooking);
                                },
                                child: "Pass(00:$timerStr)"
                                    .text(AppTextStyle.pickUpLocationStyle))
                            .padding(insets: EdgeInsets.only(right: 0.05.sw)),
                        ElevatedButton(
                            style: AppButtonThemes.defaultStyle.copyWith(
                                fixedSize: MaterialStateProperty.all(
                                    Size(190.w, 65.h)),
                                backgroundColor: const MaterialStatePropertyAll(
                                    AppColors.white)),
                            onPressed: () {
                              widget.onOkay(BookingStatus.acceptBooking);
                            },
                            child: StringProvider.okay.text())
                      ],
                    ).padding(
                        insets: EdgeInsets.symmetric(horizontal: 0.05.sw)),
                  ),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(0.04.sw),
                decoration: const BoxDecoration(
                    color: AppColors.white, shape: BoxShape.circle),
                child: SvgPicture.asset(
                  _propagateVehicleType(widget.vehicleType),
                  width: 0.03.sw,
                  height: 0.03.sw,
                  color: AppColors.Acadia,
                ),
              ),
              _propagateVehicleTypeName(widget.vehicleType)
                  .text(AppTextStyle.vehicleTypeStyle)
                  .padding(insets: EdgeInsets.only(bottom: 0.02.sw)),
              StringProvider.pickUp
                  .text(AppTextStyle.pickUpLocationStyle, TextOverflow.ellipsis,
                      TextAlign.center)
                  .padding(insets: const EdgeInsets.only(bottom: 5)),
              widget.pickUpLocation.text(
                  AppTextStyle.pickUpLocationStyle
                      .copyWith(fontWeight: FontWeight.w600, fontSize: 20.sp),
                  TextOverflow.ellipsis,
                  TextAlign.center),
              "${widget.estimateKm} • ${widget.eta}"
                  .text(AppTextStyle.pickUpLocationStyle)
            ],
          ).padding(insets: EdgeInsets.only(top: 0.10.sw, bottom: 0.05.sw)),
        ),
      ],
    );
  }

  String _propagateVehicleType(String vehicleType) {
    if (vehicleType == ServiceType.car.value) {
      return ImageAssets.car;
    } else if (vehicleType == ServiceType.bike.value) {
      return ImageAssets.bikeService;
    } else if (vehicleType == ServiceType.delivery.value) {
      return ImageAssets.deliveryService;
    } else if (vehicleType == ServiceType.emergency.value) {
      return ImageAssets.emergency;
    } else if (vehicleType == ServiceType.rental.value) {
      return ImageAssets.rentalService;
    } else if (vehicleType == ServiceType.book.value) {
      return ImageAssets.callService;
    } else if (vehicleType == ServiceType.scan.value) {
      return ImageAssets.scanService;
    }

    return "";
  }

  String _propagateVehicleTypeName(String vehicleType) {
    if (vehicleType == ServiceType.car.value) {
      return "Car";
    } else if (vehicleType == ServiceType.bike.value) {
      return "Bike";
    } else if (vehicleType == ServiceType.delivery.value) {
      return "Delivery";
    } else if (vehicleType == ServiceType.emergency.value) {
      return "Emergency";
    } else if (vehicleType == ServiceType.rental.value) {
      return "Rental";
    } else if (vehicleType == ServiceType.book.value) {
      return "On Calling";
    } else if (vehicleType == ServiceType.scan.value) {
      return "Via Scan";
    }

    return "";
  }
}
