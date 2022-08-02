import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class RadialGauge extends StatelessWidget {
  const RadialGauge({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
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
    );
  }
}