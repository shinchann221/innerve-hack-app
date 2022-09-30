import 'package:flutter/material.dart';
import 'package:innerve_hackathon/auth/google_sign_in.dart';

import '../components/google_button.dart';
import '../components/snack.dart';
import '../global.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  Auth auth = Auth();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: Image.network(
                      'https://images-na.ssl-images-amazon.com/images/I/61o81imzZpL.png',
                    ),
                  ),
                  const Text(
                    'Women Safety',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  const Text(
                    'Please Sign In to continue',
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      bool? first;
                      int? type;
                      auth.signInWithGoogle().then(
                          (value) => {
                                if (value != null)
                                  {
                                    first = Globals.storage?.getBool('first'),
                                    if (first == true || first == null)
                                      {
                                        Navigator.pushNamedAndRemoveUntil(
                                            context,
                                            '/chooseType',
                                            (route) => false)
                                      }
                                    else
                                      {
                                        type = Globals.storage?.getInt('type'),
                                        if (type == 0)
                                          {
                                            Navigator.pushNamedAndRemoveUntil(
                                                context,
                                                '/home-user',
                                                (route) => false)
                                          }
                                        else if (type == 1)
                                          {
                                            Navigator.pushNamedAndRemoveUntil(
                                                context,
                                                '/home-local',
                                                (route) => false)
                                          }
                                      }
                                  }
                                else
                                  {
                                    Snack.show(context,
                                        'Cannot Sign In! Facing some difficulties')
                                  }
                              },
                          onError: (error) =>
                              Snack.show(context, 'Error $error'));
                    },
                    child: const SignInButton(),
                  ),
                ],
              ),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  textAlign: TextAlign.center,
                  'This application is a part of Innerve Hacks 2022 (IGDTUW, Delhi) submission',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
