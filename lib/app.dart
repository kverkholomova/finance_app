import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:finance_app/screens/home_screen.dart';
import 'package:finance_app/screens/sign_in.dart';
import 'package:finance_app/services/auth.dart';
import 'package:finance_app/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimatedSplashScreen(
        splash: 'assets/logo.png',
        splashIconSize: 180,
        nextScreen: status == true ? Wrapper() : MyHomePage(),
        splashTransition: SplashTransition.rotationTransition,
        duration: 2000,
      )
    );
  }
}
