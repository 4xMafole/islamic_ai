// ignore_for_file: public_member_api_docs

abstract class LocalStorageRepository {
  Map<String, dynamic>? getLocalOwner();
  Future<void> setLocalOwner(Map<String, dynamic> owner);
  Future<void> clearLocalOwner();
  Future<void> saveLocalOnboardStatus({required bool status});
  bool? getLocalOnboardStatus();
  Future<void> saveLocalLanguage({required String language});
  String? getLocalLanguage();
}
