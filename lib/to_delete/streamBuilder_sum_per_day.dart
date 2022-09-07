import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../app.dart';
import '../screens/add_transaction.dart';
import '../screens/edit_screen.dart';
import '../widgets/button_add_transaction.dart';
import '../widgets/streamBuilder_transactions.dart';
import '../models/labels.dart';

String currentDate = DateFormat('dd, MMMM yyyy').format(DateTime.now()).toString();

double sumCurrentTransactions = 0;

// class StreamBuilderSumPerDay extends StatefulWidget {
//
//   const StreamBuilderSumPerDay({Key? key})
//       : super(key: key);
//
//   @override
//   State<StreamBuilderSumPerDay> createState() =>
//       _StreamBuilderSumPerDayState();
// }
//
// class _StreamBuilderSumPerDayState extends State<StreamBuilderSumPerDay> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1,),
//       child: StreamBuilder(
//         stream: FirebaseFirestore.instance
//             .collection('transactions')
//             .where("date", isEqualTo: currentDate)
//             .where("userID", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
//             .snapshots(),
//         builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
//             return ListView.builder(
//                 itemCount: streamSnapshot.hasData
//                     ? streamSnapshot.data?.docs.length
//                     : 0,
//                 itemBuilder: (ctx, index) {
//                   // if (streamSnapshot.data?.docs[index]["date"] == currentDate){
//                     sumCurrentTransactions = sumCurrentTransactions + streamSnapshot.data?.docs[index]["transfer_amount"];
//                     print("OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO");
//                     print(sumCurrentTransactions);
//
//
//                   // }
//                   return Center(child: Text("${sumCurrentTransactions}"));
//
//                 });
//         },
//       ),
//     );
//   }
// }