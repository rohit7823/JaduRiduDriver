import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/gradient_progress_indicator.dart';
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
      duration: const Duration(milliseconds: 1500),
    );

    _controller.repeat(reverse: true);

    _sizeTween =
        SizeTween(begin: Size(0.05.sw, 0.05.sw), end: Size(0.15.sw, 0.15.sw))
            .animate(_controller);
    _colorTween = ColorTween(
      begin: AppColors.primary,
      end: AppColors.primaryVariant,
    ).animate(_controller);
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
        return GradientProgressIndicator(
          radius: 70,
          strokeWidth: 10.0,
          gradientStops: const [0.2, 0.8],
          curveType: Curves.easeInCirc,
          gradientColors: const [
            AppColors.primary,
            AppColors.primaryVariant,
          ],
          child: Container(
            padding: EdgeInsets.all(0.03.sw),
            decoration: BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
                border: Border.all(color: _colorTween.value, width: 1),
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.lightGray,
                    offset: Offset(
                      5.0,
                      5.0,
                    ),
                    blurRadius: 7.0,
                    spreadRadius: 2.0,
                  ) //BoxShadow
                ]),
            child: Image.asset(
              ImageAssets.logo,
              width: _sizeTween.value?.width,
              height: _sizeTween.value?.height,
            ),
          ),
        );
      },
    );
  }
}
