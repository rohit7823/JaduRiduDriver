
import '../trips_details.dart';
import 'business_object.dart';

class RequiredDataTripsDetailsResponse extends BusinessObject{
  bool status;
  String message;
  List<TripsDetails> tripsDetailsList;

  RequiredDataTripsDetailsResponse({required this.status, required this.message, required this.tripsDetailsList});
}