import 'package:jadu_ride_driver/core/common/payment_method.dart';
import 'package:jadu_ride_driver/core/helpers/storage.dart';
import 'package:jadu_ride_driver/core/repository/payment_details_repository.dart';
import 'package:jadu_ride_driver/modules/app_module.dart';
import 'package:mobx/mobx.dart';

part 'payment_details_store.g.dart';

class PaymentDetailStore = _PaymentDetailsStore with _$PaymentDetailStore;

abstract class _PaymentDetailsStore with Store {
  final _repository = dependency<PaymentDetailsRepository>();
  final _storage = dependency<Storage>();

  List<PaymentMethod> methods = PaymentMethod.values;
}
