import 'package:finance_app/widgets/streamBuilder_transactions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../screens/history_screen.dart';

var userId;

class BottomWidget extends StatelessWidget {
  const BottomWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.6,
      ),
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            color: Colors.white,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            color: Colors.white,
            child: const StreamBuilderTransactions(limitedLength: true),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02,
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const History()),
                      );
                    },
                    child: Text("History",
                        style: GoogleFonts.raleway(
                          fontSize: 22,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.left),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
