import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:finance_app/models/data.dart';
import 'package:finance_app/screens/home_screen.dart';
import 'package:finance_app/screens/sign_in.dart';
import 'package:finance_app/services/auth.dart';
import 'package:finance_app/services/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
// class MyApp extends StatelessWidget {
//   MyApp({Key? key}) : super(key: key);

  late StreamSubscription<User?> user;
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 300), () async {
      addNote(0);
    });
    user = FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }

  @override
  void dispose() {
    user.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
        initialRoute:
        FirebaseAuth.instance.currentUser == null ? Wrapper().id : MyHomePage().id,

        ///key value pair
        routes: {
          MyHomePage().id: (context) =>MyHomePage(),
          Wrapper().id: (context) => Wrapper(),
        },
        home: AnimatedSplashScreen(
        splash: 'assets/logo.png',
        splashIconSize: 180,
        nextScreen: MyHomePage(),
        splashTransition: SplashTransition.rotationTransition,
        duration: 2000,
      )
    );
  }
}
