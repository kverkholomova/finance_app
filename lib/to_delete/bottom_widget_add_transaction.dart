// import 'package:finance_app/screens/add_transaction.dart';
// import 'package:finance_app/widgets/top_widget_add_transaction.dart';
// import 'package:flutter/material.dart';
//
// class BottomWidgetTransaction extends StatefulWidget {
//   const BottomWidgetTransaction({Key? key}) : super(key: key);
//
//   @override
//   State<BottomWidgetTransaction> createState() => _BottomWidgetTransactionState();
// }
// String userInput = '0';
//
// class _BottomWidgetTransactionState extends State<BottomWidgetTransaction> {
//
//
//   String option = '';
//   int index = 0;
//   double second = 0;
//   double first = 0;
//   String number = '';
//   double answerDouble = 0;
//   int answerInt=0;
//   double answer = 0;
//   num third =0;
//
//   @override
//   Widget build(BuildContext context) {
//     return buildBottomWidget(context);
//   }
//
//   Padding buildBottomWidget(BuildContext context) {
//     return Padding(
//     padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.35),
//     child: Container(
//       height: MediaQuery.of(context).size.height * 0.55,
//       color: Colors.white,
//       child: Padding(
//         padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.07),
//         child: Stack(
//           children: [
//             Column(
//               children: [
//                 Expanded(
//                   flex: 1,
//                   child: Row(
//                     children: [
//                       Expanded(
//                         flex: 1,
//                         child: buildTextButton("7"),
//                       ),
//                       Expanded(
//                           flex: 1,
//                           child: buildTextButton("8")
//                       ),
//                       Expanded(
//                         flex: 1,
//                         child: buildTextButton("9"),
//                       )
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   flex: 1,
//                   child: Row(
//                     children: [
//                       Expanded(
//                         flex: 1,
//                         child: buildTextButton("4"),
//                       ),
//                       Expanded(
//                         flex: 1,
//                         child: buildTextButton("5"),
//                       ),
//                       Expanded(
//                         flex: 1,
//                         child: buildTextButton("6"),
//                       )
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   flex: 1,
//                   child: Row(
//                     children: [
//                       Expanded(
//                         flex: 1,
//                         child: buildTextButton("1"),
//                       ),
//                       Expanded(
//                         flex: 1,
//                         child: buildTextButton("2"),
//                       ),
//                       Expanded(
//                         flex: 1,
//                         child: buildTextButton("3"),
//                       )
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   flex: 1,
//                   child: Row(
//                     children: [
//                       Expanded(
//                         flex: 1,
//                         child: TextButton(
//                             child: const Text(
//                               ".",
//                               style: TextStyle(
//                                   fontSize: 45,
//                                   color: Colors.black),
//                             ),
//                             onPressed: () {
//                               setState(() {
//                                 if (userInput == '0') {
//                                   userInput = '0.';
//                                 } else {
//                                   userInput = userInput + '.';
//                                   second = double.parse(userInput
//                                       .substring(userInput.length -
//                                       (userInput.length -
//                                           index)));
//
//                                 }
//                               });
//                             }),
//                       ),
//                       Expanded(
//                         flex: 1,
//                         child: buildTextButton('0'),
//                       ),
//                       Expanded(
//                         flex: 1,
//                         child: IconButton(
//                             icon: Icon(Icons.backspace),
//                             onPressed: () {
//
//                             }),
//                       )
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
//   }
//   TextButton buildTextButton(String valueButton) {
//     return TextButton(
//         child: Text(
//           valueButton,
//           style: const TextStyle(
//               fontSize: 30,
//               color: Colors.black),
//         ),
//         onPressed: () {
//           setState(() {
//             if (userInput == '0') {
//               userInput = valueButton;
//             }
//             else {
//               userInput = userInput + valueButton;
//               second = double.parse(userInput
//                   .substring(userInput.length -
//                   (userInput.length -
//                       index)));
//
//             }
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => const AddTransaction()),
//             );
//             // Navigator.pushNamed(context, '/TopWidgetTransaction',
//             // arguments: {"input": userInput}
//             // );
//           });
//         });
//   }
//
// }