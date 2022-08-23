import 'package:flutter/material.dart';
enum TransitionEvent{
  NONE,
  ENTER,
  EXIT,
  POP_ENTER,
  POP_EXIT
}

class TransitionEventDetector{
  static TransitionEvent detect(Animation<double> animation, Animation<double> secondaryAnimation){
    TransitionEvent event = TransitionEvent.NONE;
    var self = animation.status;
    var other = secondaryAnimation.status;
    if(other==AnimationStatus.forward){
      event = TransitionEvent.EXIT;
    }
    else if(self==AnimationStatus.completed && other==AnimationStatus.reverse){
      event = TransitionEvent.POP_ENTER;
    }
    else if(self==AnimationStatus.forward && other==AnimationStatus.dismissed){
      event = TransitionEvent.ENTER;
    }
    else if(self==AnimationStatus.reverse && other==AnimationStatus.dismissed){
      event = TransitionEvent.POP_EXIT;
    }
    return event;
  }
}