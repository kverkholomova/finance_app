import 'package:flutter/material.dart';

class BottomWidgetTransaction extends StatelessWidget {
  const BottomWidgetTransaction({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.3),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.6,
        color: Colors.white,
      ),
    );
  }
}