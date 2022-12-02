import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadu_ride_driver/core/common/alert_data.dart';
import 'package:jadu_ride_driver/core/domain/package.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/outline_drop_down.dart';
import 'package:jadu_ride_driver/presentation/ui/app_button_themes.dart';
import 'package:jadu_ride_driver/presentation/ui/app_text_style.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';


class JaduWalletPaymentPage extends StatefulWidget {
  AlertData argument;
  Function(Package?) onSelect;
  Package? current;

  JaduWalletPaymentPage(
      {Key? key,
        required this.argument,
        required this.onSelect,
        required this.current})
      : super(key: key);

  @override
  State<JaduWalletPaymentPage> createState() => _JaduWalletPaymentPageState();
}

class _JaduWalletPaymentPageState extends State<JaduWalletPaymentPage> {
  Package? selected;

  @override
  void initState() {
    selected = widget.current;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0.05.sw),
      height: 0.40.sh,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          widget.argument.title
              .text(AppTextStyle.headingTextStyle)
              .paddings(bottom: 0.01.sw),
          Divider(
            color: AppColors.Gray,
          ).paddings(bottom: 0.02.sw),
          widget.argument.message
              .text(AppTextStyle.bodyTextStyle)
              .paddings(bottom: 0.02.sw),
          expand(
              flex: 6,
              child: Align(
                alignment: Alignment.topCenter,
                child: OutlineDropDown(
                  items: widget.argument.data as List<Package>,
                  onSelected: (Package? select) {
                    debugPrint("selected $select");
                    setState(() {
                      selected = select;
                    });
                  },
                  loader: false,
                  current: selected,
                ),
              )),
          expand(
              flex: 4,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  style: AppButtonThemes.addCreditBtnStyle.copyWith(
                      fixedSize: MaterialStatePropertyAll(Size(0.90.sw, 65.h))),
                  onPressed: () {
                    widget.onSelect(selected);
                    Navigator.pop(context);
                  },
                  child: StringProvider.recharge.text(AppTextStyle
                      .btnTextStyleBlack
                      .copyWith(fontWeight: FontWeight.w600, fontSize: 20.sp)),
                ),
              ))
        ],
      ),
    );
  }
}
