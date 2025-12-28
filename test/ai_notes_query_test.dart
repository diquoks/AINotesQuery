import 'dart:io';

import 'package:ai_notes_query/ai_notes_query.dart';
import 'package:flutter_test/flutter_test.dart';

String testString = DateTime.now().microsecondsSinceEpoch.toString();

QueryUseCase _queryUseCase = QueryUseCase();

Map get _credentials => {
  "email": "$testString@yandex.ru",
  "password": r"Pa$$w0rd",
};

void onResponse(dynamic obj, Type expectedType) {
  stdout.writeln(obj.toString());
  assert(obj.runtimeType == expectedType);
}

void onError(String e) {
  fail(e);
}

void main() {
  group("TestQuery", () {
    test("Signup", () async {
      await _queryUseCase.signup(
        onResponse: (obj) => onResponse(obj, UserModel),
        onError: onError,
        email: _credentials["email"]!,
        password: _credentials["password"]!,
        passwordConfirm: _credentials["password"]!,
        name: "John Doe",
      );
    });
    test("Login", () async {
      await _queryUseCase.login(
        onResponse: (obj) => onResponse(obj, AuthModel),
        onError: onError,
        identity: _credentials["email"]!,
        password: _credentials["password"]!,
      );
    });
  });
}
