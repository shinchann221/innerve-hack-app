import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Globals {
  static SharedPreferences? storage;
  static FirebaseMessaging fcm = FirebaseMessaging.instance;

  static Future init() async {
    storage = await SharedPreferences.getInstance();
  }
}
