import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/labels.dart';
import '../screens/history_screen.dart';


class BottomWidget extends StatelessWidget {
  const BottomWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.6,),
      child: Container(
          height: MediaQuery.of(context).size.height * 0.4,
          // width: MediaQuery.of(context).size.width * 1,
          color: Colors.white,
          child:
              ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const History()),
                          );
                        },
                        child: Text("History", style: GoogleFonts.raleway(
                        fontSize: 22,
                        color: Colors.black,

                        // fontWeight: FontWeight.bold
                      ),textAlign: TextAlign.left),),
                    )

                  ),
                  Padding(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.height*0.00, top: MediaQuery.of(context).size.height*0.03),
                    child: const Labels(name: "Groceries", date: "21.02.2022", price: "21.99 PLN", icon: Icon(Icons.local_grocery_store,)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.height*0.00, top: MediaQuery.of(context).size.height*0.03),
                    child: const Labels(name: "Groceries", date: "21.02.2022", price: "21.99 PLN", icon: Icon(Icons.local_grocery_store,)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.height*0.00, top: MediaQuery.of(context).size.height*0.03),
                    child: const Labels(name: "Groceries", date: "21.02.2022", price: "21.99 PLN", icon: Icon(Icons.local_grocery_store,)),
                  )
                ],
              ),
            ),
    );
  }
}

