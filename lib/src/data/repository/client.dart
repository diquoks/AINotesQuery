import 'package:ai_notes_query/ai_notes_query.dart';
import 'package:dio/dio.dart';

class Client implements Repository {
  final Dio _dio;
  final Storage _storage;

  Client({required Dio dio, required Storage storage})
    : _dio = dio,
      _storage = storage;

  AuthModel? _lastAuth;

  @override
  AuthModel? get lastAuth => _lastAuth;

  String get _usersURL => "${_storage.apiURL}/collections/users";

  // String get _notesURL => "${_storage.apiURL}/collections/notes";

  // Options get _options => Options(
  //   headers: {if (_lastAuth != null) "Authorization": _lastAuth!.token},
  // );

  @override
  Future<UserModel> signup({
    required String email,
    required String password,
    required String passwordConfirm,
    required String name,
  }) async {
    var response = await _dio.post(
      "$_usersURL/records",
      data: {
        "email": email,
        "password": password,
        "passwordConfirm": passwordConfirm,
        "name": name,
      },
    );

    return UserModel.fromJSON(response.data);
  }

  @override
  Future<AuthModel> login({
    required String identity,
    required String password,
  }) async {
    var response = await _dio.post(
      "$_usersURL/auth-with-password",
      data: {"identity": identity, "password": password},
    );

    _lastAuth = AuthModel.fromJSON(response.data);
    return _lastAuth!;
  }
}
