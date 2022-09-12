import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jadu_ride_driver/core/common/vehicle_type.dart';
import 'package:jadu_ride_driver/core/domain/customer_details.dart';
import 'package:jadu_ride_driver/presentation/ui/app_text_style.dart';
import 'package:jadu_ride_driver/presentation/ui/image_assets.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

class BookingArrivedWidget extends StatelessWidget {
  CustomerDetails? details;
  String estimateKm;
  String eta;
  int passTimer;
  String vehicleType;

  BookingArrivedWidget(
      {Key? key,
      required this.details,
      required this.passTimer,
      required this.vehicleType,
      required this.estimateKm,
      required this.eta})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ColorFiltered(
            colorFilter: ColorFilter.mode(
                AppColors.primaryVariant.withOpacity(0.5), BlendMode.srcOut),
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
                    height: 0.5.sw,
                    width: 0.5.sw,
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
            padding: EdgeInsets.only(bottom: 0.10.sw),
            child: SizedBox(
              width: 0.7.sw,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                      onPressed: () {},
                      child: "Timer".text()
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      child: StringProvider.okay.text()
                  )
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: fitBox(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(0.04.sw),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(0.5.sw)),
                  child: SvgPicture.asset(
                    _propagateVehicleType(vehicleType),
                    width: 0.03.sw,
                    height: 0.03.sw,
                  ),
                ),
                _propagateVehicleTypeName(vehicleType)
                    .text(AppTextStyle.vehicleTypeStyle)
              ],
            ).padding(insets: EdgeInsets.all(0.10.sw)),
          ),
        )
      ],
    );
  }

  String _propagateVehicleType(String vehicleType) {
    if (vehicleType == VehicleType.fourWheelers.value) {
      return ImageAssets.car;
    } else if (vehicleType == VehicleType.twoWheelers.value) {
      return "";
    }

    return "";
  }

  String _propagateVehicleTypeName(String vehicleType) {
    if (vehicleType == VehicleType.fourWheelers.value) {
      return "Car";
    } else if (vehicleType == VehicleType.twoWheelers.value) {
      return "Bike";
    }

    return "";
  }
}
