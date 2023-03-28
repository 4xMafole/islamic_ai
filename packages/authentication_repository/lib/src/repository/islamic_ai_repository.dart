import 'package:authentication_repository/authentication_repository.dart';
import 'package:authentication_repository/src/repository/abstracts/abstracts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:local_api/local_api.dart' as local;

/// {@template islamic_ai_repository}
/// Repository which manages IslamicAI authentication.
/// {@endtemplate}
class IslamicAIRepository
    implements AuthenticationRepository, LocalStorageRepository {
  /// {@macro islamic_ai_repository}
  IslamicAIRepository({
    required local.LocalClient authClient,
    FirebaseFirestore? firestore,
  })  : _firestore = firestore ?? FirebaseFirestore.instance,
        _authClient = authClient;

  final FirebaseFirestore _firestore;
  final local.LocalClient _authClient;

  Map<String, dynamic>? _localOwner;

  /// Gets the local owner.
  Map<String, dynamic>? get owner => _localOwner;

  /// Signs in the user with email and password.
  /// Returns an [OUser] instance on successful sign in.
  /// Throws [LogInWithEmailAndPasswordFailure] if an exception occurs.
  @override
  Future<OUser> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credentials = await FirebaseRepository().logInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final docs =
          await _firestore.collection('users').doc(credentials.user!.uid).get();

      return OUser.fromJson(docs.data()!);
    } catch (_) {
      throw const LogInWithEmailAndPasswordFailure();
    }
  }

  /// Signs up the user with email and password.
  /// Returns an [OUser] instance on successful sign up.
  /// Throws [IslamicAISignUpWithEmailAndPasswordFailure]
  /// if an exception occurs.
  @override
  Future<OUser> signUpWithEmailAndPassword({
    required OUser oUser,
    required String password,
  }) async {
    try {
      final credentials = await FirebaseRepository().signUp(
        email: oUser.email,
        password: password,
      );
      oUser = oUser.copyWith(
        uid: credentials.user!.uid,
      );

      await _firestore
          .collection('users')
          .doc(credentials.user!.uid)
          .set(oUser.toJson());
      return oUser;
    } catch (e) {
      throw IslamicAISignUpWithEmailAndPasswordFailure(e.toString());
    }
  }

  /// Signs out the current user.
  /// Throws [IslamicAILogOutFailure] if an exception occurs.
  @override
  Future<void> signOut() async {
    try {
      await FirebaseRepository().logOut();
    } catch (e) {
      throw IslamicAILogOutFailure(e.toString());
    }
  }

  /// Resets the current user's password.
  /// Throws [IslamicAIResetPasswordFailure] if an exception occurs.
  @override
  Future<void> resetPassword({required String email}) async {
    try {
      await FirebaseRepository().resetPassword(email: email);
    } catch (e) {
      throw IslamicAIResetPasswordFailure(e.toString());
    }
  }

  /// Returns a stream of [OUser] for the given [uid].
  /// Throws [IslamicAIGetOwnerException] if an exception occurs.
  @override
  Stream<OUser> getOwner(String uid) {
    try {
      return _firestore
          .collection('users')
          .doc(uid)
          .snapshots()
          .map((event) => OUser.fromJson(event.data()!));
    } catch (e) {
      throw IslamicAIGetOwnerException(e.toString());
    }
  }

  /// Signs in the user with Google.
  /// Returns an [OUser] instance on successful sign in.
  /// Throws [IslamicAISignWithGoogleException] if an exception occurs.
  @override
  Future<OUser> signInWithGoogle() async {
    try {
      final credentials = await FirebaseRepository().logInWithGoogle();
      final user = credentials.user;

      final docs = await _firestore.collection('users').doc(user!.uid).get();

      if (docs.exists) {
        return OUser.fromJson(docs.data()!);
      } else {
        final oUser = OUser(
          uid: user.uid,
          email: user.email!,
          firstName: user.displayName ?? '',
          lastName: '',
        );

        await _firestore.collection('users').doc(user.uid).set(oUser.toJson());

        return oUser;
      }
    } catch (e) {
      throw IslamicAISignWithGoogleException(e.toString());
    }
  }

  /// Signs in the user with Apple.
  /// Returns an [OUser] instance on successful sign in.
  /// Throws [IslamicAISignWithAppleException] if an exception occurs.
  @override
  Future<OUser> signInWithApple() async {
    try {
      final credentials = await FirebaseRepository().logInWithApple();
      final user = credentials.user;

      final docs = await _firestore.collection('users').doc(user!.uid).get();

      if (docs.exists) {
        return OUser.fromJson(docs.data()!);
      } else {
        final oUser = OUser(
          uid: user.uid,
          email: user.email!,
          firstName: user.displayName ?? '',
          lastName: '',
        );

        await _firestore.collection('users').doc(user.uid).set(oUser.toJson());

        return oUser;
      }
    } catch (e) {
      throw IslamicAISignWithAppleException(e.toString());
    }
  }

  /// Signs in the user with Microsoft.
  /// Returns an [OUser] instance on successful sign in.
  /// Throws [IslamicAISignWithMicrosoftException] if an exception occurs.
  @override
  Future<OUser> signInWithMicrosoft() async {
    try {
      final credentials = await FirebaseRepository().logInWithMicrosoft();
      final user = credentials.user;

      final docs = await _firestore.collection('users').doc(user!.uid).get();

      if (docs.exists) {
        return OUser.fromJson(docs.data()!);
      } else {
        final oUser = OUser(
          uid: user.uid,
          email: user.email!,
          firstName: user.displayName ?? '',
          lastName: '',
        );

        await _firestore.collection('users').doc(user.uid).set(oUser.toJson());

        return oUser;
      }
    } catch (e) {
      throw IslamicAISignWithMicrosoftException(e.toString());
    }
  }

  /// Retrieves the locally stored owner information.
  /// Returns a map of owner data or null if not available.
  @override
  Map<String, dynamic>? getLocalOwner() {
    return _localOwner = _authClient.getOwner();
  }

  /// Sets the local owner information with the provided [owner] map.
  @override
  Future<void> setLocalOwner(Map<String, dynamic> owner) async =>
      _authClient.setOwner(owner);

  /// Clears the locally stored owner information.
  @override
  Future<void> clearLocalOwner() async => _authClient.clearOwner();

  /// Saves the local onboard status with the provided [status] value.
  @override
  Future<void> saveLocalOnboardStatus({required bool status}) async =>
      _authClient.saveOnboardStatus(status: status);

  /// Retrieves the locally stored onboard status.
  /// Returns the onboard status or null if not available.
  @override
  bool? getLocalOnboardStatus() => _authClient.getOnboardStatus();

  /// Saves the local language with the provided [language] value.
  @override
  Future<void> saveLocalLanguage({required String language}) async =>
      _authClient.saveLanguage(language: language);

  /// Retrieves the locally stored language.
  /// Returns the language or null if not available.
  @override
  String? getLocalLanguage() => _authClient.getLanguage();
}
