import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String _keyEmail = 'auth_email';
  static const String _keyPassword = 'auth_password';
  static const String _keyName = 'auth_name';

  const AuthService();

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyName, name);
    await prefs.setString(_keyEmail, email);
    await prefs.setString(_keyPassword, password);
  }

  Future<bool> hasAccount() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(_keyEmail) && prefs.containsKey(_keyPassword);
  }

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final savedEmail = prefs.getString(_keyEmail);
    final savedPassword = prefs.getString(_keyPassword);

    if (savedEmail == null || savedPassword == null) return false;
    return savedEmail == email && savedPassword == password;
  }

  Future<String?> getSavedEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyEmail);
  }

  Future<String?> getSavedName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyName);
  }
}


