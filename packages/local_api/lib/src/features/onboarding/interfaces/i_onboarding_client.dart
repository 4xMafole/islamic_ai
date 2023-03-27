// ignore_for_file: public_member_api_docs

/// Interface for onboarding client.
abstract class IOnboardingClient {
  Future<void> saveOnboardStatus({required bool status});
  bool? getOnboardStatus();
}
