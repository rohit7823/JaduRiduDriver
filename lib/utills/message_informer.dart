import 'package:mobx/mobx.dart';



part 'message_informer.g.dart';


class MessageInformer = _IMessageInformer with _$MessageInformer;

abstract class _IMessageInformer with Store {
  @observable
  String _message = "";

  @observable
  String _label = "";

  @computed
  String get currentLabel => _label;

  @computed
  String get currentMsg => _message;

  @action
  informUi(String msg) {
    _message = msg;
  }

  @action
  updateLabel(String msg) {
    _label = msg;
  }

  @action
  clearLabel() {
    _label = "";
  }

  @action
  clear() {
    _message = "";
  }
}