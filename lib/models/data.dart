// class SalesData {
//   SalesData(this.year, this.sales);
//
//   final double year;
//   final double sales;
// }
//
// List<SalesData> chartData = [
//   SalesData(2004, 7),
//   SalesData(2005, 5),
//   SalesData(2006, 9),
//   SalesData(2007, 2),
//   SalesData(2008, 10)
// ];

import 'package:flutter/material.dart';

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

class DropDownData{
  DropDownData(this.icon, this.name);
  final Icon icon;
  final String name;
}

List<DropDownData> data = [
  DropDownData(Icon(Icons.ac_unit_rounded), 'Groceries'),
  DropDownData(Icon(Icons.ac_unit_rounded), 'Leisure'),
  DropDownData(Icon(Icons.ac_unit_rounded), 'Fuel'),
  DropDownData(Icon(Icons.ac_unit_rounded), 'Cosmetics'),
  DropDownData(Icon(Icons.ac_unit_rounded), 'Health'),
];