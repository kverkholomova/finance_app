import 'package:flutter/material.dart';

class TopWidgetTransaction extends StatelessWidget {
  const TopWidgetTransaction({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.55),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.4,
        color: Colors.purple,
      ),
    );
  }
}