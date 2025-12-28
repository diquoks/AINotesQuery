class UserModel {
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
}
