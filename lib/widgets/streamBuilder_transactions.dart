import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_app/screens/change_transaction.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/labels.dart';

String transactionDate = '';
double transactionAmount = 0;
String transactionCategory = '';
String? transactionId = '';


class StreamBuilderTransactions extends StatelessWidget {
  final bool? limitedLength;

  StreamBuilderTransactions({Key? key, required this.limitedLength})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('transactions')
          .where('userID', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
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
                physics: limitedLength == true
                    ? const NeverScrollableScrollPhysics()
                    : const AlwaysScrollableScrollPhysics(),
                itemCount: streamSnapshot.hasData
                    ? limitedLength == true
                        ? streamSnapshot.data!.docs.length > 3
                            ? 3
                            : streamSnapshot.data?.docs.length
                        : streamSnapshot.data?.docs.length
                    : 0,
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
                        return Column(
                          children: [
                            Slidable(
                              key: const ValueKey(0),

                              // The start action pane is the one at the left or the top side.
                              // startActionPane: ActionPane(
                              //   // A motion is a widget used to control how the pane animates.
                              //   motion: const ScrollMotion(),
                              //
                              //   // A pane can dismiss the Slidable.
                              //   // dismissible:
                              //   //     DismissiblePane(onDismissed: () {
                              //   //
                              //   //
                              //   //     }),
                              //
                              //   // All actions are defined in the children parameter.
                              //   children: [
                              //     // A SlidableAction can have an icon and/or a label.
                              //
                              //   ],
                              // ),

                              //The end action pane is the one at the right or the bottom side.
                              endActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (BuildContext context) async {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text(
                                                  "Delete transaction"),
                                              content: const Text(
                                                  "Are you sure you want to delete this transaction?"),
                                              actions: <Widget>[
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const Text('Close')),
                                                TextButton(
                                                    onPressed: () async {
                                                      await FirebaseFirestore
                                                          .instance
                                                          .runTransaction(
                                                              (Transaction
                                                                  myTransaction) async {
                                                        myTransaction.delete(
                                                            streamSnapshot
                                                                .data!
                                                                .docs[index]
                                                                .reference);
                                                      });
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const Text('Ok'))
                                              ],
                                            );
                                          });
                                    },
                                    backgroundColor: Colors.redAccent,
                                    foregroundColor: Colors.white,
                                    icon: Icons.delete,
                                    label: 'Delete',
                                  ),
                                  SlidableAction(
                                    onPressed: (BuildContext context) async {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const ChangeTransaction()),
                                      );
                                      transactionDate = streamSnapshot.data?.docs[index]
                                      ['date'];
                                      transactionAmount = streamSnapshot.data?.docs[index]["transfer_amount"];
                                      transactionCategory = streamSnapshot.data?.docs[index]
                                      ['category_name'];
                                      transactionId = streamSnapshot.data?.docs[index].id;
                                      await FirebaseFirestore.instance
                                          .collection('transactions')
                                          .doc(streamSnapshot.data?.docs[index].id)
                                          .update({
                                        "transaction_id": streamSnapshot.data?.docs[index].id,
                                      });


                                      print("RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRr");
                                      print(transactionDate);
                                      print(transactionAmount);
                                      print(transactionCategory);
                                    },
                                    backgroundColor: Colors.orangeAccent,
                                    foregroundColor: Colors.white,
                                    icon: Icons.settings,
                                    padding: const EdgeInsets.all(2),
                                    label: 'Edit',
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.03),
                                child: Labels(
                                  name: streamSnapshot.data?.docs[index]
                                      ['category_name'],
                                  date: streamSnapshot.data?.docs[index]
                                      ['date'],
                                  price:
                                      '${streamSnapshot.data?.docs[index]["transfer_amount"]} PLN',
                                ),
                              ),
                            ),
                          ],
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
    );
  }
}
