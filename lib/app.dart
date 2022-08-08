import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:finance_app/screens/sign_in.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        nextScreen: const SignIn(),
        splashTransition: SplashTransition.fadeTransition,
        duration: 2000,
      )
    );
  }
}
