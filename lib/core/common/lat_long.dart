class LatLong {
  double lat;
  double lng;

  LatLong({required this.lat, required this.lng});

  factory LatLong.fromJson(Map<String, dynamic> json) => LatLong(
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}
