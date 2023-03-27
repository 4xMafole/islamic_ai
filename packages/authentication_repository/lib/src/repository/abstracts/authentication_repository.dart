import 'package:authentication_repository/src/models/ouser.dart';
// ignore_for_file: public_member_api_docs

abstract class AuthenticationRepository {
  Future<OUser> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<OUser> signUpWithEmailAndPassword({
    required OUser oUser,
    required String password,
  });
  Future<OUser> signInWithGoogle();
  Future<OUser> signInWithApple();
  Future<OUser> signInWithMicrosoft();
  Future<void> signOut();
  Future<void> resetPassword({required String email});
  Stream<OUser> getOwner(String uid);
}
