import 'package:finance_app/screens/add_transaction.dart';
import 'package:flutter/material.dart';

import '../widgets/bottom_widget.dart';
import '../widgets/top_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // fit: StackFit.passthrough,
        children: [
          TopWidget(),
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
                      MaterialPageRoute(builder: (context) => AddTransaction()),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
