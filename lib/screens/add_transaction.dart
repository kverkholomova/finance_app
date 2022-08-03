import 'package:flutter/material.dart';

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
          Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.55),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              color: Colors.purple,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.3),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.6,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.7),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: RaisedButton(
                    color: Colors.white,
                    elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Colors.orangeAccent, width: 2),
                      ),
                      onPressed: (){

                  },
                      child: Text("Add transaction", style: TextStyle(color: Colors.black, fontSize: 16),)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
