import 'dart:io';

import 'package:ai_notes_query/ai_notes_query.dart';
import 'package:flutter_test/flutter_test.dart';

QueryUseCase _queryUseCase = QueryUseCase();

Map _credentials = {
  "email": "${DateTime.now().microsecondsSinceEpoch}@yandex.ru",
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
  late NoteModel noteModel;

  group("TestQuery", () {
    test("signup", () async {
      await _queryUseCase.signup(
        onResponse: (obj) => onResponse(obj, UserModel),
        onError: onError,
        email: _credentials["email"],
        password: _credentials["password"],
        passwordConfirm: _credentials["password"],
        name: "John Doe",
      );
    });
    test("login", () async {
      await _queryUseCase.login(
        onResponse: (obj) => onResponse(obj, AuthModel),
        onError: onError,
        identity: _credentials["email"],
        password: _credentials["password"],
      );
    });
    test("getUser", () async {
      await _queryUseCase.getUser(
        onResponse: (obj) => onResponse(obj, UserModel),
        onError: onError,
        id: _queryUseCase.lastAuth!.record.id,
      );
    });
    test("createNote", () async {
      await _queryUseCase.createNote(
        onResponse: (obj) {
          onResponse(obj, NoteModel);

          noteModel = obj;
        },
        onError: onError,
        userId: _queryUseCase.lastAuth!.record.id,
        name: "Sample Note",
        text: "Some text...",
      );
    });
    test("updateNote", () async {
      await _queryUseCase.updateNote(
        onResponse: (obj) => onResponse(obj, NoteModel),
        onError: onError,
        id: noteModel.id,
        userId: noteModel.userId,
        name: noteModel.name,
        text: "Some updated text...",
      );
    });
    test("getNote", () async {
      await _queryUseCase.getNote(
        onResponse: (obj) => onResponse(obj, NoteModel),
        onError: onError,
        id: noteModel.id,
      );
    });
    test("getNotesList", () async {
      await _queryUseCase.getNotesList(
        onResponse: (obj) => onResponse(obj, List<NoteModel>),
        onError: onError,
      );
    });
    test("deleteNote", () async {
      await _queryUseCase.deleteNote(
        onResponse: (_) {},
        onError: onError,
        id: noteModel.id,
      );
    });
    test("logout", () async {
      await _queryUseCase.logout(
        onResponse: (_) {
          assert(_queryUseCase.lastAuth == null);
        },
        onError: onError,
      );
    });
  });
}
