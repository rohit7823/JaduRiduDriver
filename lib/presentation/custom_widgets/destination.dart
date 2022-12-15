import 'package:flutter/widgets.dart';
import 'package:jadu_ride_driver/core/common/screen.dart';
import 'package:jadu_ride_driver/modules/app_module.dart';
import 'package:jadu_ride_driver/presentation/app_navigation/change_screen.dart';
import 'package:jadu_ride_driver/presentation/stores/shared_store.dart';
import 'package:mobx/mobx.dart';

mixin Destination {
  ReactionDisposer? changeReaction;

  init(BuildContext context, Store store) {
    if (store is SharedStore) {
      changeReaction =
          reaction((p0) => store.currentChange, fireImmediately: true, (p0) {
        if (p0 != null && p0.screen == Screen.dashBoard) {
          debugPrint("screenChanging to Dashboard");
          Navigator.pop(context);
          ChangeScreen.to(context, p0.screen,
              arguments: p0.argument,
              option: p0.option,
              onComplete: store.clear);
        }
      });
    }
  }

  dispose() {
    changeReaction?.call();
  }
}
