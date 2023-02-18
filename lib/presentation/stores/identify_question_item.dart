import 'package:jadu_ride_driver/core/domain/question.dart';
import 'package:jadu_ride_driver/core/domain/question_option.dart';
import 'package:mobx/mobx.dart';

part 'identify_question_item.g.dart';

class IdentifyQuestionItem = _IdentifyQuestionItemModel
    with _$IdentifyQuestionItem;

abstract class _IdentifyQuestionItemModel with Store {
  Question data;

  @observable
  bool _loading = false;

  @computed
  bool get loadingStatus => _loading;

  @observable
  QuestionOption _option = QuestionOption(id: "", option: "");

  @computed
  QuestionOption get selectedOption => _option;

  _IdentifyQuestionItemModel(this.data) {
    //selectOption(data.options.first);
  }

  @action
  selectOption(QuestionOption option, bool isUpdated) {
    _option = option;
    data.isMandatory = !isUpdated;
  }

  @action
  changeLoading(bool loading) {
    _loading = loading;
  }
}
