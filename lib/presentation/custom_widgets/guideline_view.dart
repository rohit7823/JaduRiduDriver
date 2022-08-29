import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jadu_ride_driver/presentation/ui/app_text_style.dart';
import 'package:jadu_ride_driver/presentation/ui/image_assets.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

class GuideLineView extends StatelessWidget {
  String guildLine;
  GuideLineView({Key? key, required this.guildLine}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.90.sw,
      padding: EdgeInsets.only(top: 0.05.sw),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          expand(
              flex: 1,
              child: SvgPicture.asset(ImageAssets.tick)
                  .padding(insets: EdgeInsets.only(right: 0.03.sw))),
          expand(flex: 9, child: guildLine.text(AppTextStyle.guidLineStyle))
        ],
      ),
    );
  }
}
