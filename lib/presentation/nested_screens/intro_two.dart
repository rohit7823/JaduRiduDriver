import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jadu_ride_driver/presentation/stores/intro_screen_store.dart';
import 'package:jadu_ride_driver/presentation/ui/app_text_style.dart';
import 'package:jadu_ride_driver/utills/global.dart';

class IntroTwo extends StatelessWidget {
  IntroStore store;
  int pos;
  IntroTwo({Key? key, required this.store, required this.pos})
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
          padding: EdgeInsets.symmetric(horizontal: 0.10.sw, vertical: 0.05.sw),
          child: SvgPicture.network(
            "${Global.baseUrl}${store.data[pos].coverImage}",
            width: 0.30.sh,
            height: 0.30.sh,
          ),
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
                child: Text(
                  store.data[pos].body,
                  style: AppTextStyle.introSubHeadingStyle,
                  textAlign: TextAlign.center,
                  maxLines: 3,
                ))
          ],
        ),
      ),
    );
  }
}
