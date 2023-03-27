import 'dart:convert';

import 'package:local_api/src/features/auth/interfaces/interfaces.dart';
import 'package:local_api/src/utils/constants/constant_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Authentication client responsible for managing user data.
class AuthClient implements IAuthClient {
  /// Constructor for AuthClient, requires SharedPreferences instance.
  AuthClient({required SharedPreferences sharedPreferences})
      : _sharedPreferences = sharedPreferences;

  final SharedPreferences _sharedPreferences;

  /// Retrieves the stored user data.
  @override
  Map<String, dynamic> getOwner() {
    final data = _sharedPreferences.getString(ConstantStrings.userKey);
    return json.decode(data!) as Map<String, dynamic>;
  }

  /// Stores the user data.
  @override
  Future<void> setOwner(Map<String, dynamic> owner) async {
    await _sharedPreferences.setString(
      ConstantStrings.userKey,
      json.encode(owner),
    );
  }

  /// Removes the stored user data.
  @override
  Future<void> clearOwner() async {
    await _sharedPreferences.remove(ConstantStrings.userKey);
  }
}
