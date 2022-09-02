import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jadu_ride_driver/presentation/stores/intro_screen_store.dart';
import 'package:jadu_ride_driver/presentation/ui/app_text_style.dart';

import '../../utills/global.dart';

class IntroThree extends StatelessWidget {
  IntroStore store;
  int pos;
  IntroThree({Key? key, required this.store, required this.pos})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(flex: 6, child: _upperSideContent()),
        Expanded(flex: 4, child: _lowerSideContent())
      ],
    );
  }

  Widget _upperSideContent() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: FittedBox(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.10.sw),
          child: SvgPicture.network(
              "${Global.baseUrl}${store.data[pos].coverImage}"),
        ),
      ),
    );
  }

  Widget _lowerSideContent() {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.05.sw),
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.only(bottom: 0.03.sw),
                child: Text(store.data[pos].heading,
                    style: AppTextStyle.introHeadingStyle)),
            Padding(
                padding: EdgeInsets.only(bottom: 0.03.sw),
                child: Text(store.data[pos].body,
                    style: AppTextStyle.introSubHeadingStyle,
                    textAlign: TextAlign.center,
                    maxLines: 3))
          ],
        ),
      ),
    );
  }
}
