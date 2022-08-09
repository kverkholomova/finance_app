import 'package:finance_app/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async{
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
  runApp(const MyApp());
}



