import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  static Future<SharedPreferences> init() async {
    return sharedPreferences = await SharedPreferences.getInstance();
  }

  static void setBoolData(String key, bool value) {
    sharedPreferences.setBool(key, value);
  }

  static bool? getBoolData(String key) {
    return sharedPreferences.getBool(key);
  }
}
