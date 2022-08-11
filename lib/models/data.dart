import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_app/to_delete/top_widget_add_transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../screens/add_transaction.dart';
import 'labels.dart';

class ChartData{
  ChartData(this.x, this.y);
  var x;
  final double y;
}

// Future<List<ChartData>> fetchQuestions(String userId) async {
//   final questions = <ChartData>[];
//   final doc = await FirebaseFirestore.instance.collection('Questions').doc(userId).get();
//   final questionsTmp = doc.data().questions;
//   questionsTmp.forEach((questionTmp) {
//     questions.add(ChartData.fromMap(questionTmp));
//   });
//   return questions;
// }

List<ChartData> chartData = [
  // // ChartData(FirebaseFirestore.instance.collection("transactions").get(), y),
  // ChartData('Groceries', 15),
  // ChartData('Leisure', 7),
  // ChartData('Fuel', 12),
  // ChartData('Cosmetics', 10),
  // ChartData('Health', 5)
];
// var name_firebase = FirebaseFirestore.instance.collection("transactions").get();
//
// StreamBuilder<QuerySnapshot<Map<String, dynamic>>> buildStreamBuilder() {
//   return StreamBuilder(
//     stream: FirebaseFirestore.instance
//         .collection('transactions')
//     // .where('Id', isEqualTo: Id_Of_current_application)
//     //     .where('title', isEqualTo: card_title_accepted)
//     //     .where('category', isEqualTo: card_category_accepted)
//     //     .where('comment', isEqualTo: card_comment_accepted)
//         .snapshots(),
//     builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
//       return Padding(
//         padding: EdgeInsets.only(
//           top: MediaQuery.of(context).size.height * 0.03,
//         ),
//         child: ListView.builder(
//             itemCount: !streamSnapshot.hasData
//                 ? 1
//                 : 3,
//             // : streamSnapshot.data?.docs.length,
//             itemBuilder: (ctx, index) {
//               if (streamSnapshot.hasData) {
//                 switch (streamSnapshot.connectionState) {
//                   case ConnectionState.waiting:
//                     return ListView(children: const [
//                       SizedBox(
//                         width: 60,
//                         height: 60,
//                         child: CircularProgressIndicator(),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(top: 16),
//                         child: Text('Awaiting data...'),
//                       )
//                     ]);
//                   case ConnectionState.active:
//                     return chartData.add(ChartData(streamSnapshot.data?.docs[index]['category_name'], streamSnapshot.data?.docs[index]["transfer_amount"]));
//                     //   Column(
//                     //   children: [
//                     //     Padding(
//                     //       padding: EdgeInsets.only(
//                     //         // left: MediaQuery.of(context).size.height * 0.01,
//                     //         //   bottom: MediaQuery.of(context).size.height * 0.02,
//                     //           top: MediaQuery.of(context).size.height *
//                     //               0.03),
//                     //       child:
//                     //       Labels(
//                     //         name: streamSnapshot.data?.docs[index]
//                     //         ['category_name'],
//                     //         date: streamSnapshot.data?.docs[index]
//                     //         ['date'],
//                     //         price:
//                     //         '${streamSnapshot.data?.docs[index]["transfer_amount"]} PLN',
//                     //       ),
//                     //     ),
//                     //   ],
//                     // );
//                 }
//               }
//               return Center(
//                 child: Padding(
//                   padding: EdgeInsets.only(top: 100),
//                   child: Column(
//                     children: const [
//                       SpinKitChasingDots(
//                         color: Colors.orangeAccent,
//                         size: 50.0,
//                       ),
//                       Align(
//                         alignment: Alignment.center,
//                         child: Text("Waiting...",
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 24,
//                               color: Colors.black,
//                             )),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(top: 20),
//                       )
//                     ],
//                   ),
//                 ),
//               );
//             }),
//       );
//     },
//   );
// }

//  List<ChartData> chartData = [
//    // ChartData(FirebaseFirestore.instance.collection("transactions").get(), y),
//   ChartData('Groceries', 15),
//   ChartData('Leisure', 7),
//   ChartData('Fuel', 12),
//   ChartData('Cosmetics', 10),
//   ChartData('Health', 5)
// ];

// class DropDownData{
//   DropDownData(this.icon, this.name);
//   final Icon icon;
//   final String name;
// }
//
// List<DropDownData> data = [
//   DropDownData(Icon(Icons.local_grocery_store), 'Groceries'),
//   DropDownData(Icon(Icons.event_seat), 'Leisure'),
//   DropDownData(Icon(Icons.car_crash_rounded), 'Fuel'),
//   DropDownData(Icon(Icons.network_wifi_rounded), 'Cosmetics'),
//   DropDownData(Icon(Icons.medical_services_outlined), 'Health'),
// ];

// String label_name = '';

List dropdownItemList = [
  {'label': 'Groceries', 'value': 'Groceries', 'icon': Icon(Icons.local_grocery_store, color: iconColor,)}, // label is required and unique
  {'label': 'Leisure', 'value': 'Leisure', 'icon': Icon(Icons.event_seat, color: iconColor,)},
  {'label': 'Fuel', 'value': 'Fuel', 'icon': Icon(Icons.car_crash_rounded, color: iconColor,)},
  {'label': 'Cosmetics', 'value': 'Cosmetics', 'icon': Icon(Icons.network_wifi_rounded, color: iconColor,)},
  {'label': 'Health', 'value': 'Health', 'icon': Icon(Icons.medical_services_outlined, color: iconColor,)},
];

// List<Labels> labels =[
//   Labels(name: label_name, date: date, price: price, icon: icon)
// ];