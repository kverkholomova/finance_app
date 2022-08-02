import 'package:flutter/material.dart';

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
                    child: Text("History", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.height*0.05, top: MediaQuery.of(context).size.height*0.05),
                    child: Labels(name: "Groceries", date: "21.02.2022", price: "21.99 PLN", icon: Icon(Icons.local_grocery_store,)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.height*0.05, top: MediaQuery.of(context).size.height*0.03),
                    child: Labels(name: "Groceries", date: "21.02.2022", price: "21.99 PLN", icon: Icon(Icons.local_grocery_store,)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.height*0.05, top: MediaQuery.of(context).size.height*0.03),
                    child: Labels(name: "Groceries", date: "21.02.2022", price: "21.99 PLN", icon: Icon(Icons.local_grocery_store,)),
                  )
                ],
              ),
            ),
    );
  }
}

class Labels extends StatelessWidget {
  String name;
  String date;
  String price;
  final IconData icon;
  Labels({
    Key? key, required this.name, required this.date, required this.price, required this.icon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.orange
          ),
          child: Icon(icon, color: Colors.black,size: 25,),
        ),
        Column(
            children:[
              Padding(
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.height*0.03),
                child: Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17), textAlign: TextAlign.left,),
              ),
              Padding(
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.height*0.01),
                child: Text(date, style: TextStyle(fontSize: 12), textAlign: TextAlign.left,),
              ),
            ] ),
        Padding(padding: EdgeInsets.only(left: MediaQuery.of(context).size.height*0.07),
        child: Text(price, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),))
      ],
    );
  }
}
