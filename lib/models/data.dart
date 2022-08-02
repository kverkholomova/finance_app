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

class ChartData{
  ChartData(this.x, this.y);
  final String x;
  final double y;
}

final List<ChartData> chartData = [
  ChartData('John', 10),
  ChartData('Parker', 11),
  ChartData('David', 9),
  ChartData('Peter', 10),
  ChartData('Brit', 10)
];