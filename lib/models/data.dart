import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_app/widgets/streamBuilder_transactions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../screens/add_transaction.dart';
import '../screens/edit_screen.dart';
import 'labels.dart';

class ChartData {
  ChartData(this.x, this.y);

  String? x;
  final double y;


}

// chartData.add(ChartData("Groceries", groceriesTransactions));
// Widget build(BuildContext context) {
//   return Padding(
//     padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03,),
//     child: StreamBuilder(
//       stream: FirebaseFirestore.instance
//           .collection('transactions')
//           .where('userID', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
//           .snapshots(),
//       builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
//         if (streamSnapshot.data!.docs.isEmpty) {
//           return Center(
//             child: Padding(
//               padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1,),
//               child: Column(
//                 children: const [
//                   Align(
//                     alignment: Alignment.center,
//                     child: Text("There is no data...",
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 24,
//                           color: Colors.black,
//                         )),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(top: 20),
//                   )
//                 ],
//               ),
//             ),
//           );
//         } else if (streamSnapshot.data!.docs.isNotEmpty) {
//           return Padding(
//             padding: EdgeInsets.only(
//               top: MediaQuery.of(context).size.height * 0.03,
//             ),
//             child: ListView.builder(
//
//                 itemCount: streamSnapshot.hasData
//                     ? streamSnapshot.data!.docs.length > 3
//                     ? 3
//                     : streamSnapshot.data?.docs.length
//                     : 0,
//                 itemBuilder: (ctx, index) {
//                   if (streamSnapshot.hasData) {
//                     switch (streamSnapshot.connectionState) {
//                       case ConnectionState.waiting:
//                         return Padding(
//                           padding: EdgeInsets.only(
//                             top: MediaQuery.of(context).size.height * 0.0,
//                           ),
//                           child: Align(
//                             alignment: Alignment.topCenter,
//                             child: Text("Waiting for data",
//                                 style: GoogleFonts.raleway(
//                                   fontSize: 25,
//                                   color: Colors.white,
//                                 )),
//                           ),
//                         );
//                       case ConnectionState.active:
//                         return ChartData("Groceries", streamSnapshot.data?.docs[index][""]);
//                       case ConnectionState.none:
//
//                       case ConnectionState.done:
//                       // TODO: Handle this case.
//                         break;
//                     }
//                   }
//                   return Center(
//                     child: Padding(
//                       padding: const EdgeInsets.only(top: 100),
//                       child: Column(
//                         children: const [
//                           SpinKitChasingDots(
//                             color: Colors.orangeAccent,
//                             size: 50.0,
//                           ),
//                           Align(
//                             alignment: Alignment.center,
//                             child: Text("Waiting...",
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 24,
//                                   color: Colors.black,
//                                 )),
//                           ),
//                           Padding(
//                             padding: EdgeInsets.only(top: 20),
//                           )
//                         ],
//                       ),
//                     ),
//                   );
//                 }),
//           );
//         }
//         return Container();
//       },
//     ),
//   );
// }
List<ChartData> chartData = [];

getDataHistogram() async {
  await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).get().then((value) {

      print(value.get("cosmetics_summa"));
      print(value.get("fuel_summa"));
      print(value.get("groceries_summa"));
      print(value.get("leisure_summa"));
      print(value.get("health_summa"));
      print("KKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK");
      chartData.add(ChartData("Cosmetics", value.get("cosmetics_summa") ));
      chartData.add(ChartData("Fuel",value.get("fuel_summa") ));
      chartData.add(ChartData("Groceries",value.get("groceries_summa") ));
      chartData.add(ChartData("Leisure",value.get("leisure_summa") ));
      chartData.add(ChartData("Health",value.get("health_summa") ));

  });

}

List changeItem = [];

List dropdownItemList = [
  {
    'label': 'Groceries',
    'value': 'Groceries',
    'icon': Icon(
      Icons.local_grocery_store,
      color: iconColor,
    )
  }, // label is required and unique
  {
    'label': 'Leisure',
    'value': 'Leisure',
    'icon': FittedBox(
      fit: BoxFit.scaleDown,
      child: SvgPicture.asset(
        "assets/icons/icon1.svg",
        width: 20,
        height: 20,
// Icons.local_mall_rounded,
        color: Colors.orangeAccent,
// size: 25,
      ),
    )
  },
  {
    'label': 'Fuel',
    'value': 'Fuel',
    'icon': Icon(
      Icons.car_crash_rounded,
      color: iconColor,
    )
  },
  {
    'label': 'Cosmetics',
    'value': 'Cosmetics',
    'icon': FittedBox(
      fit: BoxFit.scaleDown,
      child: SvgPicture.asset(
        "assets/icons/icon2.svg",
        width: 20,
        height: 20,
        // Icons.local_mall_rounded,
        color: Colors.orangeAccent,
        // size: 25,
      ),
    )
  },
  {
    'label': 'Health',
    'value': 'Health',
    'icon': Icon(
      Icons.medical_services_outlined,
      color: iconColor,
    )
  },
];
