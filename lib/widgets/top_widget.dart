import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../models/data.dart';
import '../models/radial_gauge.dart';

class TopWidget extends StatelessWidget {
  const TopWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.4),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.6,
        color: Colors.purple,
        child: Stack(

          alignment: Alignment.topCenter,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.1,
                  // bottom: MediaQuery.of(context).size.height * 0.01
              ),
              child: const Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "125.71 PLN",
                  style:
                  TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
            ),
            FittedBox(
                fit: BoxFit.fitHeight,
                child: RadialGauge()),

            Positioned(
              left: MediaQuery.of(context).size.width * 0.0,
              right: MediaQuery.of(context).size.width * 0.0,
              top: MediaQuery.of(context).size.height * 0.36,
              bottom: MediaQuery.of(context).size.height * 0.03,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Align(
                  alignment: Alignment.center,
                  child: SfCartesianChart(
                      primaryYAxis: NumericAxis(
                        isVisible: false
                      ),
                      // title: ChartTitle(text: "Column Chart"),
                      primaryXAxis: CategoryAxis(
                        labelStyle: TextStyle(
                          color: Colors.white
                        )
                      ),
                      plotAreaBorderWidth: 0,
                      series: <ChartSeries<ChartData, String>>[

                        // Renders column chart
                        ColumnSeries<ChartData, String>(

                            color: Colors.indigoAccent,
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
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


