import 'package:ai_notes_query/ai_notes_query.dart';

class AuthModel {
  final UserModel record;
  final String token;

  AuthModel({required this.record, required this.token});

  AuthModel.fromJSON(Map<String, dynamic> json)
    : this(record: UserModel.fromJSON(json["record"]), token: json["token"]);
}
