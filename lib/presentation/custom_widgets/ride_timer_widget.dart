import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadu_ride_driver/presentation/ui/app_text_style.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

class RideTimerWidget extends StatefulWidget {
  Duration durationInSecond;
  String title;
  VoidCallback onTimeout;

  RideTimerWidget(
      {Key? key,
      required this.durationInSecond,
      required this.title,
      required this.onTimeout})
      : super(key: key);

  @override
  State<RideTimerWidget> createState() => _RideTimerWidgetState();
}

class _RideTimerWidgetState extends State<RideTimerWidget> {
  String strDigits(int n) => n.toString().padLeft(2, '0');
  late final Timer ticker;
  late Duration durationSec;
  late Duration durationMin;

  @override
  void initState() {
    durationSec = widget.durationInSecond;
    super.initState();
    ticker = Timer.periodic(const Duration(seconds: 1), (timer) {
      const reduceBy = 1;
      setState(() {
        final second = durationSec.inSeconds - reduceBy;
        if (second > 0) {
          durationSec = Duration(seconds: second);
        } else {
          widget.onTimeout();
          ticker.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final timerStr = strDigits(durationSec.inSeconds.remainder(60));
    return Container(
      padding: EdgeInsets.all(0.03.sw),
      width: 1.sw,
      height: 0.10.sh,
      decoration: const BoxDecoration(color: Color(0xFFF2F2F2)),
      child: fitBox(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          widget.title
              .text(AppTextStyle.timerHeadingStyle)
              .padding(insets: EdgeInsets.only(bottom: 0.01.sw)),
          "00:$timerStr".text(AppTextStyle.timerHeadingStyle.copyWith(
              fontSize: 30.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.Acadia))
        ],
      )),
    );
  }
}
