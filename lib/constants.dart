import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var textInputDecoration=InputDecoration(
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: const BorderSide(
            color: Colors.orangeAccent, width: 3),
    ),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: const BorderSide(
            color: Colors.orangeAccent,
            width: 3,
        ),
    ),
    filled: true,
    fillColor: Colors.white,

);

TextStyle titleStyle = GoogleFonts.raleway(
    fontSize: 25,
    color: Colors.white,
);

TextStyle headStyle = GoogleFonts.raleway(
    fontSize: 25,
    color: Colors.orangeAccent,
);

Icon closeIcon = Icon(
    Icons.close,
    color: Colors.orange,
);