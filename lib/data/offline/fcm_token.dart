import 'package:objectbox/objectbox.dart';

@Entity()
class FcmToken {
  int id;
  String userId;
  String token;

  FcmToken({required this.id, required this.userId, required this.token});
}
