import 'dart:ui';

import 'package:flutter/material.dart';

import '../components/choice_tile.dart';

class ChooseType extends StatefulWidget {
  const ChooseType({Key? key}) : super(key: key);

  @override
  State<ChooseType> createState() => _ChooseTypeState();
}

class _ChooseTypeState extends State<ChooseType> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Select one of the following',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.teal[700],
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/home-user');
                },
                child: const ChoiceTile(
                  url:
                      'https://static.vecteezy.com/system/resources/thumbnails/005/026/528/small/illustration-female-avatar-in-flat-style-free-vector.jpg',
                  text: 'User',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/home-local');
                },
                child: const ChoiceTile(
                  url:
                      'https://cdn5.vectorstock.com/i/thumb-large/42/29/admin-support-blue-rgb-color-icon-virtual-vector-39924229.jpg',
                  text: 'Local Admin',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/home-super');
                },
                child: const ChoiceTile(
                  url:
                      'https://static.vecteezy.com/system/resources/thumbnails/000/290/610/small/10__2850_29.jpg',
                  text: 'Super Admin',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
