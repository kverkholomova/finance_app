import 'package:advance_text_field/advance_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:finance_app/calendar.dart';
import 'package:finance_app/calendar_edit.dart';
import 'package:finance_app/screens/add_transaction.dart';
import 'package:finance_app/screens/home_screen.dart';
import 'package:finance_app/widgets/button_add_transaction.dart';
import 'package:finance_app/widgets/streamBuilder_transactions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';
import 'models/data.dart';

String dateTime = '';
// String? categoryChosen;
String categoryChosen = dropdownItemList[3]["value"];
bool amount = false;
bool dateTr = false;
bool category = false;

class ChangeTransaction extends StatefulWidget {
  const ChangeTransaction({Key? key}) : super(key: key);

  @override
  State<ChangeTransaction> createState() => _ChangeTransactionState();
}

double transferAmountNew = 0;
String? initialCategory;
double initialAmount = 0;
String? initialDate;

class _ChangeTransactionState extends State<ChangeTransaction> {
  @override
  Widget build(BuildContext context) {
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyHomePage()),
            );
          },
        ),
        elevation: 0,
        backgroundColor: Colors.purple,
      ),
      body: Stack(
        children: [
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('transactions')
                .where('transaction_id', isEqualTo: transactionId)
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
              if (streamSnapshot.data!.docs.isEmpty) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Column(
                      children: const [
                        Align(
                          alignment: Alignment.center,
                          child: Text("There is no data...",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Colors.black,
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                        )
                      ],
                    ),
                  ),
                );
              } else if (streamSnapshot.data!.docs.isNotEmpty) {
                return Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.03,
                  ),
                  child: ListView.builder(
                      itemCount: streamSnapshot.hasData
                          ? streamSnapshot.data!.docs.length > 3
                              ? 3
                              : streamSnapshot.data?.docs.length
                          : streamSnapshot.data?.docs.length,
                      itemBuilder: (ctx, index) {
                        transactionCategory =
                            "${streamSnapshot.data?.docs[index]["category_name"]}";
                        initialCategory =
                            "${streamSnapshot.data?.docs[index]["category_name"]}";
                        initialAmount =
                            streamSnapshot.data?.docs[index]["transfer_amount"];
                        initialDate = streamSnapshot.data?.docs[index]["date"];
                        if (streamSnapshot.hasData) {
                          switch (streamSnapshot.connectionState) {
                            case ConnectionState.waiting:
                              return Padding(
                                padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height * 0.0,
                                ),
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Text("Waiting for data",
                                      style: GoogleFonts.raleway(
                                        fontSize: 25,
                                        color: Colors.white,
                                      )),
                                ),
                              );
                            case ConnectionState.active:
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Stack(
                                  children: [
                                    //     Padding(
                                    // padding: EdgeInsets.only(
                                    // top: MediaQuery.of(context).size.height * 0.02),
                                    //     child: Text("Amount of your transfer"),
                                    //     ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.03),
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: AdvanceTextField(
                                          height: 55,
                                          type: AdvanceTextFieldType.EDIT,
                                          editLabel: const Icon(
                                            Icons.edit,
                                            color: Colors.white,
                                          ),
                                          saveLabel: const Icon(
                                            Icons.check,
                                            color: Colors.white,
                                          ),
                                          text:
                                              "${streamSnapshot.data?.docs[index]["transfer_amount"]}",
                                          textStyle: const TextStyle(
                                            fontSize: 19,
                                          ),
                                          backgroundColor: Colors.orangeAccent,
                                          onEditTap: () {},
                                          onSaveTap: (text) async {
                                            print('value is: $text');
                                            transferAmountNew =
                                                double.parse(text);
                                            amount = true;
                                          },
                                        ),
                                      ),
                                    ),
                                    // Padding(
                                    //   padding: EdgeInsets.only(
                                    //       top: MediaQuery.of(context).size.height *
                                    //           0.03),
                                    //   child: Text(
                                    //       "${streamSnapshot.data?.docs[index]
                                    //                 ["transfer_amount"]
                                    //           }")
                                    // ),

                                    // Padding(
                                    //   padding: EdgeInsets.only(
                                    //       top: MediaQuery.of(context).size.height * 0.18),
                                    //   child: Text("Date of your transfer"),
                                    // ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.14),
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: AdvanceTextField(
                                          height: 55,
                                          type: AdvanceTextFieldType.EDIT,
                                          editLabel: const Icon(
                                            Icons.edit,
                                            color: Colors.white,
                                          ),
                                          saveLabel: const Icon(
                                            Icons.check,
                                            color: Colors.white,
                                          ),
                                          text: dateTime == ''
                                              ? "${streamSnapshot.data?.docs[index]['date']}"
                                              : dateTime,
                                          textStyle: const TextStyle(
                                            fontSize: 19,
                                          ),
                                          backgroundColor: Colors.orangeAccent,
                                          onEditTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const CalendarEdit()));
                                          },
                                          onSaveTap: (text) async {},
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.25),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: buildCoolDropdownEdit(context),
                                      ),
                                    ),

                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.7,
                                          bottom: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.05),
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: SizedBox(
                                          height: 50,
                                          width: double.infinity,
                                          child: MaterialButton(
                                              color: Colors.white,
                                              elevation: 0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                side: const BorderSide(
                                                    color: Colors.orangeAccent,
                                                    width: 2),
                                              ),
                                              onPressed: () {
                                                Future.delayed(
                                                    const Duration(
                                                        milliseconds: 500),
                                                    () async {
                                                  print(
                                                      "PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP");
                                                  print(initialCategory);
                                                  print(initialAmount);
                                                  print(transferAmountNew);
                                                  // if (initialCategory ==
                                                  //     categoryChosen) {
                                                    if (initialAmount ==
                                                        transferAmountNew) {
                                                    } else {
                                                      print(
                                                          "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
                                                      print(sumTransactions);
                                                      sumTransactions =
                                                          sumTransactions -
                                                              initialAmount;
                                                      print(sumTransactions);
                                                      sumTransactions =
                                                          sumTransactions +
                                                              transferAmountNew;
                                                      print(sumTransactions);
                                                      await FirebaseFirestore
                                                          .instance
                                                          .collection('users')
                                                          .doc(FirebaseAuth
                                                              .instance
                                                              .currentUser!
                                                              .uid)
                                                          .update({
                                                        "summa": sumTransactions
                                                      });
                                                    // }
                                                  }
                                                });
                                                Future.delayed(
                                                    const Duration(
                                                        milliseconds: 500),
                                                        () async {
                                                      print(
                                                          "PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP");
                                                      print(initialCategory);
                                                      print(initialAmount);
                                                      print(transferAmountNew);
                                                      if (initialCategory ==
                                                          categoryChosen) {
                                                      if (initialAmount ==
                                                          transferAmountNew) {
                                                      } else {
                                                        if(transactionCategory == 'Groceries') {
                                                          groceriesTransactions = groceriesTransactions - initialAmount;
                                                          groceriesTransactions = groceriesTransactions + transferAmountNew;
                                                          await FirebaseFirestore
                                                              .instance
                                                              .collection('users')
                                                              .doc(FirebaseAuth
                                                              .instance
                                                              .currentUser!
                                                              .uid)
                                                              .update({
                                                            "groceries_summa": groceriesTransactions
                                                          });
                                                        }

                                                        // transactionCategory == "Leisure"? "Leisure":
                                                        // transactionCategory == "Fuel"? "Fuel":
                                                        // transactionCategory == "Cosmetics"? "Cosmetics" :
                                                        // transactionCategory == "Health"? "Health":
                                                        // "Category",
                                                        await FirebaseFirestore
                                                            .instance
                                                            .collection('users')
                                                            .doc(FirebaseAuth
                                                            .instance
                                                            .currentUser!
                                                            .uid)
                                                            .update({
                                                          "summa": sumTransactions
                                                        });
                                                        }
                                                      }
                                                    });
                                                Future.delayed(
                                                    const Duration(
                                                        milliseconds: 500),
                                                    () async {
                                                  if (amount == true) {
                                                    await FirebaseFirestore
                                                        .instance
                                                        .collection(
                                                            'transactions')
                                                        .doc(streamSnapshot.data
                                                            ?.docs[index].id)
                                                        .update({
                                                      "transfer_amount":
                                                          transferAmountNew,
                                                    });
                                                  }
                                                  if (dateTr == true) {
                                                    await FirebaseFirestore
                                                        .instance
                                                        .collection(
                                                            'transactions')
                                                        .doc(streamSnapshot.data
                                                            ?.docs[index].id)
                                                        .update({
                                                      "date": dateTime == ''
                                                          ? "${streamSnapshot.data?.docs[index]['date']}"
                                                          : dateTime,
                                                    });
                                                  }
                                                  if (category == true) {
                                                    await FirebaseFirestore
                                                        .instance
                                                        .collection(
                                                            'transactions')
                                                        .doc(streamSnapshot.data
                                                            ?.docs[index].id)
                                                        .update({
                                                      "category_name":
                                                          categoryChosen
                                                    });
                                                  }

                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            MyHomePage()),
                                                  );
                                                });
                                                // await FirebaseFirestore.instance
                                                //     .collection('transactions')
                                                //     .doc(streamSnapshot
                                                //     .data?.docs[index].id)
                                                //     .update({
                                                //   "transfer_amount": transferAmountNew,
                                                //   "date": dateTime == ''
                                                //       ? "${streamSnapshot.data?.docs[index]['date']}"
                                                //       : dateTime,
                                                //   "category_name": categoryChosen
                                                // });
                                              },
                                              child: const Text(
                                                "Save changes",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16),
                                              )),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            case ConnectionState.none:

                            case ConnectionState.done:
                              // TODO: Handle this case.
                              break;
                          }
                        }
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 100),
                            child: Column(
                              children: const [
                                SpinKitChasingDots(
                                  color: Colors.orangeAccent,
                                  size: 50.0,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text("Waiting...",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                        color: Colors.black,
                                      )),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 20),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                );
              }
              return Container();
            },
          ),
        ],
      ),
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
          borderRadius: BorderRadius.circular(30),
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
          // setState(() {
          // valueChosen = newVal["value"];
          print("ghbrhgbhbhbAAAAAALOOKOOKOK");
          print(newVal["value"]);

          categoryChosen = newVal!["value"];
          category = true;

          // });
          // categoryChosen = newVal!["value"];
        });
        // valueIcon = newVal["icon"].toString();
      },
      defaultValue: changeItem[0],
    );
  }
}
