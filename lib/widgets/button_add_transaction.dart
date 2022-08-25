import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_app/models/histogram.dart';
import 'package:finance_app/screens/add_transaction.dart';
import 'package:finance_app/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/data.dart';

var ID;
double sumTransactions = 0;
double groceriesTransactions = 0;
double leisureTransactions = 0;
double fuelTransactions = 0;
double cosmeticsTransactions = 0;
double healthTransactions = 0;


class ButtonAddTransaction extends StatefulWidget {
  const ButtonAddTransaction({Key? key}) : super(key: key);


  @override
  State<ButtonAddTransaction> createState() => _ButtonAddTransactionState();
}

class _ButtonAddTransactionState extends State<ButtonAddTransaction> {

@override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          height: 50,
          width: double.infinity,
          child: MaterialButton(
              color: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(color: Colors.orangeAccent, width: 2),
              ),
              onPressed: () async{
                  setState(() {
                    sumTransactions = sumTransactions + double.parse(userInput);

                    if(valueChosen == "Groceries"){
                      groceriesTransactions = groceriesTransactions + double.parse(userInput);
                    }
                    else if(valueChosen == 'Leisure'){
                      leisureTransactions = leisureTransactions + double.parse(userInput);
                    }
                    else if(valueChosen == 'Fuel'){
                      fuelTransactions = fuelTransactions + double.parse(userInput);
                    }
                    else if(valueChosen == 'Cosmetics'){
                      cosmeticsTransactions = cosmeticsTransactions + double.parse(userInput);
                    }
                    else if(valueChosen == 'Health'){
                      healthTransactions = healthTransactions + double.parse(userInput);
                    }

                  });

                  ID = FirebaseAuth.instance.currentUser?.uid;
                  await FirebaseFirestore.instance
                      .collection('transactions')
                      .add({
                    'userID': ID,
                    "transfer_amount": double.parse(userInput),
                    "category_name": valueChosen,
                    "time": '${DateTime.now()}',
                    "date": transactionDate,
                    "transaction_id": ""

                  });

                  if(valueChosen == "Groceries"){
                    await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).update({
                      "summa": sumTransactions,
                      'groceries_summa': groceriesTransactions,
                    });
                    // chartData.add(ChartData(valueChosen, groceriesTransactions));

                  }
                  else if(valueChosen == 'Leisure'){
                    await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).update({
                      "summa": sumTransactions,
                      'leisure_summa':leisureTransactions,
                    });
                    // chartData.add(ChartData(valueChosen, leisureTransactions));

                  }
                  else if(valueChosen == 'Fuel'){
                    await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).update({
                      "summa": sumTransactions,
                      'fuel_summa': fuelTransactions,
                    });
                    // chartData.add(ChartData(valueChosen, fuelTransactions));

                  }
                  else if(valueChosen == 'Cosmetics'){
                    await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).update({
                      "summa": sumTransactions,
                      'cosmetics_summa':cosmeticsTransactions,
                    });
                    // chartData.add(ChartData(valueChosen, cosmeticsTransactions));

                  }
                  else if(valueChosen == 'Health'){
                    await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).update({
                      "summa": sumTransactions,
                      'health_summa':healthTransactions,
                    });
                    // chartData.add(ChartData(valueChosen, healthTransactions));

                  }
                  userInput = "0.00";
                  transactionDate =DateFormat('dd, MMMM yyyy').format(DateTime.now()).toString();

                    // setState(() {
                    //   Histogram();
                    //   getDataHistogram();
                    // });
  Future.delayed(const Duration(milliseconds: 600), () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage()),
                    );
                  });
              },
              child: const Text("Add transaction", style: TextStyle(color: Colors.black, fontSize: 16),)),
        ),
      ),
    );
  }
}