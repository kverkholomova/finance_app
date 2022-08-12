import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  final String name;
  final String date;
  final String price;


  const Labels(
      {Key? key,
      required this.name,
      required this.date,
      required this.price,
    })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
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
            child: name == 'Groceries' ? const Icon(
              Icons.local_grocery_store,
              color: Colors.orangeAccent,
              size: 25,
            ): name == "Leisure"? const Icon(
              Icons.event_seat,
              color: Colors.orangeAccent,
              size: 25,
            ):name == "Fuel"? const Icon(
              Icons.car_crash_rounded,
              color: Colors.orangeAccent,
              size: 25,
            ):name == "Cosmetics"? const Icon(
              Icons.network_wifi_rounded,
              color: Colors.orangeAccent,
              size: 25,
            ):name == "Health"? const Icon(
              Icons.medical_services_outlined,
              color: Colors.orangeAccent,
              size: 25,
            ):const Icon(
              Icons.add,
              color: Colors.orangeAccent,
              size: 25,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 7,
            child: Padding(
              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.02),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      softWrap: true,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      date,
                      softWrap: true,
                      style: const TextStyle(fontSize: 12),
                      textAlign: TextAlign.left,
                    ),
                  ]),
            ),
          ),
          Expanded(
            flex:4,
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
