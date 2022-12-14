class TripsDetails{
  String date;
  String time;
  String id;
  String sourceAddress;
  String destinationAddress;
  String paymentType;
  String farePrice;

  TripsDetails({required this.date,
    required this.time,
    required this.id,
    required this.destinationAddress,
    required this.farePrice,
    required this.paymentType,
    required this.sourceAddress});
}