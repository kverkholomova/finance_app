import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:finance_app/screens/home_screen.dart';
import 'package:finance_app/widgets/button_add_transaction.dart';
import 'package:finance_app/widgets/streamBuilder_transactions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';
import '../models/data.dart';
import '../widgets/edit_amount_text_field.dart';
import '../widgets/edit_date_of_transaction_text_field.dart';
import 'calendar_edit.dart';

String? categoryDefault;
String dateTime = '';
String? categoryChosen;
// String categoryChosen = dropdownItemList[3]["value"];
bool amount = false;
bool dateTr = false;
bool category = false;
double transferAmountNew = 0;
String? initialCategory;

String? initialDate;
Color colorButton1 = Colors.white;
Color colorButton2 = Colors.white;
Icon iconButton1 = Icon(
  Icons.check,
  color: Colors.orangeAccent,
);
Icon iconButton2 = Icon(
  Icons.check,
  color: Colors.orangeAccent,
);

class EditTransaction extends StatefulWidget {
  const EditTransaction({Key? key}) : super(key: key);

  @override
  State<EditTransaction> createState() => _EditTransactionState();
}

class _EditTransactionState extends State<EditTransaction> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print("PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPp");
    print(transactionAmount);
    print(transferAmountNew);
    // categoryChosen = transactionCategory;
    // double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit transaction",
          style: headStyle,
          textAlign: TextAlign.left,
        ),
        leading: IconButton(
          icon: closeIcon,
          onPressed: () {
            transactionDate = '';
            transferAmountNew = 0;
            transactionCategory = '';
            transactionId = '';
            initialCategory = "";

            transactionAmount = 0;
            initialDate = '';
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyHomePage()),
            );
          },
        ),
        elevation: 0,
        backgroundColor: Colors.purple,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      child: TextFormField(
                        decoration: editInputDecoration.copyWith(
                            hintText: transferAmountNew == 0
                                ? transactionAmount.toString()
                                : transferAmountNew.toString()),
                        validator: (val) =>
                            val!.isEmpty ? transactionAmount.toString() :transferAmountNew.toString(),
                        onChanged: (val) {
                          transferAmountNew = double.parse(val);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: colorButton1,
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(width: 2, color: Colors.orangeAccent)
                      ),
                      width: 55,
                      height: 55,
                      child: IconButton(
                          onPressed: () {
                            setState(() {
                              colorButton1 = Colors.orangeAccent;
                              iconButton1 = Icon(
                                Icons.check,
                                color: Colors.white,
                              );
                              amount = true;
                            });
                          },
                          icon: iconButton1),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.02),
                  child: Row(
                    children: [
                      Flexible(
                        child: TextFormField(
                          decoration: editInputDecoration.copyWith(
                              hintText:
                                  dateTime == '' ? transactionDate : dateTime),
                          validator: (val) =>
                              val!.isEmpty ? val = transactionDate : dateTime,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CalendarEdit()));
                          },
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: colorButton2,
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(width: 2, color: Colors.orangeAccent)
                        ),
                        width: 55,
                        height: 55,
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                colorButton2 = Colors.orangeAccent;
                                iconButton2 = Icon(
                                  Icons.check,
                                  color: Colors.white,
                                );
                                dateTime == '' ? transactionDate : dateTime;
                              });
                            },
                            icon: iconButton2

                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.05),
                    child: Align(
                        alignment: Alignment.center,
                        child: buildCoolDropdownEdit(context))),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Align(
          alignment: const Alignment(0, 0.95),
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
                onPressed: () async {
                  print("SSSSSSSSSSSSSSSSSSSUUUUUUUUUUUUUUUUUUUMMMMMMMMMMMMMMMMMMMMMMMM");
                  // print(sumTransactions);
                  print(transferAmountNew);
                  // Future.delayed(const Duration(milliseconds: 200), () async {
                  //
                  // });
                  // print(transactionDate);
                  // print(transactionAmount);
                  print(transactionCategory);
                  // print(transactionId);
                  print(initialCategory);
                  print(categoryChosen);
                  // print(initialAmount);
                  // print(initialDate);
                  print(amount);
                  print(dateTr);
                  print(category);
                  chartData.clear();
                  print("CCCCCCCCCCCCCChart DDDDDDDDDdata");
                  print(chartData);

                  Future.delayed(const Duration(milliseconds: 200), () async {


                    if (amount == true) {
                      // if (initialAmount == transferAmountNew) {
                      // } else {
                        print(sumTransactions);
                        // print(double.parse(sumTransactions.toString()) - double.parse(initialAmount.toString()));
                        sumTransactions = sumTransactions - transactionAmount;
                        print(sumTransactions);
                        sumTransactions = sumTransactions + transferAmountNew;
                        print(sumTransactions);
                        await FirebaseFirestore.instance
                            .collection('users')
                            .doc(FirebaseAuth.instance.currentUser!.uid)
                            .update({
                          "summa": sumTransactions,
                        });
                        if(categoryChosen == null){
                          if(initialCategory == "Groceries"){
                            await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).update({
                              "summa": sumTransactions,
                              'groceries_summa': transferAmountNew,
                            });
                            chartData.add(ChartData(initialCategory, transferAmountNew));

                          }
                          else if(initialCategory == 'Leisure'){
                            await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).update({
                              "summa": sumTransactions,
                              'leisure_summa':transferAmountNew,
                            });
                            chartData.add(ChartData(initialCategory, transferAmountNew));

                          }
                          else if(initialCategory == 'Fuel'){
                            await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).update({
                              "summa": sumTransactions,
                              'fuel_summa': transferAmountNew,
                            });
                            chartData.add(ChartData(initialCategory, transferAmountNew));

                          }
                          else if(initialCategory == 'Cosmetics'){
                            await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).update({
                              "summa": sumTransactions,
                              'cosmetics_summa':transferAmountNew,
                            });
                            chartData.add(ChartData(initialCategory, transferAmountNew));

                          }
                          else if(initialCategory == 'Health'){
                            await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).update({
                              "summa": sumTransactions,
                              'health_summa':transferAmountNew,
                            });
                            chartData.add(ChartData(initialCategory, transferAmountNew));

                          }
                        }

                        // }
                      // }
                      await FirebaseFirestore.instance
                          .collection('transactions')
                          .doc(stream)
                          .update({
                        "transfer_amount": transferAmountNew,
                      });
                    }
                    if (dateTr == true) {
                      await FirebaseFirestore.instance
                          .collection('transactions')
                          .doc(stream)
                          .update({
                        "date": dateTime == '' ? transactionDate : dateTime,
                      });
                    }
                    if (category == true && amount == true) {
                      if (initialCategory == categoryChosen) {
                        if (transactionAmount == transferAmountNew) {
                        } else {
                          if (transactionCategory == 'Groceries') {
                            groceriesTransactions =
                                groceriesTransactions - transactionAmount;
                            groceriesTransactions =
                                groceriesTransactions + transferAmountNew;
                            await FirebaseFirestore.instance
                                .collection('users')
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .update(
                                {"groceries_summa": groceriesTransactions});
                          }
                          else if (transactionCategory == 'Leisure') {
                            leisureTransactions =
                                leisureTransactions - transactionAmount;
                            leisureTransactions =
                                leisureTransactions + transferAmountNew;
                            await FirebaseFirestore.instance
                                .collection('users')
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .update({"leisure_summa": leisureTransactions});
                          }
                          else if (transactionCategory == 'Fuel') {
                            fuelTransactions = fuelTransactions - transactionAmount;
                            fuelTransactions =
                                fuelTransactions + transferAmountNew;
                            await FirebaseFirestore.instance
                                .collection('users')
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .update({"fuel_summa": fuelTransactions});
                          }
                          else if (transactionCategory == 'Cosmetics') {
                            cosmeticsTransactions =
                                cosmeticsTransactions - transactionAmount;
                            cosmeticsTransactions =
                                cosmeticsTransactions + transferAmountNew;
                            await FirebaseFirestore.instance
                                .collection('users')
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .update(
                                {"cosmetics_summa": cosmeticsTransactions});
                          } else if (transactionCategory == 'Health') {
                            healthTransactions =
                                healthTransactions - transactionAmount;
                            healthTransactions =
                                healthTransactions + transferAmountNew;
                            await FirebaseFirestore.instance
                                .collection('users')
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .update({"health_summa": healthTransactions});
                          }
                        }
                      } else {
                        if (initialCategory == "Groceries") {
                          groceriesTransactions =
                              groceriesTransactions - transactionAmount;

                          chartData.add(ChartData('Groceries', groceriesTransactions));
                          print(chartData);
                          if (categoryChosen == 'Leisure') {
                            leisureTransactions =
                                leisureTransactions + transferAmountNew;
                            await FirebaseFirestore.instance
                                .collection('users')
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .update({
                              "groceries_summa": groceriesTransactions,
                              "leisure_summa": leisureTransactions,
                            });
                            chartData.add(ChartData('Leisure', leisureTransactions));
                            print(chartData[0]);

                          } else if (categoryChosen == 'Fuel') {
                            fuelTransactions =
                                fuelTransactions + transferAmountNew;
                            await FirebaseFirestore.instance
                                .collection('users')
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .update({
                              "groceries_summa": groceriesTransactions,
                              "fuel_summa": fuelTransactions,
                            });
                            chartData.add(ChartData('Fuel', fuelTransactions));

                          } else if (categoryChosen == 'Cosmetics') {
                            cosmeticsTransactions =
                                cosmeticsTransactions + transferAmountNew;
                            await FirebaseFirestore.instance
                                .collection('users')
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .update({
                              "groceries_summa": groceriesTransactions,
                              "cosmetics_summa": cosmeticsTransactions,
                            });
                            chartData.add(ChartData('Cosmetics', cosmeticsTransactions));

                          } else if (categoryChosen == 'Health') {
                            healthTransactions =
                                healthTransactions + transferAmountNew;
                            await FirebaseFirestore.instance
                                .collection('users')
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .update({
                              "groceries_summa": groceriesTransactions,
                              "health_summa": healthTransactions,
                            });
                            chartData.add(ChartData('Health', healthTransactions));
                          }
                        }
                        else if (initialCategory == 'Leisure') {
                          leisureTransactions =
                              leisureTransactions - transactionAmount;
                          if (categoryChosen == 'Groceries') {
                            groceriesTransactions =
                                groceriesTransactions + transferAmountNew;
                            await FirebaseFirestore.instance
                                .collection('users')
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .update({
                              "groceries_summa": groceriesTransactions,
                              "leisure_summa": leisureTransactions,
                            });
                          } else if (categoryChosen == 'Fuel') {
                            fuelTransactions =
                                fuelTransactions + transferAmountNew;
                            print(fuelTransactions);
                            await FirebaseFirestore.instance
                                .collection('users')
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .update({
                              "leisure_summa": leisureTransactions,
                              "fuel_summa": fuelTransactions,
                            });
                          } else if (categoryChosen == 'Cosmetics') {
                            cosmeticsTransactions =
                                cosmeticsTransactions + transferAmountNew;
                            await FirebaseFirestore.instance
                                .collection('users')
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .update({
                              "leisure_summa": leisureTransactions,
                              "cosmetics_summa": cosmeticsTransactions,
                            });
                          } else if (categoryChosen == 'Health') {
                            healthTransactions =
                                healthTransactions + transferAmountNew;
                            await FirebaseFirestore.instance
                                .collection('users')
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .update({
                              "leisure_summa": leisureTransactions,
                              "health_summa": healthTransactions,
                            });
                          }
                        }
                        else if (initialCategory == "Fuel") {
                          fuelTransactions = fuelTransactions - transactionAmount;
                          if (categoryChosen == 'Groceries') {
                            groceriesTransactions =
                                groceriesTransactions + transferAmountNew;
                            await FirebaseFirestore.instance
                                .collection('users')
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .update({
                              "groceries_summa": groceriesTransactions,
                              "fuel_summa": fuelTransactions,
                            });
                          } else if (categoryChosen == 'Leisure') {
                            leisureTransactions =
                                leisureTransactions + transferAmountNew;
                            await FirebaseFirestore.instance
                                .collection('users')
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .update({
                              "leisure_summa": leisureTransactions,
                              "fuel_summa": fuelTransactions,
                            });
                          } else if (categoryChosen == 'Cosmetics') {
                            cosmeticsTransactions =
                                cosmeticsTransactions + transferAmountNew;
                            await FirebaseFirestore.instance
                                .collection('users')
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .update({
                              "fuel_summa": fuelTransactions,
                              "cosmetics_summa": cosmeticsTransactions,
                            });
                          } else if (categoryChosen == 'Health') {
                            healthTransactions =
                                healthTransactions + transferAmountNew;
                            await FirebaseFirestore.instance
                                .collection('users')
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .update({
                              "fuel_summa": fuelTransactions,
                              "health_summa": healthTransactions,
                            });
                          }
                        }
                        else if (initialCategory == 'Cosmetics') {
                          cosmeticsTransactions =
                              cosmeticsTransactions - transactionAmount;
                          if (categoryChosen == 'Groceries') {
                            groceriesTransactions =
                                groceriesTransactions + transferAmountNew;
                            await FirebaseFirestore.instance
                                .collection('users')
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .update({
                              "groceries_summa": groceriesTransactions,
                              "cosmetics_summa": cosmeticsTransactions,
                            });
                          } else if (categoryChosen == 'Leisure') {
                            leisureTransactions =
                                leisureTransactions + transferAmountNew;
                            await FirebaseFirestore.instance
                                .collection('users')
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .update({
                              "leisure_summa": leisureTransactions,
                              "cosmetics_summa": cosmeticsTransactions,
                            });
                          } else if (categoryChosen == 'Fuel') {
                            fuelTransactions =
                                fuelTransactions + transferAmountNew;
                            await FirebaseFirestore.instance
                                .collection('users')
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .update({
                              "fuel_summa": fuelTransactions,
                              "cosmetics_summa": cosmeticsTransactions,
                            });
                          } else if (categoryChosen == 'Health') {
                            healthTransactions =
                                healthTransactions + transferAmountNew;
                            await FirebaseFirestore.instance
                                .collection('users')
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .update({
                              "cosmetics_summa": cosmeticsTransactions,
                              "health_summa": healthTransactions,
                            });
                          }
                        }
                        else if (initialCategory == "Health") {
                          healthTransactions = healthTransactions - transactionAmount;
                          if (categoryChosen == 'Groceries') {
                            groceriesTransactions =
                                groceriesTransactions + transferAmountNew;
                            await FirebaseFirestore.instance
                                .collection('users')
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .update({
                              "groceries_summa": groceriesTransactions,
                              "health_summa": healthTransactions,
                            });
                          } else if (categoryChosen == 'Leisure') {
                            leisureTransactions =
                                leisureTransactions + transferAmountNew;
                            await FirebaseFirestore.instance
                                .collection('users')
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .update({
                              "leisure_summa": leisureTransactions,
                              "health_summa": healthTransactions,
                            });
                          } else if (categoryChosen == 'Fuel') {
                            fuelTransactions =
                                fuelTransactions + transferAmountNew;
                            await FirebaseFirestore.instance
                                .collection('users')
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .update({
                              "fuel_summa": fuelTransactions,
                              "health_summa": healthTransactions,
                            });
                          } else if (categoryChosen == 'Cosmetics') {
                            cosmeticsTransactions =
                                cosmeticsTransactions + transferAmountNew;
                            await FirebaseFirestore.instance
                                .collection('users')
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .update({
                              "cosmetics_summa": cosmeticsTransactions,
                              "health_summa": healthTransactions,
                            });
                          }
                        }
                      }
                      await FirebaseFirestore.instance
                          .collection('transactions')
                          .doc(stream)
                          .update({"category_name": categoryChosen});
                    }
                    else if (category==true && amount==false){
                      if (initialCategory == "Groceries") {
                          groceriesTransactions =
                              groceriesTransactions - transactionAmount;

                          chartData.add(ChartData('Groceries', groceriesTransactions));
                          print(chartData);
                          if (categoryChosen == 'Leisure') {
                            leisureTransactions =
                                leisureTransactions + transactionAmount;
                            await FirebaseFirestore.instance
                                .collection('users')
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .update({
                              "groceries_summa": groceriesTransactions,
                              "leisure_summa": leisureTransactions,
                            });
                            chartData.add(ChartData('Leisure', leisureTransactions));
                            print(chartData[0]);

                          }
                          else if (categoryChosen == 'Fuel') {
                            fuelTransactions =
                                fuelTransactions + transactionAmount;
                            await FirebaseFirestore.instance
                                .collection('users')
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .update({
                              "groceries_summa": groceriesTransactions,
                              "fuel_summa": fuelTransactions,
                            });
                            chartData.add(ChartData('Fuel', fuelTransactions));

                          }
                          else if (categoryChosen == 'Cosmetics') {
                            cosmeticsTransactions =
                                cosmeticsTransactions + transactionAmount;
                            await FirebaseFirestore.instance
                                .collection('users')
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .update({
                              "groceries_summa": groceriesTransactions,
                              "cosmetics_summa": cosmeticsTransactions,
                            });
                            chartData.add(ChartData('Cosmetics', cosmeticsTransactions));

                          }
                          else if (categoryChosen == 'Health') {
                            healthTransactions =
                                healthTransactions + transactionAmount;
                            await FirebaseFirestore.instance
                                .collection('users')
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .update({
                              "groceries_summa": groceriesTransactions,
                              "health_summa": healthTransactions,
                            });
                            chartData.add(ChartData('Health', healthTransactions));
                          }
                        }
                        else if (initialCategory == 'Leisure') {
                          leisureTransactions =
                              leisureTransactions - transactionAmount;
                          if (categoryChosen == 'Groceries') {
                            groceriesTransactions =
                                groceriesTransactions + transactionAmount;
                            await FirebaseFirestore.instance
                                .collection('users')
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .update({
                              "groceries_summa": groceriesTransactions,
                              "leisure_summa": leisureTransactions,
                            });
                          }
                          else if (categoryChosen == 'Fuel') {
                            fuelTransactions =
                                fuelTransactions + transactionAmount;
                            print(fuelTransactions);
                            await FirebaseFirestore.instance
                                .collection('users')
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .update({
                              "leisure_summa": leisureTransactions,
                              "fuel_summa": fuelTransactions,
                            });
                          }
                          else if (categoryChosen == 'Cosmetics') {
                            cosmeticsTransactions =
                                cosmeticsTransactions + transactionAmount;
                            await FirebaseFirestore.instance
                                .collection('users')
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .update({
                              "leisure_summa": leisureTransactions,
                              "cosmetics_summa": cosmeticsTransactions,
                            });
                          }
                          else if (categoryChosen == 'Health') {
                            healthTransactions =
                                healthTransactions + transactionAmount;
                            await FirebaseFirestore.instance
                                .collection('users')
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .update({
                              "leisure_summa": leisureTransactions,
                              "health_summa": healthTransactions,
                            });
                          }
                        }
                        else if (initialCategory == "Fuel") {
                          fuelTransactions = fuelTransactions - transactionAmount;
                          if (categoryChosen == 'Groceries') {
                            groceriesTransactions =
                                groceriesTransactions + transactionAmount;
                            await FirebaseFirestore.instance
                                .collection('users')
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .update({
                              "groceries_summa": groceriesTransactions,
                              "fuel_summa": fuelTransactions,
                            });
                          }
                          else if (categoryChosen == 'Leisure') {
                            leisureTransactions =
                                leisureTransactions + transactionAmount;
                            await FirebaseFirestore.instance
                                .collection('users')
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .update({
                              "leisure_summa": leisureTransactions,
                              "fuel_summa": fuelTransactions,
                            });
                          }
                          else if (categoryChosen == 'Cosmetics') {
                            cosmeticsTransactions =
                                cosmeticsTransactions + transactionAmount;
                            await FirebaseFirestore.instance
                                .collection('users')
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .update({
                              "fuel_summa": fuelTransactions,
                              "cosmetics_summa": cosmeticsTransactions,
                            });
                          }
                          else if (categoryChosen == 'Health') {
                            healthTransactions =
                                healthTransactions + transactionAmount;
                            await FirebaseFirestore.instance
                                .collection('users')
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .update({
                              "fuel_summa": fuelTransactions,
                              "health_summa": healthTransactions,
                            });
                          }
                        }
                        else if (initialCategory == 'Cosmetics') {
                          cosmeticsTransactions =
                              cosmeticsTransactions - transactionAmount;
                          if (categoryChosen == 'Groceries') {
                            groceriesTransactions =
                                groceriesTransactions + transactionAmount;
                            await FirebaseFirestore.instance
                                .collection('users')
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .update({
                              "groceries_summa": groceriesTransactions,
                              "cosmetics_summa": cosmeticsTransactions,
                            });
                          }
                          else if (categoryChosen == 'Leisure') {
                            leisureTransactions =
                                leisureTransactions + transactionAmount;
                            await FirebaseFirestore.instance
                                .collection('users')
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .update({
                              "leisure_summa": leisureTransactions,
                              "cosmetics_summa": cosmeticsTransactions,
                            });
                          }
                          else if (categoryChosen == 'Fuel') {
                            fuelTransactions =
                                fuelTransactions + transactionAmount;
                            await FirebaseFirestore.instance
                                .collection('users')
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .update({
                              "fuel_summa": fuelTransactions,
                              "cosmetics_summa": cosmeticsTransactions,
                            });
                          }
                          else if (categoryChosen == 'Health') {
                            healthTransactions =
                                healthTransactions + transactionAmount;
                            await FirebaseFirestore.instance
                                .collection('users')
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .update({
                              "cosmetics_summa": cosmeticsTransactions,
                              "health_summa": healthTransactions,
                            });
                          }
                        }
                        else if (initialCategory == "Health") {
                          healthTransactions = healthTransactions - transactionAmount;
                          if (categoryChosen == 'Groceries') {
                            groceriesTransactions =
                                groceriesTransactions + transactionAmount;
                            await FirebaseFirestore.instance
                                .collection('users')
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .update({
                              "groceries_summa": groceriesTransactions,
                              "health_summa": healthTransactions,
                            });
                          }
                          else if (categoryChosen == 'Leisure') {
                            leisureTransactions =
                                leisureTransactions + transactionAmount;
                            await FirebaseFirestore.instance
                                .collection('users')
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .update({
                              "leisure_summa": leisureTransactions,
                              "health_summa": healthTransactions,
                            });
                          }
                          else if (categoryChosen == 'Fuel') {
                            fuelTransactions =
                                fuelTransactions + transactionAmount;
                            await FirebaseFirestore.instance
                                .collection('users')
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .update({
                              "fuel_summa": fuelTransactions,
                              "health_summa": healthTransactions,
                            });
                          }
                          else if (categoryChosen == 'Cosmetics') {
                            cosmeticsTransactions =
                                cosmeticsTransactions + transactionAmount;
                            await FirebaseFirestore.instance
                                .collection('users')
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .update({
                              "cosmetics_summa": cosmeticsTransactions,
                              "health_summa": healthTransactions,
                            });
                          }
                      }
                      await FirebaseFirestore.instance
                          .collection('transactions')
                          .doc(stream)
                          .update({"category_name": categoryChosen});
                    }



                      transactionDate = '';
                    transferAmountNew=0;
                      transactionAmount = 0;
                      transactionCategory = '';
                      transactionId = '';
                      initialCategory = "";
                      categoryChosen='';
                      // initialAmount = 0;
                      initialDate = '';
                      colorButton1 = Colors.white;
                      colorButton2 = Colors.white;
                      iconButton1 = Icon(
                        Icons.check,
                        color: Colors.orangeAccent,
                      );
                      iconButton2 = Icon(
                        Icons.check,
                        color: Colors.orangeAccent,
                      );



                  });
                  Future.delayed(const Duration(milliseconds: 1000), () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage()),
                    );});
                },
                child: const Text(
                  "Save changes",
                  style: TextStyle(color: Colors.orangeAccent, fontSize: 20),
                )),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  CoolDropdown buildCoolDropdownEdit(BuildContext context) {
    return CoolDropdown(
      dropdownPadding: const EdgeInsets.symmetric(horizontal: 20),
      resultPadding: const EdgeInsets.symmetric(horizontal: 20),
      selectedItemPadding: const EdgeInsets.symmetric(horizontal: 20),
      unselectedItemTS:
          const TextStyle(color: Colors.orangeAccent, fontSize: 20),
      dropdownItemPadding: const EdgeInsets.symmetric(horizontal: 20),
      resultHeight: MediaQuery.of(context).size.height * 0.09,
      resultBD: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: Colors.orangeAccent)),
      resultTS: const TextStyle(color: Colors.orangeAccent, fontSize: 20),
      placeholderTS:
          TextStyle(color: Colors.orangeAccent.withOpacity(0.7), fontSize: 20),
      selectedItemTS: const TextStyle(color: Colors.orangeAccent, fontSize: 20),
      selectedItemBD:
          BoxDecoration(color: Colors.orangeAccent.withOpacity(0.2)),
      dropdownBD: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      resultWidth: double.infinity,
      dropdownWidth: MediaQuery.of(context).size.width * 0.8,
      dropdownList: dropdownItemList,
      onChange: (newVal) {
        Future.delayed(const Duration(seconds: 2), () async {
          categoryChosen = newVal!["value"];
          category = true;
        });
      },
      defaultValue: {
        'label': transactionCategory == 'Groceries'
            ? 'Groceries'
            : transactionCategory == "Leisure"
                ? "Leisure"
                : transactionCategory == "Fuel"
                    ? "Fuel"
                    : transactionCategory == "Cosmetics"
                        ? "Cosmetics"
                        : transactionCategory == "Health"
                            ? "Health"
                            : "Category",
        'value': transactionCategory,
        'icon': transactionCategory == 'Groceries'
            ? const Icon(
                Icons.local_grocery_store,
                color: Colors.orangeAccent,
                size: 25,
              )
            : transactionCategory == "Leisure"
                ? const Icon(
                    Icons.event_seat,
                    color: Colors.orangeAccent,
                    size: 25,
                  )
                : transactionCategory == "Fuel"
                    ? const Icon(
                        Icons.car_crash_rounded,
                        color: Colors.orangeAccent,
                        size: 25,
                      )
                    : transactionCategory == "Cosmetics"
                        ? const Icon(
                            Icons.local_mall_rounded,
                            color: Colors.orangeAccent,
                            size: 25,
                          )
                        : transactionCategory == "Health"
                            ? const Icon(
                                Icons.medical_services_rounded,
                                color: Colors.orangeAccent,
                                size: 25,
                              )
                            : const Icon(
                                Icons.add,
                                color: Colors.orangeAccent,
                                size: 25,
                              ),
      },
    );
  }
}
