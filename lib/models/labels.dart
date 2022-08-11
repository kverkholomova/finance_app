import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  final String name;
  final String date;
  final String price;
  final Icon icon;

  const Labels(
      {Key? key,
      required this.name,
      required this.date,
      required this.price,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // margin: EdgeInsets.all(20),
            // padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              // shape: BoxShape.circle,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(width: 2, color: Colors.orangeAccent)),
            width: 37,
            height: 37,
            // decoration: const BoxDecoration(
            //     shape: BoxShape.circle,
            //     color: Colors.orange
            // ),
            child: Icon(
              icon.icon,
              color: Colors.orangeAccent,
              size: 25,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.02),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Expanded(
                flex: 7,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          name,
                          softWrap: true,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          date,
                          softWrap: true,
                          style: const TextStyle(fontSize: 12),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ]),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              price,
              softWrap: true,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
              textAlign: TextAlign.right,
            ),
          )
        ],
      ),
    );
  }
}
