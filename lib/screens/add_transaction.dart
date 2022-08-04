import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/data.dart';
import '../to_delete/bottom_widget_add_transaction.dart';
import '../widgets/button_add_transaction.dart';
import '../to_delete/top_widget_add_transaction.dart';
import 'home_screen.dart';

Color iconColor = Colors.orangeAccent;
class AddTransaction extends StatefulWidget {
  const AddTransaction({Key? key}) : super(key: key);

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}


class _AddTransactionState extends State<AddTransaction> {

  String userInput = '0';
  String option = '';
  int index = 0;
  double second = 0;
  double first = 0;
  String number = '';
  double answerDouble = 0;
  int answerInt=0;
  double answer = 0;
  num third =0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.calendar_month,
                color: Colors.orangeAccent,
              ))
        ],
        title: Align(
          alignment: Alignment.topCenter,
          child: Text(
            "0${DateTime.now().day}.0${DateTime.now().month}.${DateTime.now().year}",
            style: GoogleFonts.raleway(
              fontSize: 25,
              color: Colors.orangeAccent,
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.orangeAccent,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyHomePage()),
            );
          },
        ),
        elevation: 0,
        backgroundColor: Colors.purple,
      ),
      body: Stack(
        children: [
          buildTopWidget(context),
          buildBottomWidget(context),
          ButtonAddTransaction(),
        ],
      ),
    );
  }

  Padding buildTopWidget(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.5),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.4,
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
              // Padding(
              //   padding: EdgeInsets.only(
              //       top: MediaQuery.of(context).size.height * 0.05),
              //   child: Container(
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(10),
              //         color: Colors.purple,
              //         border: Border.all(color: Colors.orangeAccent, width: 3)),
              //     child: DropdownButton(
              //       // value: dropdownValue,
              //       items: data.map((DropDownData items) {
              //         return DropdownMenuItem(
              //           value: items,
              //           child: Padding(
              //             padding: const EdgeInsets.all(8.0),
              //             child: Row(
              //               children: [
              //                 Icon(items.icon.icon),
              //                 Text(items.name),
              //               ],
              //             ),
              //           ),
              //         );
              //       }).toList(),
              //       onChanged: (value) {
              //         setState(() {
              //           value;
              //         });
              //       },
              //     ),
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05),
                child: Align(
                  alignment: Alignment.center,
                  child: CoolDropdown(

                    unselectedItemTS: TextStyle(color: Colors.orangeAccent, fontSize: 20),
                    dropdownItemPadding: const EdgeInsets.symmetric(horizontal: 20),
                    resultHeight: MediaQuery.of(context).size.height * 0.09,
                    resultBD: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(10),
                        border:
                        Border.all(width: 3.5, color: Colors.orangeAccent)),
                    resultTS:
                    const TextStyle(color: Colors.orangeAccent, fontSize: 20),
                    placeholderTS: TextStyle(
                        color: Colors.orangeAccent.withOpacity(0.7),
                        fontSize: 20),
                    selectedItemTS:
                    const TextStyle(color: Colors.orangeAccent, fontSize: 20),
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
                    onChange: (_) {
                      // label_name = dropdownItemList.toString();
                      // iconColor = Colors.orangeAccent;
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
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.35),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.55,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.07),
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
                        Expanded(
                            flex: 1,
                            child: buildTextButton("8")
                        ),
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
                                    fontSize: 45,
                                    color: Colors.black),
                              ),
                              onPressed: () {
                                setState(() {
                                  if (userInput == '0') {
                                    userInput = '0.';
                                  } else {
                                    userInput = userInput + '.';
                                    second = double.parse(userInput
                                        .substring(userInput.length -
                                        (userInput.length -
                                            index)));

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
                              icon: Icon(Icons.backspace),
                              onPressed: () {

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
          style: const TextStyle(
              fontSize: 30,
              color: Colors.black),
        ),
        onPressed: () {
          setState(() {
            if (userInput == '0') {
              userInput = valueButton;
            }
            else {
              userInput = userInput + valueButton;
              second = double.parse(userInput
                  .substring(userInput.length -
                  (userInput.length -
                      index)));

            }
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => const AddTransaction()),
            // );
            // Navigator.pushNamed(context, '/TopWidgetTransaction',
            // arguments: {"input": userInput}
            // );
          });
        });
  }

}
