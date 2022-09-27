import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'ui/choose_type.dart';
import 'ui/home_admin.dart';
import 'ui/home_local_admin.dart';
import 'ui/home_user.dart';
import 'ui/sign_in.dart';
import 'ui/user-form.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

//Todo: Implement user check logic and set route accordingly

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/user-form',
      routes: {
        '/signIn': (context) => const SignIn(),
        '/chooseType': (context) => const ChooseType(),
        '/user-form': (context) => const UserForm(),
        '/home-user': (context) => const HomeUser(),
        '/home-local': (context) => const HomeLocalAdmin(),
        '/home-super': (context) => const HomeAdmin(),
      },
    );
  }
}
