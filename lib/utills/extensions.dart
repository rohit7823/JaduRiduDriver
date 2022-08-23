import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jadu_ride_driver/presentation/nested_screens/intro_one.dart';
import 'package:jadu_ride_driver/presentation/nested_screens/intro_three.dart';
import 'package:jadu_ride_driver/presentation/nested_screens/intro_two.dart';
import 'package:jadu_ride_driver/presentation/stores/intro_screen_store.dart';

extension IntroPage on int {
  Widget getIntroPage(IntroStore store) {
    switch (this) {
      case 0:
        return IntroOne(store: store);
      case 1:
        return IntroTwo(store: store, pos: this);
      case 2:
        return IntroThree(store: store, pos: this);
    }
    return const SizedBox.shrink();
  }
}

extension MyText on String {
  Widget text([TextStyle? textStyle]) {
    return Text(this.tr(), style: textStyle);
  }
}

extension MyPadding on Widget {
  Widget padding({required EdgeInsets insets}) {
    return Padding(
      padding: insets,
      child: this,
    );
  }
}

extension MyFittedBox on Object {
  Widget fitBox({BoxFit fit = BoxFit.contain, required Widget child}) {
    return FittedBox(
      fit: fit,
      child: child,
    );
  }
}

extension MyExpanded on Object {
  Widget expand({required int flex, required Widget child}) {
    return Expanded(flex: flex, child: child);
  }
}


