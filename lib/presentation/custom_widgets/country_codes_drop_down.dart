import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadu_ride_driver/presentation/ui/app_text_style.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';

import '../../core/domain/mobile_number_code.dart';
import '../../utills/global.dart';

class CountryCodesDropDown extends StatefulWidget {
  List<MobileNumberCode> dialCodes;
  Function(MobileNumberCode?) onSelect;
  bool gettingLoader;
  CountryCodesDropDown(
      {Key? key,
      required this.dialCodes,
      required this.onSelect,
      required this.gettingLoader})
      : super(key: key);

  @override
  State<CountryCodesDropDown> createState() => _CountryCodesDropDownState(
      dialCodes: dialCodes, onSelect: onSelect, loading: gettingLoader);
}

class _CountryCodesDropDownState extends State<CountryCodesDropDown> {
  Function(MobileNumberCode?) onSelect;
  List<MobileNumberCode> dialCodes;
  bool loading;
  _CountryCodesDropDownState(
      {required this.onSelect, required this.dialCodes, required this.loading});

  @override
  Widget build(BuildContext context) {
    if (dialCodes.isNotEmpty) {
      return DropdownButtonHideUnderline(
        child: FittedBox(
          fit: BoxFit.fill,
          child: DropdownButton2(
              value: dialCodes.first,
              alignment: Alignment.center,
              iconSize: 0,
              items: dialCodes
                  .map((e) => DropdownMenuItem(
                        value: e,
                        alignment: Alignment.center,
                        child: FittedBox(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                height: 0.08.sw,
                                //e.countryImage,
                                "${Global.baseUrl}${e.flag}",
                                width: 0.10.sw,
                              ),
                              SizedBox(width: 0.02.sw),
                              Text(
                                e.code,
                                style: AppTextStyle.countryCodeStyle,
                              )
                            ],
                          ),
                        ),
                      ))
                  .toList(),
              onChanged: onSelect,
              buttonPadding:
                  EdgeInsets.symmetric(horizontal: 0.03.sw, vertical: 0.02.sw),
              buttonDecoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.r),
                      bottomLeft: Radius.circular(12.r)),
                  border: Border.all(
                    color: AppColors.lightGray,
                  ),
                  color: Colors.white),
              dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
              )),
        ),
      );
    } else {
      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                bottomLeft: Radius.circular(10.r)),
            border: Border.all(
              color: Colors.black26,
            ),
            color: Colors.white),
        child: Center(
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 0.02.sw),
              child: const CircularProgressIndicator(
                  color: AppColors.primaryVariant)),
        ),
      );
    }
  }
}
