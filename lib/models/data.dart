import 'package:finance_app/widgets/streamBuilder_transactions.dart';
import 'package:flutter/material.dart';
import '../screens/add_transaction.dart';

class ChartData {
  ChartData(this.x, this.y);

  var x;
  final double y;
}

List<ChartData> chartData = [];

List changeItem = [
  {
    'label': transactionCategory == 'Groceries' ? 'Groceries':
    transactionCategory == "Leisure"? "Leisure":
    transactionCategory == "Fuel"? "Fuel":
    transactionCategory == "Cosmetics"? "Cosmetics" :
    transactionCategory == "Health"? "Health":
    "Category",
    'value': transactionCategory,
    'icon': transactionCategory == 'Groceries' ? const Icon(
      Icons.local_grocery_store,
      color: Colors.orangeAccent,
      size: 25,
    ): transactionCategory == "Leisure"? const Icon(
      Icons.event_seat,
      color: Colors.orangeAccent,
      size: 25,
    ):transactionCategory == "Fuel"? const Icon(
      Icons.car_crash_rounded,
      color: Colors.orangeAccent,
      size: 25,
    ):transactionCategory == "Cosmetics"? const Icon(
      Icons.local_mall_rounded,
      color: Colors.orangeAccent,
      size: 25,
    ):transactionCategory == "Health"? const Icon(
      Icons.medical_services_rounded,
      color: Colors.orangeAccent,
      size: 25,
    ):const Icon(
      Icons.add,
      color: Colors.orangeAccent,
      size: 25,
    ),
  }
];

List dropdownItemList = [
  {
    'label': 'Groceries',
    'value': 'Groceries',
    'icon': Icon(
      Icons.local_grocery_store,
      color: iconColor,
    )
  }, // label is required and unique
  {
    'label': 'Leisure',
    'value': 'Leisure',
    'icon': Icon(
      Icons.fastfood_rounded,
      color: iconColor,
    )
  },
  {
    'label': 'Fuel',
    'value': 'Fuel',
    'icon': Icon(
      Icons.car_crash_rounded,
      color: iconColor,
    )
  },
  {
    'label': 'Cosmetics',
    'value': 'Cosmetics',
    'icon': Icon(
      Icons.local_mall_rounded,
      color: iconColor,
    )
  },
  {
    'label': 'Health',
    'value': 'Health',
    'icon': Icon(
      Icons.medical_services_outlined,
      color: iconColor,
    )
  },
];
