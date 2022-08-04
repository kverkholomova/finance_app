import 'package:flutter/material.dart';

var textInputDecoration=InputDecoration(

    fillColor: Colors.white,
    filled: true,

    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.orangeAccent, width: 3)
    ),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.orange,width: 2)
    )
);