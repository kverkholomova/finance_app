import 'dart:io';

import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:intl/intl.dart';
import '../constants.dart';
import '../models/data.dart';
import '../widgets/button_add_transaction.dart';
import 'calendar.dart';
import 'home_screen.dart';

Color iconColor = Colors.orangeAccent;

class AddTransaction extends StatefulWidget {
  const AddTransaction({Key? key}) : super(key: key);

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

String valueChosen = dropdownItemList[3]["value"];

String userInput = '0.00';
String transactionDate =
    DateFormat('dd, MMMM yyyy').format(DateTime.now()).toString();
// String transactionDate = '${DateTime.now().day.toString().length < 2 ? "0${DateTime.now().day}" : DateTime.now().day} / ${DateTime.now().month.toString().length < 2 ? "0${DateTime.now().month}" : DateTime.now().month} / ${DateTime.now().year}';

class _AddTransactionState extends State<AddTransaction> {
  String option = '';
  int index = 0;
  double second = 0;
  double first = 0;
  String number = '';
  double answerDouble = 0;
  int answerInt = 0;
  double answer = 0;
  num third = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Calendar()),
                );
              },
              icon: const Icon(
                Icons.calendar_month,
                color: Colors.orangeAccent,
              ))
        ],
        title: Align(
          alignment: Alignment.topCenter,
          child: Text(
            transactionDate,
            style: headStyle,
          ),
        ),
        leading: IconButton(
          icon: closeIcon,
          onPressed: () {
            userInput = '0.00';
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyHomePage()),
            );
          },
        ),
        elevation: 0,
        backgroundColor: Colors.purple,
      ),
      body: SizedBox(
        height: double.infinity,
        child: Stack(
          children: [
            buildTopWidget(context),
            buildBottomWidget(context),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: const ButtonAddTransaction(),
    );
  }

  Padding buildTopWidget(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.4),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        color: Colors.purple,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.1),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "$userInput PLN",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05),
                child: Align(
                  alignment: Alignment.center,
                  child: CoolDropdown(
                    unselectedItemTS: const TextStyle(
                        color: Colors.orangeAccent, fontSize: 20),
                    dropdownItemPadding:
                        const EdgeInsets.symmetric(horizontal: 20),
                    resultHeight: MediaQuery.of(context).size.height * 0.09,
                    resultBD: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(width: 3.5, color: Colors.orangeAccent)),
                    resultTS: const TextStyle(
                        color: Colors.orangeAccent, fontSize: 20),
                    placeholderTS: TextStyle(
                        color: Colors.orangeAccent.withOpacity(0.7),
                        fontSize: 20),
                    selectedItemTS: const TextStyle(
                        color: Colors.orangeAccent, fontSize: 20),
                    selectedItemBD: BoxDecoration(
                        color: Colors.orangeAccent.withOpacity(0.2)),
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
                      setState(() {
                        valueChosen = newVal["value"];
                      });
                      // valueIcon = newVal["icon"].toString();
                    },
                    defaultValue: dropdownItemList[3],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding buildBottomWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.32,
          bottom: MediaQuery.of(context).size.height * 0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.6,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height * 0.09),
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: buildTextButton("7"),
                        ),
                        Expanded(flex: 1, child: buildTextButton("8")),
                        Expanded(
                          flex: 1,
                          child: buildTextButton("9"),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: buildTextButton("4"),
                        ),
                        Expanded(
                          flex: 1,
                          child: buildTextButton("5"),
                        ),
                        Expanded(
                          flex: 1,
                          child: buildTextButton("6"),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: buildTextButton("1"),
                        ),
                        Expanded(
                          flex: 1,
                          child: buildTextButton("2"),
                        ),
                        Expanded(
                          flex: 1,
                          child: buildTextButton("3"),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: TextButton(
                              child: const Text(
                                ".",
                                style: TextStyle(
                                    fontSize: 45, color: Colors.black),
                              ),
                              onPressed: () {
                                setState(() {
                                  if (userInput == '0.00') {
                                    userInput = '0.';
                                  } else if (userInput.length >= 4 &&
                                      userInput[userInput.length - 3] == ".") {
                                    userInput = userInput.substring(
                                        0, userInput.length - 2);
                                    print(userInput);
                                    // userInput = userInput + valueButton;
                                    print(userInput);
                                  } else {
                                    userInput = userInput.substring(
                                        0, userInput.length - 2);
                                    second = double.parse(userInput.substring(
                                        userInput.length -
                                            (userInput.length - index)));
                                  }
                                });
                              }),
                        ),
                        Expanded(
                          flex: 1,
                          child: buildTextButton('0'),
                        ),
                        Expanded(
                          flex: 1,
                          child: IconButton(
                              icon: const Icon(Icons.backspace),
                              onPressed: () {
                                setState(() {
                                  if (userInput.length > 1) {
                                    if (userInput == "0.00") {
                                    } else if (userInput.length == 5) {
                                      if (userInput[userInput.length - 1] ==
                                              "0" &&
                                          userInput[userInput.length - 2] ==
                                              "0") {
                                        print(
                                            "DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD");

                                        userInput =
                                            "${userInput.substring(0, 1)}.00";
                                      }
                                      else if(userInput[userInput.length-1]!="0"){
                                        userInput = "${userInput.substring(
                                            0, userInput.length - 1)}0";
                                      } else if(userInput[userInput.length-1]=="0"&&userInput[userInput.length-2]!="0"){
                                        userInput = "${userInput.substring(
                                            0, userInput.length - 2)}00";
                                      }

                                    } else if (userInput.length == 4) {
                                        if (userInput[userInput.length - 1] ==
                                                "0" &&
                                            userInput[userInput.length - 2] ==
                                                "0") {
                                          print(
                                              "DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD00000");

                                          userInput = "0.00";
                                        }
                                      }


                                    // if (userInput[userInput.length-1] == '.'){
                                    //   userInput = userInput+'00';
                                    //   userInput =userInput.substring(userInput.length-3, 1);
                                    // }
                                  }

                                  // else if(userInput[userInput.length-1]=='0' && userInput[userInput.length-1]=='0'){
                                  //   userInput = userInput[userInput.length-1].substring(0,userInput.length-1);
                                  // }
                                  else {
                                    userInput = "0.00";
                                  }
                                });
                              }),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextButton buildTextButton(String valueButton) {
    return TextButton(
        child: Text(
          valueButton,
          style: const TextStyle(fontSize: 30, color: Colors.black),
        ),
        onPressed: () {
          setState(() {
            if (userInput.length >= 4) {
              print("pppppppppppppppppppppppppppppppppppppppppppppppp");
              print(userInput.length >= 4 &&
                  userInput[userInput.length - 3] == ".");
            }
            if (userInput == '0.00') {
              userInput = "$valueButton.00";
            } else if (userInput[userInput.length - 1] == '.' ||
                userInput[userInput.length - 2] == '.') {
              userInput = userInput + valueButton;
              // second = double.parse(userInput
              //     .substring(userInput.length - (userInput.length - index)));
            } else {
              userInput = userInput.substring(0, userInput.length - 3);
              userInput = '${userInput}${valueButton}.00';
              // second = double.parse(userInput
              //     .substring(userInput.length - (userInput.length - index)));

            }
          });
        });
  }
}
