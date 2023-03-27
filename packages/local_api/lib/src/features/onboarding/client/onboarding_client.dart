import 'package:local_api/src/features/onboarding/interfaces/interfaces.dart';
import 'package:local_api/src/utils/constants/constant_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Onboarding client responsible for managing onboarding status.
class OnboardingClient implements IOnboardingClient {
  /// Constructor for OnboardingClient, requires SharedPreferences instance.
  OnboardingClient({required SharedPreferences sharedPreferences})
      : _sharedPreferences = sharedPreferences;

  final SharedPreferences _sharedPreferences;

  /// Stores the onboarding status.
  @override
  Future<void> saveOnboardStatus({required bool status}) {
    return _sharedPreferences.setBool(ConstantStrings.onboard, status);
  }

  /// Retrieves the stored onboarding status.
  @override
  bool? getOnboardStatus() {
    final status = _sharedPreferences.getBool(ConstantStrings.onboard);
    return status;
  }
}
