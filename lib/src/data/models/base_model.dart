abstract class BaseModel {
  Map<String, dynamic> toJSON();

  @override
  String toString() => toJSON().toString();
}
