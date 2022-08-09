import 'package:finance_app/screens/home_screen.dart';
import 'package:finance_app/screens/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'authenticate/authenticate.dart';
import 'models/users.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final user=Provider.of<Users?>(context);
    if (user==null){
      return Authenticate();
    } else if(optionSignIn){
      return MyHomePage();
    }else if(!optionSignIn){
      return MyHomePage();
    }
    else{
      return MyHomePage();
    }
    //return either Home or Return Widget

  }
}