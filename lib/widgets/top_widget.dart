import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../models/data.dart';

class TopWidget extends StatelessWidget {
  const TopWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.4),
      child: Container(
        height: MediaQuery.of(context).size.height*0.6,
        color: Colors.purple,
        child: Stack(
          alignment: Alignment.center,
          children: [

            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.1),
              child: const Align(
                alignment: Alignment.topCenter,
                child: Text("125.71 Zl",
                style: TextStyle(color: Colors.black, fontSize: 25),),
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height*0.08,
              child: SfRadialGauge(
                axes: [
                  RadialAxis(
                    startAngle: 0,
                    endAngle: 360,
                    showLabels: false,
                    showTicks: false,
                    minimum: 0,
                    maximum: 360,
                    interval: 10,
                    radiusFactor: 0.30,
                    axisLineStyle: const AxisLineStyle(
                      thickness: 0.2,
                      color: Colors.orangeAccent,
                      thicknessUnit: GaugeSizeUnit.factor,
                      // cornerStyle: CornerStyle.bothCurve,
                    ),
                    // pointers: <GaugePointer>[
                    //   RangePointer(
                    //     // value: progressValue,
                    //     width: 0.1,
                    //     sizeUnit: GaugeSizeUnit.factor,
                    //     // cornerStyle: CornerStyle.bothCurve,
                    //     enableAnimation: true,
                    //     animationType: AnimationType.linear,
                    //   )
                    // ],

                  ),
                ],
              ),
            ),
            // SfCircularChart(
            //
            // ),

            Positioned(
              top: MediaQuery.of(context).size.height*0.35,
              bottom: MediaQuery.of(context).size.height*0.02,
              child: Align(
                alignment: Alignment.center,
                child: SfCartesianChart(
                  // title: ChartTitle(text: "Column Chart"),
                  series: <ChartSeries>[
                    ColumnSeries<SalesData, double>(
                        dataSource: chartData,
                        xValueMapper: (SalesData sales, _) => sales.year,
                        yValueMapper: (SalesData sales, _) => sales.sales),
                  ],
                ),
              ),
    )
          ],
        ),
      ),
    );
  }
}