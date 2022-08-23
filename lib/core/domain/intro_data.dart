class IntroData {
  String id;
  String heading;
  String body;
  String coverImage;

  IntroData({required this.id,
    required this.heading,
    required this.body,
    required this.coverImage});

  factory IntroData.formJson(Map<String, dynamic> json) => IntroData(
    id: json['id'] as String,
    heading: json['heading'] as String,
    body: json['body'] as String,
    coverImage: json['coverImage'] as String
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'heading': heading,
    'body': body,
    'coverImage': coverImage
  };
}