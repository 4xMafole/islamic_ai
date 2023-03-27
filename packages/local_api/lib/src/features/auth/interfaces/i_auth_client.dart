// ignore_for_file: public_member_api_docs

/// Interface for authentication client.
abstract class IAuthClient {
  Map<String, dynamic> getOwner();
  Future<void> setOwner(Map<String, dynamic> owner);
  Future<void> clearOwner();
}
