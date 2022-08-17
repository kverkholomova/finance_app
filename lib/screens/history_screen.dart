import 'package:finance_app/constants.dart';
import 'package:finance_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/streamBuilder_transactions.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  bool poop = true;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  MyHomePage()),
        );
        return poop;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "History",
            style: headStyle,
          ),
          backgroundColor: Colors.purple,
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  MyHomePage()),
              );
            },
            icon: closeIcon,
          ),
        ),
        body: const StreamBuilderTransactions(limitedLength: false,),
      ),
    );
  }
}

