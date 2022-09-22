
import 'package:mobx/mobx.dart';

import '../../core/repository/payment_summery_repository.dart';
import '../../helpers_impls/date_time_helper.dart';
import '../../modules/app_module.dart';
import '../../utills/dialog_manager.dart';
import '../../core/helpers/storage.dart';

part 'payment_summery_view_model.g.dart';

class PaymentSummaryStores =_PaymentSummeryViewModel with _$PaymentSummaryStores;

abstract class _PaymentSummeryViewModel with Store{
  final _repository = dependency<PaymentSummeryRepository>();
  final _prefs = dependency<Storage>();
  final dialogManager = DialogManager();
  final _dateTimeHelper = DateTimeHelper();
}