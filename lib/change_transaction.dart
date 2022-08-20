import 'package:advance_text_field/advance_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:finance_app/calendar.dart';
import 'package:finance_app/calendar_edit.dart';
import 'package:finance_app/screens/add_transaction.dart';
import 'package:finance_app/screens/home_screen.dart';
import 'package:finance_app/widgets/streamBuilder_transactions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';
import 'models/data.dart';

String dateTime = '';

class ChangeTransaction extends StatefulWidget {
  const ChangeTransaction({Key? key}) : super(key: key);

  @override
  State<ChangeTransaction> createState() => _ChangeTransactionState();
}

double transferAmountNew = 0;
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
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Stack(
                            children: [
                              SizedBox(
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
                                  text: "${streamSnapshot.data?.docs[index]["transfer_amount"]}",
                                  textStyle: const TextStyle(
                                    fontSize: 19,
                                  ),

                                  backgroundColor: Colors.orangeAccent,
                                  onEditTap: () {},
                                  onSaveTap: (text) async {
                                    print('value is: $text');
                                      await FirebaseFirestore.instance
                                          .collection('transactions')
                                          .doc(streamSnapshot.data?.docs[index].id).update(
                                          {
                                            "transfer_amount": double.parse(text),
                                          });
                                  },
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

                              Padding(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height * 0.1),
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
                                  text: dateTime == ''? "${streamSnapshot.data?.docs[index]['date']}": dateTime,
                                  textStyle: const TextStyle(
                                    fontSize: 19,
                                  ),

                                  backgroundColor: Colors.orangeAccent,
                                  onEditTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const CalendarEdit()));
                                  },
                                  onSaveTap: (text) async {

                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height * 0.2),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: CoolDropdown(
                                    dropdownPadding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                    resultPadding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                    selectedItemPadding:
                                    const EdgeInsets.symmetric(horizontal: 20),
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
                                      setState(() async {
                                        valueChosen = newVal["value"];
                                        await FirebaseFirestore.instance
                                            .collection('transactions')
                                            .doc(streamSnapshot.data?.docs[index].id).update(
                                            {
                                              "date": dateTime == ''? "${streamSnapshot.data?.docs[index]['date']}": dateTime,
                                              "category_name": valueChosen
                                            });

                                      });
                                      // valueIcon = newVal["icon"].toString();
                                    },
                                    defaultValue: changeItem[0],
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
}
