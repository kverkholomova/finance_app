// import 'package:cool_dropdown/cool_dropdown.dart';
// import 'package:finance_app/models/data.dart';
// import 'package:finance_app/widgets/bottom_widget_add_transaction.dart';
// import 'package:flutter/material.dart';
//
// class TopWidgetTransaction extends StatefulWidget {
//   const TopWidgetTransaction({Key? key}) : super(key: key);
//
//   @override
//   State<TopWidgetTransaction> createState() => _TopWidgetTransactionState();
// }
// Color iconColor = Colors.orangeAccent;
// Icon iconChosen = const Icon(Icons.ac_unit_rounded);
//
// class _TopWidgetTransactionState extends State<TopWidgetTransaction> {
//   String dropdownValue = data[0].name;
//
//   @override
//   Widget build(BuildContext context) {
//     return buildTopWidget(context);
//   }
//
//   Padding buildTopWidget(BuildContext context) {
//     return Padding(
//     padding:
//         EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.5),
//     child: Container(
//       height: MediaQuery.of(context).size.height * 0.4,
//       color: Colors.purple,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: ListView(
//           children: [
//             Padding(
//               padding: EdgeInsets.only(
//                   top: MediaQuery.of(context).size.height * 0.1),
//               child: Align(
//                 alignment: Alignment.topLeft,
//                 child: Text(
//                   "$userInput PLN",
//                   style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 35,
//                       fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//             // Padding(
//             //   padding: EdgeInsets.only(
//             //       top: MediaQuery.of(context).size.height * 0.05),
//             //   child: Container(
//             //     decoration: BoxDecoration(
//             //         borderRadius: BorderRadius.circular(10),
//             //         color: Colors.purple,
//             //         border: Border.all(color: Colors.orangeAccent, width: 3)),
//             //     child: DropdownButton(
//             //       // value: dropdownValue,
//             //       items: data.map((DropDownData items) {
//             //         return DropdownMenuItem(
//             //           value: items,
//             //           child: Padding(
//             //             padding: const EdgeInsets.all(8.0),
//             //             child: Row(
//             //               children: [
//             //                 Icon(items.icon.icon),
//             //                 Text(items.name),
//             //               ],
//             //             ),
//             //           ),
//             //         );
//             //       }).toList(),
//             //       onChanged: (value) {
//             //         setState(() {
//             //           value;
//             //         });
//             //       },
//             //     ),
//             //   ),
//             // ),
//             Padding(
//               padding: EdgeInsets.only(
//                   top: MediaQuery.of(context).size.height * 0.05),
//               child: Align(
//                 alignment: Alignment.center,
//                 child: CoolDropdown(
//                   dropdownItemPadding: const EdgeInsets.symmetric(horizontal: 20),
//                   resultHeight: MediaQuery.of(context).size.height * 0.09,
//                   resultBD: BoxDecoration(
//                       color: Colors.purple,
//                       borderRadius: BorderRadius.circular(10),
//                       border:
//                           Border.all(width: 3.5, color: Colors.orangeAccent)),
//                   resultTS:
//                       const TextStyle(color: Colors.orangeAccent, fontSize: 20),
//                   placeholderTS: TextStyle(
//                       color: Colors.orangeAccent.withOpacity(0.7),
//                       fontSize: 20),
//                   selectedItemTS:
//                       const TextStyle(color: Colors.black, fontSize: 20),
//                   selectedItemBD: BoxDecoration(
//                       color: Colors.orangeAccent.withOpacity(0.3)),
//                   dropdownBD: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.1),
//                         spreadRadius: 1,
//                         blurRadius: 10,
//                         offset: const Offset(0, 1),
//                       ),
//                     ],
//                   ),
//                   resultWidth: double.infinity,
//                   dropdownWidth: MediaQuery.of(context).size.width * 0.8,
//                   dropdownList: dropdownItemList,
//                   onChange: (_) {
//                     iconColor = Colors.orangeAccent;
//                   },
//                   defaultValue: dropdownItemList[3],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     ),
//   );
//   }
// }
