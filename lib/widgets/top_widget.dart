import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/histogram.dart';
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
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "125.71 PLN",
                  style: GoogleFonts.raleway(
                    fontSize: 25,
                    color: Colors.white,
                    // fontWeight: FontWeight.bold
                  )
                  // TextStyle(
                  //     color: Colors.white,
                  //     fontWeight: FontWeight.bold,
                  //     fontSize: 25),
                ),
              ),
            ),
            const FittedBox(
                fit: BoxFit.fitHeight,
                child: RadialGauge()),

            Positioned(
              left: MediaQuery.of(context).size.width * 0.0,
              right: MediaQuery.of(context).size.width * 0.0,
              top: MediaQuery.of(context).size.height * 0.36,
              bottom: MediaQuery.of(context).size.height * 0.03,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Histogram(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

