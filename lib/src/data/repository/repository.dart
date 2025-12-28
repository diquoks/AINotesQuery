import 'package:ai_notes_query/ai_notes_query.dart';

abstract interface class Repository {
  AuthModel? get lastAuth;

  Future<UserModel> signup({
    required String email,
    required String password,
    required String passwordConfirm,
    required String name,
  });

  Future<AuthModel> login({required String identity, required String password});

  Future<void> logout();

  Future<UserModel> getUser({required String id});

  Future<NoteModel> createNote({
    required String userId,
    required String name,
    required String text,
  });

  Future<NoteModel> updateNote({
    required String id,
    required String userId,
    required String name,
    required String text,
  });

  Future<NoteModel> getNote({required String id});

  Future<List<NoteModel>> getNotesList();
}
