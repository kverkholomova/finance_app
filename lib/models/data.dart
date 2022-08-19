import 'package:flutter/material.dart';
import '../screens/add_transaction.dart';

class ChartData {
  ChartData(this.x, this.y);

  var x;
  final double y;
}

List<ChartData> chartData = [];

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
      Icons.event_seat,
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
      Icons.l
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
