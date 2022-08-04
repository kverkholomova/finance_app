import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:finance_app/models/data.dart';
import 'package:finance_app/widgets/bottom_widget_add_transaction.dart';
import 'package:flutter/material.dart';

class TopWidgetTransaction extends StatefulWidget {
  const TopWidgetTransaction({Key? key}) : super(key: key);

  @override
  State<TopWidgetTransaction> createState() => _TopWidgetTransactionState();
}

class _TopWidgetTransactionState extends State<TopWidgetTransaction> {
  String dropdownValue = data[0].name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.5),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.4,
        color: Colors.purple,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.1),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "${userInput} PLN",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.only(
              //       top: MediaQuery.of(context).size.height * 0.05),
              //   child: Container(
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(10),
              //         color: Colors.purple,
              //         border: Border.all(color: Colors.orangeAccent, width: 3)),
              //     child: DropdownButton(
              //       value: dropdownValue,
              //       items: data.map((DropDownData items) {
              //         return DropdownMenuItem(
              //           value: items,
              //           child: Padding(
              //             padding: const EdgeInsets.all(8.0),
              //             child: Row(
              //               children: [
              //                 Icon(items.icon.icon),
              //                 Text(items.name),
              //               ],
              //             ),
              //           ),
              //         );
              //       }).toList(),
              //       onChanged: (value) {
              //         setState(() {
              //           value;
              //         });
              //       },
              //     ),
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05),
                child: Align(
                  alignment: Alignment.center,
                  child: CoolDropdown(

                    dropdownList: dropdownItemList,
                    onChange: (_) {},
                    defaultValue: dropdownItemList[3],

                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
