import 'package:local_api/src/features/auth/client/client.dart';
import 'package:local_api/src/features/language/client/client.dart';
import 'package:local_api/src/features/onboarding/client/client.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// LocalClient is a unified class for managing local data,
/// including authentication, onboarding, and language preferences.
class LocalClient {
  /// Constructor for LocalClient, requires SharedPreferences instance.
  LocalClient({required SharedPreferences sharedPreferences})
      : _authClient = AuthClient(sharedPreferences: sharedPreferences),
        _onboardingClient =
            OnboardingClient(sharedPreferences: sharedPreferences),
        _languageClient = LanguageClient(sharedPreferences: sharedPreferences);

  final AuthClient _authClient;
  final OnboardingClient _onboardingClient;
  final LanguageClient _languageClient;

  // AuthClient methods

  /// Retrieves the stored user data.
  Map<String, dynamic> getOwner() => _authClient.getOwner();

  /// Stores the user data.
  Future<void> setOwner(Map<String, dynamic> owner) =>
      _authClient.setOwner(owner);

  /// Removes the stored user data.
  Future<void> clearOwner() => _authClient.clearOwner();

  // OnboardingClient methods

  /// Stores the onboarding status.
  Future<void> saveOnboardStatus({required bool status}) =>
      _onboardingClient.saveOnboardStatus(status: status);

  /// Retrieves the stored onboarding status.
  bool? getOnboardStatus() => _onboardingClient.getOnboardStatus();

  // LanguageClient methods

  /// Stores the language preference.
  Future<void> saveLanguage({required String language}) =>
      _languageClient.saveLanguage(language: language);

  /// Retrieves the stored language preference.
  String? getLanguage() => _languageClient.getLanguage();
}
