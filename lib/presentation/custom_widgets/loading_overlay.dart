import 'package:flutter/material.dart';
import 'package:jadu_ride_driver/presentation/ui/image_assets.dart';
import '../ui/theme.dart';
import '../ui/ui_constraints.dart';

class LoadingOverLay extends StatefulWidget {
  double opacity;

  LoadingOverLay({Key? key, this.opacity = 0.5}) : super(key: key);

  @override
  State<LoadingOverLay> createState() => _LoadingOverLayState(opacity);
}

class _LoadingOverLayState extends State<LoadingOverLay> {
  late double opacity = 0.5;

  _LoadingOverLayState(this.opacity);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withOpacity(opacity),
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Align(
          alignment: Alignment.center,
          child: Card(
            semanticContainer: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(UiConstraints.radius1),
            ),
            color: AppColors.primary,
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(ImageAssets.logo, width: 60, height: 60),
                  const SizedBox(
                    width: 100,
                    height: 100,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
