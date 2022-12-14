import 'package:jadu_ride_driver/core/domain/response/business_object.dart';

class RazorpayDataResponse  extends BusinessObject{
  RazorpayDataResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool status;
  final String message;
  Map<String, dynamic> data;

  factory RazorpayDataResponse.fromJson(Map<String, dynamic> json) => RazorpayDataResponse(
    status: json["status"],
    message: json["message"],
    data: json["data"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data,
  };
}

class Data {
  Data({
    required this.key,
    required this.name,
    required this.description,
    required this.image,
    required this.currency,
    required this.amount,
    required this.orderId,
    required this.prefill,
  });

  final String key;
  final String name;
  final String description;
  final String image;
  final String currency;
  final int amount;
  final String orderId;
  final Prefill prefill;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    key: json["key"],
    name: json["name"],
    description: json["description"],
    image: json["image"],
    currency: json["currency"],
    amount: json["amount"],
    orderId: json["order_id"],
    prefill: Prefill.fromJson(json["prefill"]),
  );

  Map<String, dynamic> toJson() => {
    "key": key,
    "name": name,
    "description": description,
    "image": image,
    "currency": currency,
    "amount": amount,
    "order_id": orderId,
    "prefill": prefill.toJson(),
  };
}

class Prefill {
  Prefill({
    required this.name,
    required this.email,
    required this.contact,
  });

  final String name;
  final String email;
  final String contact;

  factory Prefill.fromJson(Map<String, dynamic> json) => Prefill(
    name: json["name"],
    email: json["email"],
    contact: json["contact"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "contact": contact,
  };
}



// class RazorpayNecessaryDataResponse extends BusinessObject {
//   bool status;
//   String message;
//   Map<String, dynamic> data;
//
//   RazorpayNecessaryDataResponse(
//       {required this.status, required this.message, required this.data});
//
//   factory RazorpayNecessaryDataResponse.fromJson(Map<String, dynamic> json) =>
//       RazorpayNecessaryDataResponse(
//         status: json["status"],
//         message: json["message"],
//         data: json["data"],
//       );
//
//   Map<String, dynamic> toJson() => {
//     "status": status,
//     "message": message,
//     "data": data,
//   };
// }

// To parse this JSON data, do
//
//     final razorpayDataResponse = razorpayDataResponseFromJson(jsonString);

