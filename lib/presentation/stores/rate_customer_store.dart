import 'package:jadu_ride_driver/modules/app_module.dart';
import 'package:mobx/mobx.dart';
import 'package:jadu_ride_driver/presentation/stores/navigator.dart';

part 'rate_customer_store.g.dart';

class RateCustomerStore = IRateCustomerStore with _$RateCustomerStore;

abstract class IRateCustomerStore extends AppNavigator with Store {}
