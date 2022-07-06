import 'package:shared_preferences/shared_preferences.dart';

class SharedManager {
  SharedPreferences? preferences;

  SharedManager();

  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  void _checkPreferences() {
    if (preferences == null) {
      throw 'Your Shared Preferences is not initialize';
    }
  }

  Future<void> saveStringValue(SharedManagerKeys key, String value) async {
    _checkPreferences();
    await preferences?.setString(key.name, value);
  }

  String? getStringValue(SharedManagerKeys key) {
    _checkPreferences();
    return preferences?.getString(key.name);
  }
}

enum SharedManagerKeys {
  users,
}
