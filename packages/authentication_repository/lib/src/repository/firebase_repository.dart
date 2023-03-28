import 'package:authentication_repository/src/exceptions/exceptions.dart';
import 'package:authentication_repository/src/models/models.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// {@template firebase_repository}
/// Repository which manages firebase authentication.
/// {@endtemplate}
class FirebaseRepository {
  /// {@macro firebase_repository}
  FirebaseRepository({
    firebase_auth.FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
  })  : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn.standard();

  final firebase_auth.FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  /// User cache key.
  /// Should only be used for testing purposes.
  @visibleForTesting
  static const userCacheKey = '__user_cache_key__';

  /// Stream of [user] which will emit the current user when
  /// the authentication state changes.
  ///
  /// Emits [User.empty] if the user is not authenticated.
  ///
  Stream<User> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      final user = firebaseUser == null ? User.empty : firebaseUser.toUser;

      return user;
    });
  }

  /// Creates a new user with the provided [email] and [password].
  ///
  /// Throws a [SignUpWithEmailAndPasswordFailure] if an exception occurs.
  Future<firebase_auth.UserCredential> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await userCredential.user!.sendEmailVerification();
      return userCredential;
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw SignUpWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const SignUpWithEmailAndPasswordFailure();
    }
  }

  /// Starts the Sign In with Google Flow
  ///
  /// Throws a [LogInWithGoogleFailure] if an exception occurs.
  Future<firebase_auth.UserCredential> logInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser!.authentication;
      final credential = firebase_auth.GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return await _firebaseAuth.signInWithCredential(credential);
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw LogInWithGoogleFailure.fromCode(e.code);
    } catch (_) {
      throw const LogInWithGoogleFailure();
    }
  }

  /// Starts the Sign In Phone Flow.
  ///
  /// Throws a [LogInWithPhoneFailure] if an exception occurs.
  Future<firebase_auth.UserCredential> logInWithPhone({
    required String verificationId,
    required String smsCode,
  }) async {
    try {
      final phoneAuthCredential = firebase_auth.PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );

      return await _firebaseAuth.signInWithCredential(phoneAuthCredential);
    } catch (_) {
      throw LogInWithPhoneFailure();
    }
  }

  /// Starts the Sign In with Apple Flow
  ///
  /// Throws a [LogInWithAppleFailure] if an exception occurs.
  Future<firebase_auth.UserCredential> logInWithApple() async {
    try {
      final appleProvider = firebase_auth.AppleAuthProvider();
      final credential = await _firebaseAuth.signInWithProvider(appleProvider);
      return credential;
    } catch (_) {
      throw LogInWithAppleFailure();
    }
  }

  /// Starts the Sign In with Microsoft Flow
  ///
  /// Throws a [LogInWithMicrosoftFailure] if an exception occurs.
  Future<firebase_auth.UserCredential> logInWithMicrosoft() async {
    try {
      final credential = await _signInWithMicrosoft();
      return await _firebaseAuth.signInWithCredential(credential);
    } catch (_) {
      throw LogInWithMicrosoftFailure();
    }
  }

  /// Helper function for Microsoft sign in
  Future<firebase_auth.OAuthCredential> _signInWithMicrosoft() async {
    final microsoftProvider = firebase_auth.OAuthProvider('microsoft.com');
    final userCredential =
        await _firebaseAuth.signInWithPopup(microsoftProvider);
    return userCredential.credential! as firebase_auth.OAuthCredential;
  }

  /// Returns user credentials after Signing in with
  /// the provided [email] and [password]
  ///
  /// Throws a [LogInWithEmailAndPasswordFailure] if an exception occurs.
  Future<firebase_auth.UserCredential> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      return await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw LogInWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const LogInWithEmailAndPasswordFailure();
    }
  }

  /// Returns user credentials after signing in anonymously
  ///
  /// Throws a [LoginAnonymouslyFailure] if an exception occurs.
  Future<firebase_auth.UserCredential> signInUserAnonymously() async {
    try {
      return await _firebaseAuth.signInAnonymously();
    } catch (_) {
      throw LoginAnonymouslyFailure();
    }
  }

  /// Signs out the current user which will emit
  /// [User.empty] from the [user] Stream.
  ///
  /// Throws a [LogOutFailure] if an exception occurs.
  Future<void> logOut() async {
    try {
      await Future.wait([
        _firebaseAuth.signOut(),
        _googleSignIn.signOut(),
      ]);
    } catch (_) {
      throw LogOutFailure();
    }
  }

  /// Resets user's password using email.
  ///
  /// Throws a [ResetPasswordFailure] if an exception occurs.
  Future<void> resetPassword({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (_) {
      throw ResetPasswordFailure();
    }
  }
}

/// Firebase user extension
extension FirebaseUser on firebase_auth.User {
  /// Firebase user extension
  User get toUser {
    return User(
      id: uid,
      email: email,
      name: displayName,
      photo: photoURL,
    );
  }
}
