import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_app/screens/add_transaction.dart';
import 'package:finance_app/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.7,  bottom: MediaQuery.of(context).size.height * 0.05),
      child: Align(
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
                    // "summa": sumTransactions,
                    "time": '${DateTime.now()}',
                    "date": transactionDate,
                    "transaction_id": ""
                    // "category_icon": valueIcon.toString(),
                    // "date": '${DateTime.now().day.toString().length<2? "0${DateTime.now().day}":DateTime.now().day} / ${DateTime.now().month.toString().length<2? "0${DateTime.now().month}":DateTime.now().month} / ${DateTime.now().year}',

                  });

                  if(valueChosen == "Groceries"){
                    // groceriesTransactions += double.parse(userInput);
                    await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).update({
                      "summa": sumTransactions,
                      'groceries_summa': groceriesTransactions,
                    });
                    // chartData.add(ChartData(valueChosen, groceriesTransactions));

                  }
                  else if(valueChosen == 'Leisure'){
                    // leisureTransactions += double.parse(userInput);
                    await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).update({
                      "summa": sumTransactions,
                      'leisure_summa':leisureTransactions,
                    });
                    // chartData.add(ChartData(valueChosen, leisureTransactions));

                  }
                  else if(valueChosen == 'Fuel'){
                    // fuelTransactions += double.parse(userInput);
                    await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).update({
                      "summa": sumTransactions,
                      'fuel_summa': fuelTransactions,
                    });
                    // chartData.add(ChartData(valueChosen, fuelTransactions));

                  }
                  else if(valueChosen == 'Cosmetics'){
                    // cosmeticsTransactions += double.parse(userInput);
                    await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).update({
                      "summa": sumTransactions,
                      'cosmetics_summa':cosmeticsTransactions,
                    });
                    // chartData.add(ChartData(valueChosen, cosmeticsTransactions));

                  }
                  else if(valueChosen == 'Health'){
                    // healthTransactions += double.parse(userInput);
                    await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).update({
                      "summa": sumTransactions,
                      'health_summa':healthTransactions,
                    });
                    // chartData.add(ChartData(valueChosen, healthTransactions));

                  }
                  getDataHistogram();
                  userInput = "0.00";
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  );

                },
                child: const Text("Add transaction", style: TextStyle(color: Colors.black, fontSize: 16),)),
          ),
        ),
      ),
    );
  }
}