import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/bottom_widget_add_transaction.dart';
import '../widgets/button_add_transaction.dart';
import '../widgets/top_widget_add_transaction.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({Key? key}) : super(key: key);

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.calendar_month,
                color: Colors.orangeAccent,
              ))
        ],
        title: Align(
          alignment: Alignment.topCenter,
          child: Text(
            "0${DateTime.now().day}.0${DateTime.now().month}.${DateTime.now().year}",
            style: GoogleFonts.raleway(
              fontSize: 25,
              color: Colors.orangeAccent,
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.orangeAccent,
          ),
          onPressed: () {},
        ),
        elevation: 0,
        backgroundColor: Colors.purple,
      ),
      body: Stack(
        children: [
          TopWidgetTransaction(),
          BottomWidgetTransaction(),
          ButtonAddTransaction(),
        ],
      ),
    );
  }
}
