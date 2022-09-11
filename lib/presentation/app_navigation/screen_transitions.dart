import 'package:flutter/material.dart';
import 'package:jadu_ride_driver/utills/transition_event_detection.dart';

class ScreenTransitions {
  ScreenTransitions._();

  static MaterialPageRoute normal(Widget destination) {
    return MaterialPageRoute(builder: (context) {
      return destination;
    });
  }

  static rightToLeftTransitionWithEvent(Widget destination) {
    return PageRouteBuilder(
        maintainState: true,
        transitionDuration: const Duration(milliseconds: 500),
        reverseTransitionDuration: const Duration(milliseconds: 500),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var event =
              TransitionEventDetector.detect(animation, secondaryAnimation);
          //debugPrint("transition event: ${event.name}");
          switch (event) {
            case TransitionEvent.ENTER:
              return SlideTransition(
                  position: _onEnterEvent(animation), child: child);
            case TransitionEvent.EXIT:
              return SlideTransition(
                  position: _onExitEvent(secondaryAnimation), child: child);
            case TransitionEvent.POP_ENTER:
              return SlideTransition(
                  position: _onPopEnterEvent(secondaryAnimation), child: child);
            case TransitionEvent.POP_EXIT:
              return SlideTransition(
                  position: _onPopExitEvent(animation), child: child);
            case TransitionEvent.NONE:
              return child;
          }
        },
        pageBuilder: (context, animation, secondaryAnimation) => destination);
  }

  static rightToLeftTransition(Widget destination) {
    return PageRouteBuilder(
        maintainState: true,
        transitionDuration: const Duration(milliseconds: 500),
        reverseTransitionDuration: const Duration(milliseconds: 500),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
              position: _onEnterEvent(animation), child: child);
        },
        pageBuilder: (context, animation, secondaryAnimation) => destination);
  }

  static bottomToTopTransition(Widget destination) {
    return PageRouteBuilder(
        maintainState: true,
        transitionDuration: const Duration(milliseconds: 500),
        reverseTransitionDuration: const Duration(milliseconds: 500),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1);
          const end = Offset.zero;
          final tween = Tween(begin: begin, end: end)
              .chain(CurveTween(curve: Curves.ease));
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
        pageBuilder: (context, animation, secondaryAnimation) => destination);
  }

  static Animation<Offset> _onEnterEvent(Animation<double> animation) {
    const begin = Offset(1, 0.0);
    const end = Offset.zero;
    final tween =
        Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.ease));
    final offsetAnimation = animation.drive(tween);
    return offsetAnimation;
  }

  static Animation<Offset> _onExitEvent(Animation<double> animation) {
    const begin = Offset.zero;
    const end = Offset(-1, 0.0);
    final tween =
        Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.ease));
    final offsetAnimation = animation.drive(tween);
    return offsetAnimation;
  }

  static _onPopEnterEvent(Animation<double> secondaryAnimation) {
    const begin = Offset.zero;
    const end = Offset(-1, 0.0);
    final tween =
        Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.ease));
    final offsetAnimation = secondaryAnimation.drive(tween);
    return offsetAnimation;
  }

  static _onPopExitEvent(Animation<double> animation) {
    const begin = Offset(1, 0.0);
    const end = Offset.zero;
    final tween =
        Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.ease));
    final offsetAnimation = animation.drive(tween);
    return offsetAnimation;
  }
}
