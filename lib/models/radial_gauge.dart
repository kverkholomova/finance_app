import 'package:finance_app/models/data.dart';
import 'package:finance_app/models/streamBuilder_sum_per_day.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class RadialGauge extends StatelessWidget {
  const RadialGauge({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    addNote(0);
    print("GGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG");

    return SfRadialGauge(
      axes: [
        RadialAxis(
          ranges: [
            GaugeRange(startValue: 0, endValue: 400, color: Color.fromRGBO(255, 198, 115, 1), startWidth: sumCurrentTransactions<= 400? 10: sumCurrentTransactions>400 &&sumCurrentTransactions<=800?5:10, endWidth: sumCurrentTransactions<= 400? 10:sumCurrentTransactions>400 &&sumCurrentTransactions<=800?10:5,),
            GaugeRange(startValue: 400, endValue: 800, color: Color.fromRGBO(255, 174, 55, 1), startWidth: sumCurrentTransactions<= 400? 10: sumCurrentTransactions<=800&&sumCurrentTransactions>=400?10:5, endWidth: sumCurrentTransactions<= 400? 5: sumCurrentTransactions<=800&&sumCurrentTransactions>=400?10:10,),
            GaugeRange(startValue: 800, endValue: 1200, color: Color.fromRGBO(250, 149, 0, 1), startWidth: sumCurrentTransactions<= 400? 5: sumCurrentTransactions<=800&&sumCurrentTransactions>=400?10:sumCurrentTransactions<=1200&&sumCurrentTransactions>=800?10:5, endWidth: sumCurrentTransactions<= 400? 10: sumCurrentTransactions<=800&&sumCurrentTransactions>=400?5:10,)
          ],
          pointers: <GaugePointer>[
            MarkerPointer(
              value: sumCurrentTransactions,
            color: Colors.white,
            elevation: 3,
            markerOffset: -2,
            markerHeight: 15,
            // gradient: SweepGradient(
            //   colors: [
            //     Colors.green, Colors.yellowAccent, Colors.redAccent
            //   ]
            // ),
            )],
          // annotations: <GaugeAnnotation>[
          //   GaugeAnnotation(widget:
          //   // Container(child:
          //   // Text("$sumCurrentTransactions",style: TextStyle(fontSize: 20, color: Colors.orangeAccent))
          //   // // StreamBuilderSumPerDay()
          //   // ),
          //       angle: 90, positionFactor: 0.1
          //   )],
          canScaleToFit: true,
          startAngle: 180,
          endAngle: 180,
          showLabels: false,
          showTicks: false,
          minimum: 0,
          maximum: 1200,
          interval: 10,
          radiusFactor: 0.26,
          axisLineStyle: const AxisLineStyle(
            thickness: 0.2,
            color: Colors.purple,
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
    );
  }
}
