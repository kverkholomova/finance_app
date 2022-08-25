import 'package:finance_app/screens/add_transaction.dart';
import 'package:finance_app/screens/history_screen.dart';
import 'package:finance_app/widgets/button_add_transaction.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/data.dart';
import '../models/histogram.dart';
import '../widgets/bottom_widget.dart';
import '../widgets/top_widget.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  String id = "homepage";

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    const Histogram();
    getDataHistogram();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const TopWidget(),
          const BottomWidget(),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
            child: Align(
              alignment: Alignment.center,
              child: FloatingActionButton(
                  backgroundColor: Colors.orangeAccent,
                  child: const Icon(
                    Icons.add,
                    size: 50,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AddTransaction()),
                    );
                  }),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            height: 50,
            width: double.infinity,
            child: MaterialButton(
                color: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(color: Colors.orangeAccent, width: 2),
                ),
                onPressed: () async{

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => History()),
                  );

                },
                child: const Text("View more", style: TextStyle(color: Colors.black, fontSize: 16),)),
          ),
        ),
      ),
    );
  }
}
