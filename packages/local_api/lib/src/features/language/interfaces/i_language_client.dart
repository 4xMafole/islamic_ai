/// Interface for language client.
// ignore_for_file: public_member_api_docs

abstract class ILanguageClient {
  Future<void> saveLanguage({required String language});
  String? getLanguage();
}
