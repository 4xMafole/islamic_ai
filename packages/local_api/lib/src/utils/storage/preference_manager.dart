import 'package:shared_preferences/shared_preferences.dart';

/// Singleton class that manages the shared instance of [SharedPreferences].
class PreferenceManager {
  /// Private constructor to prevent instantiation.
  PreferenceManager._();

  /// Singleton instance of [PreferenceManager].
  static final PreferenceManager instance = PreferenceManager._();

  /// The shared [SharedPreferences] instance.
  late final SharedPreferences _sharedPreferences;

  /// Initializes the [SharedPreferences] instance.
  Future<void> initialize() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  /// Getter for the shared [SharedPreferences] instance.
  SharedPreferences get sharedPreferences => _sharedPreferences;
}
