import 'package:flutter/material.dart';
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

  @action
  startUploader(int size) {
    _target = size;
    _start = true;
  }

  @action
  stopUploader(int size) {
    _progress = _target = size;
    _start = false;
  }

  Stream<int> listenProgressInPercent() async* {
    var percent = 0;
    while (_progress != _target) {
      _progress += 1024;
      percent = _progress * 100 ~/ _target;
      yield percent;
      await Future.delayed(const Duration(milliseconds: 1000));
    }
    yield percent;
  }

  Stream<double> listenProgress() async* {
    while (_progress != _target) {
      _progress += 1024;
      yield _progress / _target;
      await Future.delayed(const Duration(milliseconds: 1000));
    }
  }
}
