import 'package:finance_app/widgets/streamBuilder_transactions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../screens/add_transaction.dart';

class ChartData {
  ChartData(this.x, this.y);

  var x;
  final double y;
}

List<ChartData> chartData = [];

List changeItem = [];

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
    'icon': FittedBox(
      fit: BoxFit.scaleDown,
      child: SvgPicture.asset(
        "assets/icons/icon1.svg",
        width: 20,
        height: 20,
// Icons.local_mall_rounded,
        color: Colors.orangeAccent,
// size: 25,
      ),
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
    'icon': FittedBox(
      fit: BoxFit.scaleDown,
      child: SvgPicture.asset(
        "assets/icons/icon2.svg",
        width: 20,
        height: 20,
        // Icons.local_mall_rounded,
        color: Colors.orangeAccent,
        // size: 25,
      ),
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
