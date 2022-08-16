import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_app/screens/home_screen.dart';
import 'package:finance_app/widgets/button_add_transaction.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/labels.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  bool poop = true;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyHomePage()),
        );
        return poop;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "History",
            style: GoogleFonts.raleway(
              fontSize: 25,
              color: Colors.orangeAccent,
            ),
          ),
          backgroundColor: Colors.purple,
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage()),
              );
            },
            icon: const Icon(
              Icons.close,
              color: Colors.orange,
            ),
          ),
        ),
        body: StreamBuilder_transactions(),
      ),
    );
  }
}

class StreamBuilder_transactions extends StatelessWidget {
  const StreamBuilder_transactions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('transactions')
          .where('userID', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
        // return ListView.builder(
        //     itemCount: !streamSnapshot.hasData? 1:streamSnapshot.data?.docs.length,
        //     itemBuilder: (ctx, index) {
        if (streamSnapshot.data!.docs.isEmpty) {
          return Center(
            child: Padding(
              padding: EdgeInsets.only(top: 100),
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
                    ? streamSnapshot.data?.docs.length
                    : 0,
                // : streamSnapshot.data?.docs.length,
                itemBuilder: (ctx, index) {
                  if (streamSnapshot.hasData) {
                    // userId = streamSnapshot.data?.docs[index]['userID'];
                    switch (streamSnapshot.connectionState) {
                      case ConnectionState.waiting:
                        return Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.0,
                            // bottom: MediaQuery.of(context).size.height * 0.01
                          ),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Text("Waiting for data",
                                style: GoogleFonts.raleway(
                                  fontSize: 25,
                                  color: Colors.white,
                                  // fontWeight: FontWeight.bold
                                )
                                // TextStyle(
                                //     color: Colors.white,
                                //     fontWeight: FontWeight.bold,
                                //     fontSize: 25),
                                ),
                          ),
                        );
                      case ConnectionState.active:
                        return Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  // left: MediaQuery.of(context).size.height * 0.01,
                                  //   bottom: MediaQuery.of(context).size.height * 0.02,
                                  top: MediaQuery.of(context).size.height *
                                      0.03),
                              child: Labels(
                                name: streamSnapshot.data?.docs[index]
                                    ['category_name'],
                                date: streamSnapshot.data?.docs[index]['date'],
                                price:
                                    '${streamSnapshot.data?.docs[index]["transfer_amount"]} PLN',
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
                      padding: EdgeInsets.only(top: 100),
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
      //         if (streamSnapshot.hasData){
      //
      //           switch (streamSnapshot.connectionState){
      //             case ConnectionState.waiting:
      //               return  ListView(
      //                   children: const [
      //                     SizedBox(
      //                       width: 60,
      //                       height: 60,
      //                       child: CircularProgressIndicator(),
      //                     ),
      //                     Padding(
      //                       padding: EdgeInsets.only(top: 16),
      //                       child: Text('Awaiting data...'),
      //                     )
      //                   ]
      //               );
      //
      //             case ConnectionState.active:
      //               return Column(
      //                 children: [
      //                   Padding(
      //                     padding: EdgeInsets.only(
      //                             // left: MediaQuery.of(context).size.height * 0.01,
      //                             bottom: MediaQuery.of(context).size.height * 0.02,
      //                             top: MediaQuery.of(context).size.height * 0.02),
      //                     child: Labels(
      //                         name: streamSnapshot.data?.docs[index]['category_name'],
      //                         date: streamSnapshot.data?.docs[index]['date'],
      //                         price: '${streamSnapshot.data?.docs[index]["transfer_amount"]} PLN',
      //
      //                     ),
      //                   ),
      //
      //                 ],
      //               );}}
      //         return Center(
      //           child: Padding(padding: EdgeInsets.only(top: 100),
      //             child: Column(
      //               children: const [
      //                 SpinKitChasingDots(
      //                   color: Colors.orangeAccent,
      //                   size: 50.0,
      //                 ),
      //                 Align(
      //                   alignment: Alignment.center,
      //                   child: Text(
      //                       "Waiting...",
      //                       style: TextStyle(
      //                         fontWeight: FontWeight.bold,fontSize: 24,color: Colors.black,)
      //                   ),
      //                 ),
      //                 Padding(padding: EdgeInsets.only(top: 20),)
      //               ],
      //             ),
      //           ),
      //         );
      //       });
      // },
    );
  }
}
