import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  String name;
  String date;
  String price;
  final Icon icon;
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
          child: Icon(icon.icon, color: Colors.black,size: 25,),
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
        Padding(padding: EdgeInsets.only(left: MediaQuery.of(context).size.height*0.05),
            child: Text(price, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),textAlign: TextAlign.right,))
      ],
    );
  }
}
