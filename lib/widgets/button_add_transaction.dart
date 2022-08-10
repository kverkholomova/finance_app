import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_app/screens/add_transaction.dart';
import 'package:finance_app/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

var ID;
class ButtonAddTransaction extends StatelessWidget {
  const ButtonAddTransaction({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.7,  bottom: MediaQuery.of(context).size.height * 0.05),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            height: 50,
            width: double.infinity,
            child: RaisedButton(
                color: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: Colors.orangeAccent, width: 2),
                ),
                onPressed: () async{
                  ID = FirebaseAuth.instance.currentUser?.uid;
                  await FirebaseFirestore.instance
                      .collection('transfers')
                      .add({
                    'userID': ID,
                    "transfer_amount": userInput,
                    "category_name": valueChosen,
                    // "category_icon": valueIcon.toString(),
                    "date": '${DateTime.now().day.toString().length<2? "0${DateTime.now().day}":DateTime.now().day} / ${DateTime.now().month.toString().length<2? "0${DateTime.now().month}":DateTime.now().month} / ${DateTime.now().year}',

                  });
                  userInput = "0";
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  );
                },
                child: Text("Add transaction", style: TextStyle(color: Colors.black, fontSize: 16),)),
          ),
        ),
      ),
    );
  }
}