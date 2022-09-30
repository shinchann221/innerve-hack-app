import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'auth/google_sign_in.dart';
import 'global.dart';
import 'service/db.dart';
import 'ui/choose_type.dart';
import 'ui/home_local_admin.dart';
import 'ui/home_user.dart';
import 'ui/sign_in.dart';
import 'ui/user-form.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Globals.init();
  Globals.fcm.requestPermission(
      criticalAlert: true, carPlay: true, announcement: true);
  DB.saveToken(await Globals.fcm.getToken());
  await Firebase.initializeApp();
  runApp(const MyApp());
}

//Todo: Implement user check logic and set route accordingly

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Future<User?> check() async {
    Auth auth = Auth();
    return auth.user;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder<User?>(
        future: check(),
        builder: (context, data) {
          if (data.connectionState != ConnectionState.active) {
            return const SizedBox(
              height: 100,
              width: 100,
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
                color: Colors.teal,
                strokeWidth: 2,
              ),
            );
          } else {
            if (data.data == null) {
              return const SignIn();
            } else {
              int? user = Globals.storage?.getInt('type');
              if (user == 0) {
                return const HomeUser();
              } else if (user == 1) {
                return const HomeLocalAdmin();
              } else {
                return const SizedBox(
                  height: 100,
                  width: 100,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                    color: Colors.teal,
                    strokeWidth: 2,
                  ),
                );
              }
            }
          }
        },
      ),
      routes: {
        '/signIn': (context) => const SignIn(),
        '/chooseType': (context) => const ChooseType(),
        '/user-form': (context) => const UserForm(),
        '/home-user': (context) => const HomeUser(),
        '/home-local': (context) => const HomeLocalAdmin(),
      },
    );
  }
}
