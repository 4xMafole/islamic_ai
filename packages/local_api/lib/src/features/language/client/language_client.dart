import 'package:local_api/src/features/language/interfaces/interfaces.dart';
import 'package:local_api/src/utils/constants/constant_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Language client responsible for managing language preferences.
class LanguageClient implements ILanguageClient {
  /// Constructor for LanguageClient, requires SharedPreferences instance.
  LanguageClient({required SharedPreferences sharedPreferences})
      : _sharedPreferences = sharedPreferences;

  final SharedPreferences _sharedPreferences;

  /// Stores the language preference.
  @override
  Future<void> saveLanguage({required String language}) {
    return _sharedPreferences.setString(ConstantStrings.language, language);
  }

  /// Retrieves the stored language preference.
  @override
  String? getLanguage() {
    final language = _sharedPreferences.getString(ConstantStrings.language);
    return language;
  }
}
