import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/labels.dart';
import '../screens/history_screen.dart';

class BottomWidget extends StatelessWidget {
  const BottomWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.6,
      ),
      child: Stack(
        children: [

          Container(

            height: MediaQuery.of(context).size.height * 0.4,
            // width: MediaQuery.of(context).size.width * 1,
            color: Colors.white,
            child:
                // ListView(
                //   children: [

                StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('transactions')
                  // .where('Id', isEqualTo: Id_Of_current_application)
                  //     .where('title', isEqualTo: card_title_accepted)
                  //     .where('category', isEqualTo: card_category_accepted)
                  //     .where('comment', isEqualTo: card_comment_accepted)
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                return Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.03,
                  ),
                  child: ListView.builder(
                      itemCount: !streamSnapshot.hasData
                          ? 1
                      : 3,
                          // : streamSnapshot.data?.docs.length,
                      itemBuilder: (ctx, index) {
                        if (streamSnapshot.hasData) {
                          switch (streamSnapshot.connectionState) {
                            case ConnectionState.waiting:
                              return ListView(children: const [
                                SizedBox(
                                  width: 60,
                                  height: 60,
                                  child: CircularProgressIndicator(),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 16),
                                  child: Text('Awaiting data...'),
                                )
                              ]);
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
                                        date: streamSnapshot.data?.docs[index]
                                            ['date'],
                                        price:
                                            '${streamSnapshot.data?.docs[index]["transfer_amount"]} PLN',
                                        icon: Icon(
                                          Icons.local_grocery_store,
                                        )),
                                  ),
                                ],
                              );
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
              },
            ),
            // Padding(
            //   padding: EdgeInsets.only(left: MediaQuery.of(context).size.height*0.00, top: MediaQuery.of(context).size.height*0.03),
            //   child: const Labels(name: "Groceries", date: "21.02.2022", price: "21.99 PLN", icon: Icon(Icons.local_grocery_store,)),
            // ),
            // Padding(
            //   padding: EdgeInsets.only(left: MediaQuery.of(context).size.height*0.00, top: MediaQuery.of(context).size.height*0.03),
            //   child: const Labels(name: "Groceries", date: "21.02.2022", price: "21.99 PLN", icon: Icon(Icons.local_grocery_store,)),
            // ),
            // Padding(
            //   padding: EdgeInsets.only(left: MediaQuery.of(context).size.height*0.00, top: MediaQuery.of(context).size.height*0.03),
            //   child: const Labels(name: "Groceries", date: "21.02.2022", price: "21.99 PLN", icon: Icon(Icons.local_grocery_store,)),
            // )
            //   ],
            // ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02,
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const History()),
                      );
                    },
                    child: Text("History",
                        style: GoogleFonts.raleway(
                          fontSize: 22,
                          color: Colors.black,

                          // fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.left),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
