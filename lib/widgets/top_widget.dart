import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../models/data.dart';

class TopWidget extends StatelessWidget {
  const TopWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.6,
      color: Colors.purple,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.1),
            child: Text("125.71 Zl",
            style: TextStyle(color: Colors.black, fontSize: 25),),
          ),
          // SfCircularChart(
          //
          // ),


          SfCartesianChart(
            title: ChartTitle(text: "Column Chart"),
            series: <ChartSeries>[
              ColumnSeries<SalesData, double>(
                  dataSource: chartData,
                  xValueMapper: (SalesData sales, _) => sales.year,
                  yValueMapper: (SalesData sales, _) => sales.sales),
            ],
          )
        ],
      ),
    );
  }
}