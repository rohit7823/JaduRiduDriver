class MasterResponse {
  Map<String, dynamic> data;

  MasterResponse({required this.data});

  factory MasterResponse.fromJson(Map<String, dynamic> map) =>
      MasterResponse(data: map["data"]);
}
