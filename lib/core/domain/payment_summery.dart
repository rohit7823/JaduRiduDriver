class Data {
  Data({
    required this.rechargeHistory,
    required this.paginationData,
  });

  final List<RechargeHistory> rechargeHistory;
  final PaginationData paginationData;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    rechargeHistory: List<RechargeHistory>.from(json["rechargeHistory"].map((x) => RechargeHistory.fromJson(x))),
    paginationData: PaginationData.fromJson(json["paginationData"]),
  );

  Map<String, dynamic> toJson() => {
    "rechargeHistory": List<dynamic>.from(rechargeHistory.map((x) => x.toJson())),
    "paginationData": paginationData.toJson(),
  };
}
class PaginationData {
  PaginationData({
    required this.pageSize,
    required this.pageNo,
    required this.totalElements,
    required this.totalPages,
  });

  final int pageSize;
  final int pageNo;
  final int totalElements;
  final int totalPages;

  factory PaginationData.fromJson(Map<String, dynamic> json) => PaginationData(
    pageSize: json["pageSize"],
    pageNo: json["pageNo"],
    totalElements: json["totalElements"],
    totalPages: json["totalPages"],
  );

  Map<String, dynamic> toJson() => {
    "pageSize": pageSize,
    "pageNo": pageNo,
    "totalElements": totalElements,
    "totalPages": totalPages,
  };
}

class RechargeHistory {
  RechargeHistory({
    required this.transationAt,
    required this.paymentMode,
    required this.amount,
    required this.rideId,
    required this.customerName,
  });

  final String transationAt;
  final String paymentMode;
  final String amount;
  final String rideId;
  final String customerName;

  factory RechargeHistory.fromJson(Map<String, dynamic> json) => RechargeHistory(
    transationAt: json["transationAt"],
    paymentMode: json["paymentMode"],
    amount: json["amount"],
    rideId: json["ride_id"],
    customerName: json["customerName"],
  );

  Map<String, dynamic> toJson() => {
    "transationAt": transationAt,
    "paymentMode": paymentMode,
    "amount": amount,
    "ride_id": rideId,
    "customerName": customerName,
  };
}
