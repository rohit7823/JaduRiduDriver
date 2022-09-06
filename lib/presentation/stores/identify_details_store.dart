import 'package:flutter/material.dart';
import 'package:jadu_ride_driver/core/common/alert_action.dart';
import 'package:jadu_ride_driver/core/common/alert_behaviour.dart';
import 'package:jadu_ride_driver/core/common/alert_data.dart';
import 'package:jadu_ride_driver/core/common/alert_option.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/common/screen.dart';
import 'package:jadu_ride_driver/core/common/screen_wtih_extras.dart';
import 'package:jadu_ride_driver/core/domain/question.dart';
import 'package:jadu_ride_driver/core/domain/question_option.dart';
import 'package:jadu_ride_driver/core/helpers/storage.dart';
import 'package:jadu_ride_driver/core/repository/identify_details_repository.dart';
import 'package:jadu_ride_driver/modules/app_module.dart';
import 'package:jadu_ride_driver/presentation/stores/identify_question_item.dart';
import 'package:jadu_ride_driver/presentation/stores/navigator.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/utills/dialog_manager.dart';
import 'package:mobx/mobx.dart';

part 'identify_details_store.g.dart';

class IdentifyDetailStore = _IdentifyDetailsStore with _$IdentifyDetailStore;

abstract class _IdentifyDetailsStore extends AppNavigator with Store {
  final _repository = dependency<IdentifyDetailsRepository>();
  final _storage = dependency<Storage>();
  final dialogManager = DialogManager();

  @observable
  bool gettingDataLoader = false;

  @observable
  List<IdentifyQuestionItem> questionItems = [];

  List<Question> mandatoryQuestions = [];

  @observable
  String informMessage = "";

  @observable
  bool enableBtn = false;

  @observable
  bool onChangeLoader = false;

  _IdentifyDetailsStore() {
    _getQuestions();
    _validate();
  }

  @action
  _validate() async {
    while (true) {
      if (mandatoryQuestions.isNotEmpty) {
        enableBtn = false;
      } else {
        enableBtn = true;
      }
      await Future.delayed(const Duration(milliseconds: 300));
    }
  }

  @action
  _getQuestions() async {
    gettingDataLoader = true;
    var userId = _storage.userId();
    var response = await _repository.identifyQuestions(userId);
    if (response is Success) {
      var data = response.data;
      switch (data != null && data.status) {
        case true:
          if (data!.questions.isNotEmpty) {
            var items = <IdentifyQuestionItem>[];
            for (var element in data.questions) {
              items.add(IdentifyQuestionItem(element));
              if (element.isMandatory) {
                mandatoryQuestions.add(element);
              }
            }
            gettingDataLoader = false;
            questionItems = items;
          } else {
            gettingDataLoader = false;
            dialogManager.initErrorData(AlertData(
                StringProvider.error,
                null,
                StringProvider.appId,
                data.message,
                StringProvider.close,
                null,
                null,
                AlertBehaviour(
                    option: AlertOption.none,
                    action: AlertAction.exitFormIdentifyDetails)));
          }
          break;
        default:
          gettingDataLoader = false;
          dialogManager.initErrorData(AlertData(
              StringProvider.error,
              null,
              StringProvider.appId,
              data?.message ?? "",
              StringProvider.retry,
              null,
              null,
              AlertBehaviour(
                  option: AlertOption.none,
                  action: AlertAction.identifyQuestions)));
      }
    } else if (response is Error) {
      gettingDataLoader = false;
      dialogManager.initErrorData(AlertData(
          StringProvider.error,
          null,
          StringProvider.appId,
          response.message ?? "",
          StringProvider.retry,
          null,
          null,
          AlertBehaviour(
              option: AlertOption.none,
              action: AlertAction.identifyQuestions)));
    }
  }

  onError(AlertAction? alertAction) {
    if (alertAction == AlertAction.identifyQuestions) {
      _getQuestions();
    } else if (alertAction == AlertAction.exitFormIdentifyDetails) {
      onChange(ScreenWithExtras(screen: Screen.addAllDetails));
    }
  }

  @action
  onSelectQuestion(QuestionOption? option, int idx) async {
    if (option != null) {
      var userId = _storage.userId();
      var selectedQuestion = questionItems.elementAt(idx);
      var questionId = selectedQuestion.data.id;
      var optionId = option.id;
      selectedQuestion.changeLoading(true);
      var response = await _repository.setAnswer(userId, questionId, optionId);
      if (response is Success) {
        var data = response.data;
        selectedQuestion.changeLoading(false);
        switch (data != null && data.status) {
          case true:
            if (data!.isUpdated) {
              selectedQuestion.selectOption(option);
              mandatoryQuestions.remove(selectedQuestion.data);
            } else {
              informMessage = data.message;
            }
            break;
          default:
            informMessage = data?.message ?? "";
        }
      } else if (response is Error) {
        selectedQuestion.changeLoading(false);
        informMessage = response.message ?? "";
      }
    }
  }

  @action
  onSave() async {
    onChangeLoader = true;
    await Future.delayed(const Duration(milliseconds: 600));
    onChangeLoader = false;
    onChange(ScreenWithExtras(screen: Screen.addAllDetails, argument: true));
  }
}
