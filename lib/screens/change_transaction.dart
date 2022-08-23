// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cool_dropdown/cool_dropdown.dart';
// import 'package:finance_app/screens/home_screen.dart';
// import 'package:finance_app/widgets/button_add_transaction.dart';
// import 'package:finance_app/widgets/streamBuilder_transactions.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '../constants.dart';
// import '../models/data.dart';
// import '../widgets/edit_amount_text_field.dart';
// import '../widgets/edit_date_of_transaction_text_field.dart';
//
// String? categoryDefault;
// // String dateTime = '';
// String? categoryChosen;
// // String categoryChosen = dropdownItemList[3]["value"];
// bool amount = false;
// // bool dateTr = false;
// bool category = false;
// double transferAmountNew = 0;
// String? initialCategory;
// double initialAmount = 0;
// String? initialDate;
// class ChangeTransaction extends StatefulWidget {
//   const ChangeTransaction({Key? key}) : super(key: key);
//
//   @override
//   State<ChangeTransaction> createState() => _ChangeTransactionState();
// }
// class _ChangeTransactionState extends State<ChangeTransaction> {
//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Edit transaction",
//           style: headStyle,
//           textAlign: TextAlign.left,
//         ),
//         leading: IconButton(
//           icon: closeIcon,
//           onPressed: () {
//             transactionCategory ="";
//             initialCategory ="";
//             initialAmount = 0;
//             initialDate = '';
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => MyHomePage()),
//             );
//           },
//         ),
//         elevation: 0,
//         backgroundColor: Colors.purple,
//       ),
//       body: Container(
//         height: height,
//         child: Stack(
//           children: [
//             StreamBuilder(
//               stream: FirebaseFirestore.instance
//                   .collection('transactions')
//                   .where('transaction_id', isEqualTo: transactionId)
//                   .snapshots(),
//               builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
//                 if (streamSnapshot.data!.docs.isEmpty) {
//                   return Center(
//                     child: Padding(
//                       padding: const EdgeInsets.only(top: 100),
//                       child: Column(
//                         children: const [
//                           Align(
//                             alignment: Alignment.center,
//                             child: Text("There is no data...",
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
//                 } else if (streamSnapshot.data!.docs.isNotEmpty) {
//                   return Padding(
//                     padding: EdgeInsets.only(
//                       top: MediaQuery.of(context).size.height * 0.03,
//                     ),
//                     child: ListView.builder(
//                       physics: const NeverScrollableScrollPhysics(),
//                       shrinkWrap: true,
//                         itemCount: streamSnapshot.hasData
//                             ? streamSnapshot.data?.docs.length
//                             : 0,
//                         itemBuilder: (ctx, index) {
//                           transactionCategory =
//                               "${streamSnapshot.data?.docs[index]["category_name"]}";
//                           initialCategory =
//                               "${streamSnapshot.data?.docs[index]["category_name"]}";
//
//                           initialAmount =
//                               streamSnapshot.data?.docs[index]["transfer_amount"];
//                           initialDate = streamSnapshot.data?.docs[index]["date"];
//                           if (streamSnapshot.hasData) {
//                             switch (streamSnapshot.connectionState) {
//                               case ConnectionState.waiting:
//                                 return Padding(
//                                   padding: EdgeInsets.only(
//                                     top: MediaQuery.of(context).size.height * 0.0,
//                                   ),
//                                   child: Align(
//                                     alignment: Alignment.topCenter,
//                                     child: Text("Waiting for data",
//                                         style: GoogleFonts.raleway(
//                                           fontSize: 25,
//                                           color: Colors.white,
//                                         )),
//                                   ),
//                                 );
//                               case ConnectionState.active:
//                                 return Padding(
//                                   padding:
//                                       const EdgeInsets.symmetric(horizontal: 20),
//                                   child: Column(
//                                     // crossAxisAlignment: CrossAxisAlignment.end,
//                                     // mainAxisSize: MainAxisSize.max,
//                                     children: [
//                                       Stack(
//                                         children: [
//
//                                           Padding(
//                                             padding: const EdgeInsets.only(top: 300),
//                                             child: TextFormField(
//                                               decoration: textInputDecoration.copyWith(hintText: "${streamSnapshot.data?.docs[index]["transfer_amount"]}"),
//                                               validator: (val) =>
//                                               val!.isEmpty ? 'Enter an email' : null,
//                                               onChanged: (val) {
//                                                 setState(() {
//
//                                                 });
//                                               },
//                                             ),
//                                           ),
//                                           AdvanceTextFieldEditTransaction(textToChange: "${streamSnapshot.data?.docs[index]["transfer_amount"]}",),
//
//                                           Padding(
//                                             padding: EdgeInsets.only(
//                                                 top: MediaQuery.of(context)
//                                                         .size
//                                                         .height *
//                                                     0.14),
//                                             child: SizedBox(
//                                               width: double.infinity,
//                                               child: AdvanceTextFieldChangeDate(dateToChange: "${streamSnapshot.data?.docs[index]['date']}",),
//                                             ),
//                                           ),
//                                           Padding(
//                                             padding: EdgeInsets.only(
//                                                 top: MediaQuery.of(context)
//                                                         .size
//                                                         .height *
//                                                     0.25),
//                                             child: Align(
//                                               alignment: Alignment.center,
//                                               child: buildCoolDropdownEdit(context),
//                                             ),
//                                           ),
//
//                                         ],
//                                       ),
//
//                                       // Spacer(),
//                                       Padding(
//                                         padding: EdgeInsets.only(
//                                             top: MediaQuery.of(context)
//                                                 .size
//                                                 .height *
//                                                 0.2),                                        child: Align(
//                                           alignment: const Alignment(0,0.95),
//                                           child: SizedBox(
//                                             height: 50,
//                                             width: double.infinity,
//                                             child: MaterialButton(
//                                                 color: Colors.white,
//                                                 elevation: 0,
//                                                 shape: RoundedRectangleBorder(
//                                                   borderRadius:
//                                                   BorderRadius.circular(10),
//                                                   side: const BorderSide(
//                                                       color: Colors.orangeAccent,
//                                                       width: 2),
//                                                 ),
//                                                 onPressed: () async {
//                                                   await changeMainSum();
//                                                   await changeAllSums();
//
//                                                   await changeTransaction(streamSnapshot, index, context);
//                                                 },
//                                                 child: const Text(
//                                                   "Save changes",
//                                                   style: TextStyle(
//                                                       color: Colors.orangeAccent,
//                                                       fontSize: 20),
//                                                 )),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 );
//                               case ConnectionState.none:
//
//                               case ConnectionState.done:
//                                 // TODO: Handle this case.
//                                 break;
//                             }
//                           }
//                           return Center(
//                             child: Padding(
//                               padding: const EdgeInsets.only(top: 100),
//                               child: Column(
//                                 children: const [
//                                   SpinKitChasingDots(
//                                     color: Colors.orangeAccent,
//                                     size: 50.0,
//                                   ),
//                                   Align(
//                                     alignment: Alignment.center,
//                                     child: Text("Waiting...",
//                                         style: TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 24,
//                                           color: Colors.black,
//                                         )),
//                                   ),
//                                   Padding(
//                                     padding: EdgeInsets.only(top: 20),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           );
//                         }),
//                   );
//                 }
//                 return Container();
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   changeTransaction(AsyncSnapshot<QuerySnapshot<Object?>> streamSnapshot, int index, BuildContext context) async {
//     Future.delayed(
//                                                   const Duration(
//                                                       milliseconds: 300),
//                                                   () async {
//                                                 if (amount == true) {
//                                                   await FirebaseFirestore
//                                                       .instance
//                                                       .collection(
//                                                           'transactions')
//                                                       .doc(streamSnapshot.data
//                                                           ?.docs[index].id)
//                                                       .update({
//                                                     "transfer_amount":
//                                                         transferAmountNew,
//                                                   });
//                                                 }
//                                                 if (dateTr == true) {
//                                                   await FirebaseFirestore
//                                                       .instance
//                                                       .collection(
//                                                           'transactions')
//                                                       .doc(streamSnapshot.data
//                                                           ?.docs[index].id)
//                                                       .update({
//                                                     "date": dateTime == ''
//                                                         ? "${streamSnapshot.data?.docs[index]['date']}"
//                                                         : dateTime,
//                                                   });
//                                                 }
//                                                 if (category == true) {
//                                                   await FirebaseFirestore
//                                                       .instance
//                                                       .collection(
//                                                           'transactions')
//                                                       .doc(streamSnapshot.data
//                                                           ?.docs[index].id)
//                                                       .update({
//                                                     "category_name":
//                                                         categoryChosen
//                                                   });
//                                                 }
//
//                                                 Navigator.push(
//                                                   context,
//                                                   MaterialPageRoute(
//                                                       builder: (context) =>
//                                                           MyHomePage()),
//                                                 );
//                                               });
//   }
//
//   changeMainSum() async {
//     Future.delayed(
//                                                   const Duration(
//                                                       milliseconds: 500),
//                                                   () async {
//                                                 if (initialAmount ==
//                                                     transferAmountNew) {
//                                                 } else {
//                                                   sumTransactions =
//                                                       sumTransactions -
//                                                           initialAmount;
//                                                   sumTransactions =
//                                                       sumTransactions +
//                                                           transferAmountNew;
//                                                   await FirebaseFirestore
//                                                       .instance
//                                                       .collection('users')
//                                                       .doc(FirebaseAuth
//                                                           .instance
//                                                           .currentUser!
//                                                           .uid)
//                                                       .update({
//                                                     "summa": sumTransactions
//                                                   });
//                                                   // }
//                                                 }
//                                               });
//   }
//
//   Future<void> changeAllSums() async {
//     Future.delayed(
//         const Duration(
//             milliseconds: 200),
//         () async {
//       categoryChosen ??
//           initialCategory!;
//       if (initialCategory ==
//           categoryChosen) {
//         if (initialAmount ==
//             transferAmountNew) {
//         } else {
//           if (transactionCategory ==
//               'Groceries') {
//             groceriesTransactions =
//                 groceriesTransactions -
//                     initialAmount;
//             groceriesTransactions =
//                 groceriesTransactions +
//                     transferAmountNew;
//             await FirebaseFirestore
//                 .instance
//                 .collection('users')
//                 .doc(FirebaseAuth
//                     .instance
//                     .currentUser!
//                     .uid)
//                 .update({
//               "groceries_summa":
//                   groceriesTransactions
//             });
//           } else if (transactionCategory ==
//               'Leisure') {
//             leisureTransactions =
//                 leisureTransactions -
//                     initialAmount;
//             leisureTransactions =
//                 leisureTransactions +
//                     transferAmountNew;
//             await FirebaseFirestore
//                 .instance
//                 .collection('users')
//                 .doc(FirebaseAuth
//                     .instance
//                     .currentUser!
//                     .uid)
//                 .update({
//               "leisure_summa":
//                   leisureTransactions
//             });
//           } else if (transactionCategory ==
//               'Fuel') {
//             fuelTransactions =
//                 fuelTransactions -
//                     initialAmount;
//             fuelTransactions =
//                 fuelTransactions +
//                     transferAmountNew;
//             await FirebaseFirestore
//                 .instance
//                 .collection('users')
//                 .doc(FirebaseAuth
//                     .instance
//                     .currentUser!
//                     .uid)
//                 .update({
//               "fuel_summa":
//                   fuelTransactions
//             });
//           } else if (transactionCategory ==
//               'Cosmetics') {
//             cosmeticsTransactions =
//                 cosmeticsTransactions -
//                     initialAmount;
//             cosmeticsTransactions =
//                 cosmeticsTransactions +
//                     transferAmountNew;
//             await FirebaseFirestore
//                 .instance
//                 .collection('users')
//                 .doc(FirebaseAuth
//                     .instance
//                     .currentUser!
//                     .uid)
//                 .update({
//               "cosmetics_summa":
//                   cosmeticsTransactions
//             });
//           } else if (transactionCategory ==
//               'Health') {
//             healthTransactions =
//                 healthTransactions -
//                     initialAmount;
//             healthTransactions =
//                 healthTransactions +
//                     transferAmountNew;
//             await FirebaseFirestore
//                 .instance
//                 .collection('users')
//                 .doc(FirebaseAuth
//                     .instance
//                     .currentUser!
//                     .uid)
//                 .update({
//               "health_summa":
//                   healthTransactions
//             });
//           }
//         }
//       } else {
//         if (initialCategory ==
//             "Groceries") {
//           groceriesTransactions =
//               groceriesTransactions -
//                   initialAmount;
//           if (categoryChosen ==
//               'Leisure') {
//             leisureTransactions =
//                 leisureTransactions +
//                     transferAmountNew;
//             await FirebaseFirestore
//                 .instance
//                 .collection('users')
//                 .doc(FirebaseAuth
//                     .instance
//                     .currentUser!
//                     .uid)
//                 .update({
//               "groceries_summa":
//                   groceriesTransactions,
//               "leisure_summa":
//                   leisureTransactions,
//             });
//           } else if (categoryChosen ==
//               'Fuel') {
//             fuelTransactions =
//                 fuelTransactions +
//                     transferAmountNew;
//             await FirebaseFirestore
//                 .instance
//                 .collection('users')
//                 .doc(FirebaseAuth
//                     .instance
//                     .currentUser!
//                     .uid)
//                 .update({
//               "groceries_summa":
//                   groceriesTransactions,
//               "fuel_summa":
//                   fuelTransactions,
//             });
//           } else if (categoryChosen ==
//               'Cosmetics') {
//             cosmeticsTransactions =
//                 cosmeticsTransactions +
//                     transferAmountNew;
//             await FirebaseFirestore
//                 .instance
//                 .collection('users')
//                 .doc(FirebaseAuth
//                     .instance
//                     .currentUser!
//                     .uid)
//                 .update({
//               "groceries_summa":
//                   groceriesTransactions,
//               "cosmetics_summa":
//                   cosmeticsTransactions,
//             });
//           } else if (categoryChosen ==
//               'Health') {
//             healthTransactions =
//                 healthTransactions +
//                     transferAmountNew;
//             await FirebaseFirestore
//                 .instance
//                 .collection('users')
//                 .doc(FirebaseAuth
//                     .instance
//                     .currentUser!
//                     .uid)
//                 .update({
//               "groceries_summa":
//                   groceriesTransactions,
//               "health_summa":
//                   healthTransactions,
//             });
//           }
//         } else if (initialCategory ==
//             'Leisure') {
//           leisureTransactions =
//               leisureTransactions -
//                   initialAmount;
//           if (categoryChosen ==
//               'Groceries') {
//             groceriesTransactions =
//                 groceriesTransactions +
//                     transferAmountNew;
//             await FirebaseFirestore
//                 .instance
//                 .collection('users')
//                 .doc(FirebaseAuth
//                     .instance
//                     .currentUser!
//                     .uid)
//                 .update({
//               "groceries_summa":
//                   groceriesTransactions,
//               "leisure_summa":
//                   leisureTransactions,
//             });
//           } else if (categoryChosen ==
//               'Fuel') {
//             fuelTransactions =
//                 fuelTransactions +
//                     transferAmountNew;
//             await FirebaseFirestore
//                 .instance
//                 .collection('users')
//                 .doc(FirebaseAuth
//                     .instance
//                     .currentUser!
//                     .uid)
//                 .update({
//               "leisure_summa":
//                   leisureTransactions,
//               "fuel_summa":
//                   fuelTransactions,
//             });
//           } else if (categoryChosen ==
//               'Cosmetics') {
//             cosmeticsTransactions =
//                 cosmeticsTransactions +
//                     transferAmountNew;
//             await FirebaseFirestore
//                 .instance
//                 .collection('users')
//                 .doc(FirebaseAuth
//                     .instance
//                     .currentUser!
//                     .uid)
//                 .update({
//               "leisure_summa":
//                   leisureTransactions,
//               "cosmetics_summa":
//                   cosmeticsTransactions,
//             });
//           } else if (categoryChosen ==
//               'Health') {
//             healthTransactions =
//                 healthTransactions +
//                     transferAmountNew;
//             await FirebaseFirestore
//                 .instance
//                 .collection('users')
//                 .doc(FirebaseAuth
//                     .instance
//                     .currentUser!
//                     .uid)
//                 .update({
//               "leisure_summa":
//                   leisureTransactions,
//               "health_summa":
//                   healthTransactions,
//             });
//           }
//         } else if (initialCategory ==
//             "Fuel") {
//           fuelTransactions =
//               fuelTransactions -
//                   initialAmount;
//           if (categoryChosen ==
//               'Groceries') {
//             groceriesTransactions =
//                 groceriesTransactions +
//                     transferAmountNew;
//             await FirebaseFirestore
//                 .instance
//                 .collection('users')
//                 .doc(FirebaseAuth
//                     .instance
//                     .currentUser!
//                     .uid)
//                 .update({
//               "groceries_summa":
//                   groceriesTransactions,
//               "fuel_summa":
//                   fuelTransactions,
//             });
//           } else if (categoryChosen ==
//               'Leisure') {
//             leisureTransactions =
//                 leisureTransactions +
//                     transferAmountNew;
//             await FirebaseFirestore
//                 .instance
//                 .collection('users')
//                 .doc(FirebaseAuth
//                     .instance
//                     .currentUser!
//                     .uid)
//                 .update({
//               "leisure_summa":
//                   leisureTransactions,
//               "fuel_summa":
//                   fuelTransactions,
//             });
//           } else if (categoryChosen ==
//               'Cosmetics') {
//             cosmeticsTransactions =
//                 cosmeticsTransactions +
//                     transferAmountNew;
//             await FirebaseFirestore
//                 .instance
//                 .collection('users')
//                 .doc(FirebaseAuth
//                     .instance
//                     .currentUser!
//                     .uid)
//                 .update({
//               "fuel_summa":
//                   fuelTransactions,
//               "cosmetics_summa":
//                   cosmeticsTransactions,
//             });
//           } else if (categoryChosen ==
//               'Health') {
//             healthTransactions =
//                 healthTransactions +
//                     transferAmountNew;
//             await FirebaseFirestore
//                 .instance
//                 .collection('users')
//                 .doc(FirebaseAuth
//                     .instance
//                     .currentUser!
//                     .uid)
//                 .update({
//               "fuel_summa":
//                   fuelTransactions,
//               "health_summa":
//                   healthTransactions,
//             });
//           }
//         } else if (initialCategory ==
//             'Cosmetics') {
//           cosmeticsTransactions =
//               cosmeticsTransactions -
//                   initialAmount;
//           if (categoryChosen ==
//               'Groceries') {
//             groceriesTransactions =
//                 groceriesTransactions +
//                     transferAmountNew;
//             await FirebaseFirestore
//                 .instance
//                 .collection('users')
//                 .doc(FirebaseAuth
//                     .instance
//                     .currentUser!
//                     .uid)
//                 .update({
//               "groceries_summa":
//                   groceriesTransactions,
//               "cosmetics_summa":
//                   cosmeticsTransactions,
//             });
//           } else if (categoryChosen ==
//               'Leisure') {
//             leisureTransactions =
//                 leisureTransactions +
//                     transferAmountNew;
//             await FirebaseFirestore
//                 .instance
//                 .collection('users')
//                 .doc(FirebaseAuth
//                     .instance
//                     .currentUser!
//                     .uid)
//                 .update({
//               "leisure_summa":
//                   leisureTransactions,
//               "cosmetics_summa":
//                   cosmeticsTransactions,
//             });
//           } else if (categoryChosen ==
//               'Fuel') {
//             fuelTransactions =
//                 fuelTransactions +
//                     transferAmountNew;
//             await FirebaseFirestore
//                 .instance
//                 .collection('users')
//                 .doc(FirebaseAuth
//                     .instance
//                     .currentUser!
//                     .uid)
//                 .update({
//               "fuel_summa":
//                   fuelTransactions,
//               "cosmetics_summa":
//                   cosmeticsTransactions,
//             });
//           } else if (categoryChosen ==
//               'Health') {
//             healthTransactions =
//                 healthTransactions +
//                     transferAmountNew;
//             await FirebaseFirestore
//                 .instance
//                 .collection('users')
//                 .doc(FirebaseAuth
//                     .instance
//                     .currentUser!
//                     .uid)
//                 .update({
//               "cosmetics_summa":
//                   cosmeticsTransactions,
//               "health_summa":
//                   healthTransactions,
//             });
//           }
//         } else if (initialCategory ==
//             "Health") {
//           healthTransactions =
//               healthTransactions -
//                   initialAmount;
//           if (categoryChosen ==
//               'Groceries') {
//             groceriesTransactions =
//                 groceriesTransactions +
//                     transferAmountNew;
//             await FirebaseFirestore
//                 .instance
//                 .collection('users')
//                 .doc(FirebaseAuth
//                     .instance
//                     .currentUser!
//                     .uid)
//                 .update({
//               "groceries_summa":
//                   groceriesTransactions,
//               "health_summa":
//                   healthTransactions,
//             });
//           } else if (categoryChosen ==
//               'Leisure') {
//             leisureTransactions =
//                 leisureTransactions +
//                     transferAmountNew;
//             await FirebaseFirestore
//                 .instance
//                 .collection('users')
//                 .doc(FirebaseAuth
//                     .instance
//                     .currentUser!
//                     .uid)
//                 .update({
//               "leisure_summa":
//                   leisureTransactions,
//               "health_summa":
//                   healthTransactions,
//             });
//           } else if (categoryChosen ==
//               'Fuel') {
//             fuelTransactions =
//                 fuelTransactions +
//                     transferAmountNew;
//             await FirebaseFirestore
//                 .instance
//                 .collection('users')
//                 .doc(FirebaseAuth
//                     .instance
//                     .currentUser!
//                     .uid)
//                 .update({
//               "fuel_summa":
//                   fuelTransactions,
//               "health_summa":
//                   healthTransactions,
//             });
//           } else if (categoryChosen ==
//               'Cosmetics') {
//             cosmeticsTransactions =
//                 cosmeticsTransactions +
//                     transferAmountNew;
//             await FirebaseFirestore
//                 .instance
//                 .collection('users')
//                 .doc(FirebaseAuth
//                     .instance
//                     .currentUser!
//                     .uid)
//                 .update({
//               "cosmetics_summa":
//                   cosmeticsTransactions,
//               "health_summa":
//                   healthTransactions,
//             });
//           }
//         }
//       }
//     });
//   }
//
//   CoolDropdown buildCoolDropdownEdit(BuildContext context) {
//     return CoolDropdown(
//       dropdownPadding: const EdgeInsets.symmetric(horizontal: 20),
//       resultPadding: const EdgeInsets.symmetric(horizontal: 20),
//       selectedItemPadding: const EdgeInsets.symmetric(horizontal: 20),
//       unselectedItemTS:
//           const TextStyle(color: Colors.orangeAccent, fontSize: 20),
//       dropdownItemPadding: const EdgeInsets.symmetric(horizontal: 20),
//       resultHeight: MediaQuery.of(context).size.height * 0.09,
//       resultBD: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(30),
//           border: Border.all(width: 2, color: Colors.orangeAccent)),
//       resultTS: const TextStyle(color: Colors.orangeAccent, fontSize: 20),
//       placeholderTS:
//           TextStyle(color: Colors.orangeAccent.withOpacity(0.7), fontSize: 20),
//       selectedItemTS: const TextStyle(color: Colors.orangeAccent, fontSize: 20),
//       selectedItemBD:
//           BoxDecoration(color: Colors.orangeAccent.withOpacity(0.2)),
//       dropdownBD: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             spreadRadius: 1,
//             blurRadius: 10,
//             offset: const Offset(0, 1),
//           ),
//         ],
//       ),
//       resultWidth: double.infinity,
//       dropdownWidth: MediaQuery.of(context).size.width * 0.8,
//       dropdownList: dropdownItemList,
//       onChange: (newVal) {
//         Future.delayed(const Duration(seconds: 2), () async {
//           categoryChosen = newVal!["value"];
//           category = true;
//         });
//       },
//       defaultValue: changeItem[index],
//     );
//   }
// }
//
