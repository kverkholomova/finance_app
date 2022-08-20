// @dart=2.9

import 'package:finance_app/app.dart';
import 'package:finance_app/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

var status;

Future<void> main() async{
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // status = prefs.getBool('isLoggedIn') ?? false;
  // print(status);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(


    // options: FirebaseOptions(
    //   apiKey: "",
    //   appId: "",
    //   messagingSenderId: "",
    //   projectId: "",
    // )
    // options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}



