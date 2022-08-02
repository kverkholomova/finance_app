import 'package:flutter/material.dart';

class BottomWidget extends StatelessWidget {
  const BottomWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.6),
      child: Container(
        height: MediaQuery.of(context).size.height*0.4,
        color: Colors.white,
      ),
    );
  }
}