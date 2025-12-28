class UserModel {
  final String id;
  final String name;
  final DateTime created;

  UserModel({required this.id, required this.name, required this.created});

  @override
  UserModel.fromJSON(Map<String, dynamic> json)
    : this(
        id: json["id"],
        name: json["name"],
        created: DateTime.parse(json["created"]),
      );

  Map<String, dynamic> toJSON() => {
    "id": id,
    "name": name,
    "created": created.toIso8601String(),
  };

  @override
  String toString() => toJSON().toString();
}
