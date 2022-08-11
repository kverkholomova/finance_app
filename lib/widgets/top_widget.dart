import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/histogram.dart';
import '../models/labels.dart';
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

            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('transactions')
              // .where('Id', isEqualTo: Id_Of_current_application)
              //     .where('title', isEqualTo: card_title_accepted)
              //     .where('category', isEqualTo: card_category_accepted)
              //     .where('comment', isEqualTo: card_comment_accepted)
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {

                if (streamSnapshot.data!.docs.isEmpty){
                  return Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.1,
                      // bottom: MediaQuery.of(context).size.height * 0.01
                    ),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                          "0 PLN",
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
                  );
                }
                else if(streamSnapshot.data!.docs.isNotEmpty){
                  return ListView.builder(
                      itemCount: streamSnapshot.hasData ? streamSnapshot.data!.docs.length>1?1:streamSnapshot.data?.docs.length : 0,
                      // : streamSnapshot.data?.docs.length,
                      itemBuilder: (ctx, index) {
                        if (streamSnapshot.hasData) {
                          switch (streamSnapshot.connectionState) {
                            case ConnectionState.waiting:
                              return Padding(
                                padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height * 0.0,
                                  // bottom: MediaQuery.of(context).size.height * 0.01
                                ),
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                      "0 PLN",
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
                              );

                            case ConnectionState.active:
                              return Padding(
                                padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height * 0.05,
                                  // bottom: MediaQuery.of(context).size.height * 0.01
                                ),
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                      '${streamSnapshot.data
                                          ?.docs[index]["summa"]} PLN',
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
                              );


                            case ConnectionState.none:

                            case ConnectionState.done:
                            // TODO: Handle this case.
                              break;
                          }
                        }
                        // else if (!streamSnapshot.hasData) {
                        //   return Center(
                        //     child: Padding(
                        //       padding: const EdgeInsets.only(top: 100),
                        //       child: Column(
                        //         children: const [
                        //           SpinKitChasingDots(
                        //             color: Colors.orangeAccent,
                        //             size: 50.0,
                        //           ),
                        //           Align(
                        //             alignment: Alignment.center,
                        //             child:
                        //             Text("There is still no transfers...",
                        //                 style: TextStyle(
                        //                   fontWeight: FontWeight.bold,
                        //                   fontSize: 24,
                        //                   color: Colors.black,
                        //                 )),
                        //           ),
                        //           Padding(
                        //             padding: EdgeInsets.only(top: 20),
                        //           )
                        //         ],
                        //       ),
                        //     ),
                        //   );
                        // }
                        return Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.1,
                            // bottom: MediaQuery.of(context).size.height * 0.01
                          ),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                                "0 PLN",
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
                        );
                      });
                }
                return Container();
              },
            ),
            // Padding(
            //   padding: EdgeInsets.only(
            //       top: MediaQuery.of(context).size.height * 0.1,
            //       // bottom: MediaQuery.of(context).size.height * 0.01
            //   ),
            //   child: Align(
            //     alignment: Alignment.topCenter,
            //     child: Text(
            //       "125.71 PLN",
            //       style: GoogleFonts.raleway(
            //         fontSize: 25,
            //         color: Colors.white,
            //         // fontWeight: FontWeight.bold
            //       )
            //       // TextStyle(
            //       //     color: Colors.white,
            //       //     fontWeight: FontWeight.bold,
            //       //     fontSize: 25),
            //     ),
            //   ),
            // ),
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

