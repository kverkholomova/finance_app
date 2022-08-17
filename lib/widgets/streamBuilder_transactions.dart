import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/labels.dart';

class StreamBuilderTransactions extends StatelessWidget {
  final bool? limitedLength;
  const StreamBuilderTransactions({
    Key? key, required this.limitedLength
  }) : super(key: key);

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
                                )
                            ),
                          ),
                        );
                      case ConnectionState.active:
                        return Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(

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
