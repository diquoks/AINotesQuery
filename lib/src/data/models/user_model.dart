import 'package:ai_notes_query/ai_notes_query.dart';

class UserModel extends BaseModel {
  final String id;
  final String name;
  final DateTime created;

  UserModel({required this.id, required this.name, required this.created});

  UserModel.fromJSON(Map<String, dynamic> json)
    : this(
        id: json["id"],
        name: json["name"],
        created: DateTime.parse(json["created"]),
      );

  @override
  Map<String, dynamic> toJSON() => {
    "id": id,
    "name": name,
    "created": created.toIso8601String(),
  };
}
