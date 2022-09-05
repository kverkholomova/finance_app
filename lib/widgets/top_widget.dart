import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_app/app.dart';
import 'package:finance_app/constants.dart';
import 'package:finance_app/models/streamBuilder_sum_per_day.dart';
import 'package:finance_app/screens/add_transaction.dart';
import 'package:finance_app/widgets/button_add_transaction.dart';
import 'package:finance_app/services/wrapper.dart';
import 'package:finance_app/widgets/streamBuilder_transactions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../models/data.dart';
import '../models/histogram.dart';
import '../models/radial_gauge.dart';
import '../screens/home_screen.dart';
import '../services/auth.dart';

class TopWidget extends StatefulWidget {
  const TopWidget({Key? key}) : super(key: key);

  @override
  State<TopWidget> createState() => _TopWidgetState();
}



class _TopWidgetState extends State<TopWidget> {
  final AuthService _auth = AuthService();

  @override
  void initState(){
    super.initState();
    // new Timer.periodic(Duration(seconds: 1), (timer) {
    //   setState(() {
    //     MyHomePage();
    // });
    //           });
    // Future.delayed(const Duration(milliseconds: 200), () async {
      setState(() {

        const Histogram();
        getDataHistogram();
        // sumCurrentTransactions=0;
        //
        addNote(0);
        // RadialGauge();
        print("UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU");
        print(sumCurrentTransactions);

      });


    // });

    userInput = "0.00";
    // index = index+1;
    // changeItem.add(

    // );
    // print(changeItem[index]);
  }
  @override
  Widget build(BuildContext context) {
    // getDataHistogram();
    // Histogram();
    // print("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
    // print(chartData[0]);
    // print(ChartData(x, y))
    return Scaffold(

      body: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.4),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.6,
          color: Colors.purple,
          child: Center(
            child: Stack(
              children: [
                Positioned(
                    left: MediaQuery.of(context).size.width * 0.0,
                    right: MediaQuery.of(context).size.width * 0.0,
                    bottom: MediaQuery.of(context).size.height * 0.1,
                    child: const FittedBox(fit: BoxFit.fitHeight, child: RadialGauge())),
                Positioned(
                  left: MediaQuery.of(context).size.width * 0.0,
                  right: MediaQuery.of(context).size.width * 0.0,
                  top: MediaQuery.of(context).size.height * 0.36,
                  bottom: MediaQuery.of(context).size.height * 0.03,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Histogram(),
                  ),
                ),

                StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .where('ID',
                          isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                      .snapshots(),
                  builder:
                      (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                    if (streamSnapshot.data!.docs.isEmpty) {
                      return Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.1,
                            ),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Text("0 PLN",
                                  style: titleStyle),
                            ),
                          ),
                        ],
                      );
                    } else if (streamSnapshot.data!.docs.isNotEmpty) {
                      return ListView.builder(
                          itemCount: streamSnapshot.hasData
                              ? streamSnapshot.data!.docs.length > 1
                                  ? 1
                                  : streamSnapshot.data?.docs.length
                              : 0,
                          itemBuilder: (ctx, index) {
                            // chartData[0].y = streamSnapshot.data?.docs[index]['cosmetics_summa'];
                            // chartData[1].y = streamSnapshot.data?.docs[index]['fuel_summa'];
                            // chartData[2].y = streamSnapshot.data?.docs[index]['groceries_summa'];
                            // chartData[3].y = streamSnapshot.data?.docs[index]['leisure_summa'];
                            // chartData[4].y = streamSnapshot.data?.docs[index]['health_summa'];
                                sumTransactions = double.parse(
                                "${streamSnapshot.data?.docs[index]['summa']}");
                            groceriesTransactions = double.parse(
                                "${streamSnapshot.data?.docs[index]['groceries_summa']}");
                            leisureTransactions = double.parse(
                                "${streamSnapshot.data?.docs[index]['leisure_summa']}");
                            fuelTransactions = double.parse(
                                "${streamSnapshot.data?.docs[index]['fuel_summa']}");
                            cosmeticsTransactions = double.parse(
                                "${streamSnapshot.data?.docs[index]['cosmetics_summa']}");
                            healthTransactions = double.parse(
                                "${streamSnapshot.data?.docs[index]['health_summa']}");
                            getDataHistogram();
                            // chartData.add(ChartData("Groceries", double.parse(
                            //     "${streamSnapshot.data?.docs[index]['groceries_summa']}")));
                            // chartData.add(ChartData('Leisure', double.parse(
                            //     "${streamSnapshot.data?.docs[index]['leisure_summa']}")));
                            // chartData.add(ChartData('Fuel', double.parse(
                            //     "${streamSnapshot.data?.docs[index]['fuel_summa']}")));
                            // chartData.add(ChartData('Cosmetics', double.parse(
                            //     "${streamSnapshot.data?.docs[index]['cosmetics_summa']}")));
                            // chartData.add(ChartData('Health', double.parse(
                            //     "${streamSnapshot.data?.docs[index]['health_summa']}")));

                            // print(chartData);

                            if (streamSnapshot.hasData) {
                              switch (streamSnapshot.connectionState) {
                                case ConnectionState.waiting:
                                  return Padding(
                                    padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          0.0,
                                    ),
                                    child: Align(
                                      alignment: Alignment.topCenter,
                                      child: Text("0 PLN",
                                          style: titleStyle),
                                    ),
                                  );

                                case ConnectionState.active:
                                  return Padding(
                                    padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width*0.3,
                                      top: MediaQuery.of(context).size.width*0.05,
                                    ),
                                    child: Text(
                                        '${streamSnapshot.data?.docs[index]['summa']} PLN',
                                        style: titleStyle),
                                  );

                                case ConnectionState.none:

                                case ConnectionState.done:

                              }
                            }
                            return Padding(
                              padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.1,
                                // bottom: MediaQuery.of(context).size.height * 0.01
                              ),
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Text("0 PLN",
                                    style: titleStyle),
                              ),
                            );
                          });
                    }
                    return Container();
                  },
                ),

                Padding(
                  padding: EdgeInsets.only(top:MediaQuery.of(context).size.width*0.09, left: MediaQuery.of(context).size.width*0.85,),
                  child: IconButton(
                    icon: const Icon(
                      Icons.logout,
                      color: Colors.orangeAccent,
                      size: 30,
                    ),
                    onPressed: () async {
                      setState(() async {
                        await _auth.signOut();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Wrapper()),
                        );
                      });
                    },
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
