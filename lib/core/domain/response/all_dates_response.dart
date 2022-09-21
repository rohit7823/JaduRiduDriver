

import 'package:jadu_ride_driver/core/domain/package.dart';

class AllDatesListsResponse {
  AllDatesListsResponse(
      { required this.status, required this.message, required this.allDatesList}
      );
  bool status;
  String message;
  List<Package> allDatesList;
}