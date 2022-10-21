import 'package:mobx/mobx.dart';

part 'pay_trip_store.g.dart';

class PayTripStore = IPayTripStore with _$PayTripStore;

abstract class IPayTripStore with Store {}
