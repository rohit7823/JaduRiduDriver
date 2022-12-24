class LatLong {
  LatLong({
    this.lat = 0,
    this.lng = 0,
  });

  double lat;
  double lng;

  factory LatLong.fromJson(Map<String, dynamic> json) => LatLong(
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}
