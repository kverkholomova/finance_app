import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'data.dart';

class Histogram extends StatefulWidget {
  const Histogram({Key? key}) : super(key: key);

  @override
  State<Histogram> createState() => _HistogramState();
}



class _HistogramState extends State<Histogram> {
//   final AuthService _auth = AuthService();
// class Histogram extends StatelessWidget {
//   Histogram({
//     Key? key,
//   }) : super(key: key);

  @override
  initState(){
    super.initState();
    getDataHistogram();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SfCartesianChart(
          primaryYAxis: NumericAxis(
              axisLine: AxisLine(
                  color: Colors.orange
              ),
              isVisible: false
          ),
          // title: ChartTitle(text: "Column Chart"),
          primaryXAxis: CategoryAxis(
            // axisLine: AxisLine(
            //   color: Colors.orange
            // ),
              // labelRotation: 35,
              // maximumLabelWidth: 50,
              labelPlacement: LabelPlacement.betweenTicks,
              labelStyle: const TextStyle(
                  color: Colors.white
              )
          ),
          plotAreaBorderWidth: 0,
          series: <ChartSeries<ChartData, String>>[

            // Renders column chart
            ColumnSeries<ChartData, String>(

                color: Colors.orangeAccent,
                width: 0.3,
                markerSettings: const MarkerSettings(
                  isVisible: false,
                ),
                dataSource: chartData,


                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y)
          ]
        // series: <ChartSeries>[
        //   ColumnSeries<SalesData, double>(
        //       dataSource: chartData,
        //       xValueMapper: (SalesData sales, _) => sales.year,
        //       yValueMapper: (SalesData sales, _) => sales.sales),
        // ],
      ),
    );
  }
}


