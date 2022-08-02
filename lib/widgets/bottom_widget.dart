import 'package:flutter/material.dart';

import '../models/labels.dart';

class BottomWidget extends StatelessWidget {
  const BottomWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.6),
      child: Container(
          height: MediaQuery.of(context).size.height * 0.4,
          color: Colors.white,
          child:
              ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.height*0.05),
                    child: const Text("History", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.height*0.05, top: MediaQuery.of(context).size.height*0.05),
                    child: Labels(name: "Groceries", date: "21.02.2022", price: "21.99 PLN", icon: const Icon(Icons.local_grocery_store,)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.height*0.05, top: MediaQuery.of(context).size.height*0.03),
                    child: Labels(name: "Groceries", date: "21.02.2022", price: "21.99 PLN", icon: const Icon(Icons.local_grocery_store,)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.height*0.05, top: MediaQuery.of(context).size.height*0.03),
                    child: Labels(name: "Groceries", date: "21.02.2022", price: "21.99 PLN", icon: const Icon(Icons.local_grocery_store,)),
                  )
                ],
              ),
            ),
    );
  }
}

