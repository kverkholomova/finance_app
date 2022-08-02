import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          TopWidget(),
          BottomWidget(),
            Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.2),
          child: Align(
            alignment: Alignment.center,
            child: FloatingActionButton(
              backgroundColor: Colors.orangeAccent,
                child: const Icon(Icons.add, size: 50,),
                onPressed: (){

            }),
          ),
            ),

        ],
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class TopWidget extends StatelessWidget {
  const TopWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
    height: MediaQuery.of(context).size.height*0.6,
    color: Colors.purple,
      );
  }
}

class BottomWidget extends StatelessWidget {
  const BottomWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.6),
      child: Container(
        height: MediaQuery.of(context).size.height*0.4,
        color: Colors.white,
      ),
    );
  }
}
