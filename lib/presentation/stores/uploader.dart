import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jadu_ride_driver/core/common/uploader_implementation.dart';
import 'package:mobx/mobx.dart';

part 'uploader.g.dart';

class Uploader = _Uploader with _$Uploader;

abstract class _Uploader with Store {
  @observable
  bool _start = false;

  @computed
  bool get status => _start;

  int _progress = 0;

  int _target = 0;

  UploaderImplementation implementation;
  _Uploader({this.implementation = UploaderImplementation.fake});

  @action
  start(int sent, int total) {
    _progress = sent;
    _target = total;
    debugPrint("sent $_progress total $_target");
    _start = _progress <= _target;
  }

  @action
  startUploader(int total) {
    _target = total;
    _start = _progress <= _target;
  }

  @action
  stopUploader(int size) {
    _progress = _target = size;
    _start = false;
  }

  Stream<int> listenProgressInPercent() async* {
    var percent = 0;

    if (implementation == UploaderImplementation.fake) {
      while (_start) {
        _progress += 1024;
        percent = _progress * 100 ~/ _target;
        yield percent;
        await Future.delayed(const Duration(milliseconds: 1000));
      }
    } else {
      while (_start) {
        percent = _progress * 100 ~/ _target;
        yield percent;
        await Future.delayed(const Duration(milliseconds: 10));
      }
    }

    yield percent;
  }

  Stream<double> listenProgress() async* {
    if (implementation == UploaderImplementation.fake) {
      while (_start) {
        _progress += 1024;
        yield _progress / _target;
        await Future.delayed(const Duration(milliseconds: 1000));
      }
    } else {
      while (_start) {
        yield _progress / _target;
        await Future.delayed(const Duration(milliseconds: 10));
      }
    }
  }
}
