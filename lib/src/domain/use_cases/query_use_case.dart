import 'package:ai_notes_query/ai_notes_query.dart';
import 'package:dio/dio.dart';

class QueryUseCase {
  final Client _client = Client(dio: Dio(), storage: Storage());
  final QueryHelper _helper = QueryHelper();

  AuthModel? get lastAuth => _client.lastAuth;

  Future<void> signup({
    required Function(UserModel) onResponse,
    required Function(String) onError,
    required String email,
    required String password,
    required String passwordConfirm,
    required String name,
  }) async {
    await _helper.request(
      request: () => _client.signup(
        email: email,
        password: password,
        passwordConfirm: passwordConfirm,
        name: name,
      ),
      onResponse: onResponse,
      onError: onError,
    );
  }

  Future<void> login({
    required Function(AuthModel) onResponse,
    required Function(String) onError,
    required String identity,
    required String password,
  }) async {
    await _helper.request(
      request: () => _client.login(identity: identity, password: password),
      onResponse: onResponse,
      onError: onError,
    );
  }

  Future<void> logout({
    required Function(void) onResponse,
    required Function(String) onError,
  }) async {
    await _helper.request(
      request: () => _client.logout(),
      onResponse: onResponse,
      onError: onError,
    );
  }

  Future<void> getUser({
    required Function(UserModel) onResponse,
    required Function(String) onError,
    required String id,
  }) async {
    await _helper.request(
      request: () => _client.getUser(id: id),
      onResponse: onResponse,
      onError: onError,
    );
  }
}
