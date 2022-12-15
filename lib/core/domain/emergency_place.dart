import 'package:jadu_ride_driver/core/common/lat_long.dart';

class EmergencyPlace {
  String id;
  String icon;
  List<Type> types;
  String name;
  String address;
  bool isOpen;
  LatLong coordinates;

  EmergencyPlace(
      {required this.icon,
      required this.id,
      required this.types,
      required this.isOpen,
      required this.address,
      required this.name,
      required this.coordinates});

  factory EmergencyPlace.fromJson(Map<String, dynamic> json) => EmergencyPlace(
        id: json["id"],
        icon: json["icon"],
        types: List<Type>.from(json["types"].map((x) => typeValues.map[x])),
        name: json["name"],
        address: json["address"],
        isOpen: json["isOpen"],
        coordinates: LatLong.fromJson(json["coordinates"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "icon": icon,
        "types": List<dynamic>.from(types.map((x) => typeValues.reverse[x])),
        "name": name,
        "address": address,
        "isOpen": isOpen,
        "coordinates": coordinates.toJson(),
      };
}

enum Type { HOSPITAL, HEALTH, POINT_OF_INTEREST, ESTABLISHMENT }

final typeValues = EnumValues({
  "establishment": Type.ESTABLISHMENT,
  "health": Type.HEALTH,
  "hospital": Type.HOSPITAL,
  "point_of_interest": Type.POINT_OF_INTEREST
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}
