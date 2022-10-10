import 'dart:convert';

SocketConnectionModel socketConnectionModelFromJson(String str) =>
    SocketConnectionModel.fromJson(json.decode(str));

String socketConnectionModelToJson(SocketConnectionModel data) =>
    json.encode(data.toJson());

class SocketConnectionModel {
  SocketConnectionModel({
    required this.status,
  });

  final String status;

  factory SocketConnectionModel.fromJson(Map<String, dynamic> json) =>
      SocketConnectionModel(
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
      };
}
