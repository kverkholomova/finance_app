import 'package:flutter/material.dart';

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






