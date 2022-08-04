import 'package:flutter/material.dart';

class ButtonAddTransaction extends StatelessWidget {
  const ButtonAddTransaction({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}