class UserShortDetail {
  String name;
  String profileImage;


  UserShortDetail(
      {required this.name,
        required this.profileImage});

  factory UserShortDetail.fromJson(Map<String, dynamic> json) => UserShortDetail(
    name:json["name"],
      profileImage:json["profileImage"]
  );

  Map<String, dynamic> toJson() => {
   "name":name,
    "profileImage":profileImage,
  };
}