import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadu_ride_driver/core/domain/ride_ids.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/app_button.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/my_app_bar.dart';
import 'package:jadu_ride_driver/presentation/stores/shared_store.dart';
import 'package:jadu_ride_driver/presentation/ui/app_text_style.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

class RateCustomerScreen extends StatefulWidget {
  RideIds rideIds;
  SharedStore sharedStore;

  RateCustomerScreen(
      {Key? key, required this.rideIds, required this.sharedStore})
      : super(key: key);

  @override
  State<RateCustomerScreen> createState() => _RateCustomerScreenState();
}

class _RateCustomerScreenState extends State<RateCustomerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(isPop: true),
      body: SafeArea(
          child: Stack(
        children: [
          expand(flex: 1, child: _background()),
          expand(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 0.90.sw,
                    height: 0.60.sh,
                    padding: EdgeInsets.all(0.05.sw),
                    decoration: BoxDecoration(
                        color: AppColors.white, boxShadow: allShadow()),
                    child: Column(
                      children: [
                        StringProvider.rateYourCustomer
                            .text(AppTextStyle.driveDocumentNameStyle
                                .copyWith(color: AppColors.lightGray))
                            .paddings(bottom: 0.03.sw),
                        widget.rideIds.customerName
                            .text(AppTextStyle.rechargeDoneStyle)
                            .paddings(bottom: 0.03.sw),
                        RatingBarIndicator(
                            rating: 4,
                            itemSize: 0.03.sw,
                            direction: Axis.horizontal,
                            itemCount: 5,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 3),
                            itemBuilder: (context, _) {
                              return Icon(
                                Icons.star,
                                color: Theme.of(context).primaryColor,
                              );
                            }).paddings(bottom: 0.05.sw),
                        Container(
                          height: 0.20.sh,
                          decoration: BoxDecoration(
                              color: const Color(0xFFF3F3F3),
                              borderRadius: BorderRadius.circular(20.r)),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: TextField(
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              //controller: inputController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(16.r),
                                    gapPadding: 10,
                                  ),
                                  fillColor: const Color(0xFFF3F3F3),
                                  contentPadding: EdgeInsets.all(0.03.sw),
                                  filled: true,
                                  hintText:
                                      StringProvider.saySomethingAboutYourExp),
                              onChanged: (value) {},
                            ),
                          ),
                        ).paddings(bottom: 0.05.sw),
                      ],
                    ),
                  ),
                  AppButton(
                    onClick: () {},
                    label: StringProvider.submit,
                    enable: false,
                    showLoading: false,
                  )
                ],
              ))
        ],
      )),
    );
  }

  Widget _background() {
    return Column(
      children: [
        expand(
            flex: 3,
            child: Container(
              width: 1.sw,
              color: AppColors.primary,
            )),
        expand(flex: 7, child: Container(width: 1.sw, color: AppColors.white))
      ],
    );
  }
}
