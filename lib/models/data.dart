import 'package:finance_app/to_delete/top_widget_add_transaction.dart';
import 'package:flutter/material.dart';

import '../screens/add_transaction.dart';
import 'labels.dart';

class ChartData{
  ChartData(this.x, this.y);
  final String x;
  final double y;
}

final List<ChartData> chartData = [
  ChartData('Groceries', 15),
  ChartData('Leisure', 7),
  ChartData('Fuel', 12),
  ChartData('Cosmetics', 10),
  ChartData('Health', 5)
];

// class DropDownData{
//   DropDownData(this.icon, this.name);
//   final Icon icon;
//   final String name;
// }
//
// List<DropDownData> data = [
//   DropDownData(Icon(Icons.local_grocery_store), 'Groceries'),
//   DropDownData(Icon(Icons.event_seat), 'Leisure'),
//   DropDownData(Icon(Icons.car_crash_rounded), 'Fuel'),
//   DropDownData(Icon(Icons.network_wifi_rounded), 'Cosmetics'),
//   DropDownData(Icon(Icons.medical_services_outlined), 'Health'),
// ];

// String label_name = '';

List dropdownItemList = [
  {'label': 'Groceries', 'value': 'Groceries', 'icon': Icon(Icons.local_grocery_store, color: iconColor,)}, // label is required and unique
  {'label': 'Leisure', 'value': 'Leisure', 'icon': Icon(Icons.event_seat, color: iconColor,)},
  {'label': 'Fuel', 'value': 'Fuel', 'icon': Icon(Icons.car_crash_rounded, color: iconColor,)},
  {'label': 'Cosmetics', 'value': 'Cosmetics', 'icon': Icon(Icons.network_wifi_rounded, color: iconColor,)},
  {'label': 'Health', 'value': 'Health', 'icon': Icon(Icons.medical_services_outlined, color: iconColor,)},
];

// List<Labels> labels =[
//   Labels(name: label_name, date: date, price: price, icon: icon)
// ];