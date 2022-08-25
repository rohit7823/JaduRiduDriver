import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jadu_ride_driver/presentation/ui/image_assets.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

class AnimatedJaduRideView extends StatefulWidget {
  const AnimatedJaduRideView({Key? key}) : super(key: key);

  @override
  State<AnimatedJaduRideView> createState() => _AnimatedJaduRideViewState();
}

class _AnimatedJaduRideViewState extends State<AnimatedJaduRideView>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Size?> _sizeTween;
  late final Animation _colorTween;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _controller.repeat(reverse: true);

    _sizeTween =
        SizeTween(begin: Size(0.10.sh, 0.10.sh), end: Size(0.20.sh, 0.20.sh))
            .animate(_controller);
    _colorTween = ColorTween(begin: AppColors.white, end: AppColors.primary)
        .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return Container(
          width: _sizeTween.value?.width,
          height: _sizeTween.value?.height,
          decoration: BoxDecoration(
            color: _colorTween.value,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: const [
              BoxShadow(
                color: AppColors.lightGray,
                offset: Offset(
                  5.0,
                  5.0,
                ),
                blurRadius: 10.0,
                spreadRadius: 2.0,
              ), //BoxShadow
              BoxShadow(
                color: AppColors.lightGray,
                offset: Offset(0.0, 0.0),
                blurRadius: 0.0,
                spreadRadius: 0.0,
              )
            ],
          ),
          child: fitBox(
            child: Image.asset(ImageAssets.logo),
          ),
        );
      },
    );
  }
}
