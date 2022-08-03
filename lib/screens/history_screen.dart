import 'package:finance_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/labels.dart';

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
          MaterialPageRoute(builder: (context) => const MyHomePage()),
        );
        return poop;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "History",
            style: GoogleFonts.raleway(
              fontSize: 25,
              color: Colors.orangeAccent,
            ),
          ),
          backgroundColor: Colors.purple,
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage()),
              );
            },
            icon: const Icon(
              Icons.close,
              color: Colors.orange,
            ),
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.height * 0.00,
                  top: MediaQuery.of(context).size.height * 0.05),
              child: const Labels(
                  name: "Groceries",
                  date: "21.02.2022",
                  price: "21.99 PLN",
                  icon: Icon(
                    Icons.local_grocery_store,
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.height * 0.00,
                  top: MediaQuery.of(context).size.height * 0.03),
              child: const Labels(
                  name: "Groceries",
                  date: "21.02.2022",
                  price: "21.99 PLN",
                  icon: Icon(
                    Icons.local_grocery_store,
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.height * 0.00,
                  top: MediaQuery.of(context).size.height * 0.03),
              child: const Labels(
                  name: "Groceries",
                  date: "21.02.2022",
                  price: "21.99 PLN",
                  icon: Icon(
                    Icons.local_grocery_store,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
