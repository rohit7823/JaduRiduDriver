// class TripsDetails{
//   String date;
//   String time;
//   String id;
//   String sourceAddress;
//   String destinationAddress;
//   String paymentType;
//   String farePrice;
//
//   TripsDetails({required this.date,
//     required this.time,
//     required this.id,
//     required this.destinationAddress,
//     required this.farePrice,
//     required this.paymentType,
//     required this.sourceAddress});
// }
//
class Trip {
  Trip({
    required this.id,
    required this.date,
    required this.time,
    required this.sourceAddress,
    required this.destinationAddress,
    required this.paymentType,
    required this.farePrice,
  });

  final String id;
  final String date;
  final String time;
  final String sourceAddress;
  final String destinationAddress;
  final String paymentType;
  final String farePrice;

  factory Trip.fromJson(Map<String, dynamic> json) => Trip(
    id: json["id"],
    date: json["date"],
    time: json["time"],
    sourceAddress: json["sourceAddress"],
    destinationAddress: json["destinationAddress"],
    paymentType: json["paymentType"],
    farePrice: json["farePrice"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date": date,
    "time": time,
    "sourceAddress": sourceAddress,
    "destinationAddress": destinationAddress,
    "paymentType": paymentType,
    "farePrice": farePrice,
  };
}
