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
      padding: const EdgeInsets.only(
        // left: 20,
        right: 10
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                // margin: EdgeInsets.all(20),
                // padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
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
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.height * 0.03),
                      child: Text(
                        name,
                        softWrap: true,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.height * 0.01),
                      child: Text(
                        date,
                        softWrap: true,
                        style: const TextStyle(fontSize: 12),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ]),
            ],
          ),
          Padding(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.height * 0.05),
              child: Text(
                price,
                softWrap: true,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                textAlign: TextAlign.right,
              ))
        ],
      ),
    );
  }
}
