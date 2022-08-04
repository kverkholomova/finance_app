import 'package:flutter/material.dart';

class BottomWidgetTransaction extends StatefulWidget {
  const BottomWidgetTransaction({Key? key}) : super(key: key);

  @override
  State<BottomWidgetTransaction> createState() => _BottomWidgetTransactionState();
}
String userInput = '0';

class _BottomWidgetTransactionState extends State<BottomWidgetTransaction> {


  String option = '';
  int index = 0;
  double second = 0;
  double first = 0;
  String number = '';
  double answerDouble = 0;
  int answerInt=0;
  double answer = 0;
  num third =0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.35),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.55,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.07),
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: buildTextButton("7"),
                        ),
                        Expanded(
                            flex: 1,
                            child: buildTextButton("8")
                        ),
                        Expanded(
                          flex: 1,
                          child: buildTextButton("9"),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: buildTextButton("4"),
                        ),
                        Expanded(
                          flex: 1,
                          child: buildTextButton("5"),
                        ),
                        Expanded(
                          flex: 1,
                          child: buildTextButton("6"),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: buildTextButton("1"),
                        ),
                        Expanded(
                          flex: 1,
                          child: buildTextButton("2"),
                        ),
                        Expanded(
                          flex: 1,
                          child: buildTextButton("3"),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: TextButton(
                              child: const Text(
                                ".",
                                style: TextStyle(
                                    fontSize: 45,
                                    color: Colors.black),
                              ),
                              onPressed: () {
                                setState(() {
                                  if (userInput == '0') {
                                    userInput = '0.';
                                  } else if (!userInput.contains("+") &&
                                      !userInput.contains("-") &&
                                      !userInput.contains("*") &&
                                      !userInput.contains("/")) {
                                    userInput = userInput + '.';
                                    // second =int.parse(userInput.substring(userInput.length-(userInput.length-index)));

                                  } else {
                                    userInput = userInput + '.';
                                    second = double.parse(userInput
                                        .substring(userInput.length -
                                        (userInput.length -
                                            index)));

                                  }
                                });
                              }),
                        ),
                        Expanded(
                          flex: 1,
                          child: buildTextButton('0'),
                        ),
                        Expanded(
                          flex: 1,
                          child: IconButton(
                              icon: Icon(Icons.backspace),
                              onPressed: () {

                              }),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  TextButton buildTextButton(String valueButton) {
    return TextButton(
        child: Text(
          valueButton,
          style: const TextStyle(
              fontSize: 30,
              color: Colors.black),
        ),
        onPressed: () {
          setState(() {
            if (userInput == '0') {
              userInput = valueButton;
            } else if(userInput.contains("sqrt(0") ) {
              userInput="sqrt("+valueButton;
              first = double.parse(userInput
                  .substring(userInput.length -
                  (userInput.length -
                      index)));
            }
            else if(userInput.contains("sin(0") ) {
              userInput="sin("+valueButton;
              first = double.parse(userInput
                  .substring(userInput.length -
                  (userInput.length -
                      index)));
            }
            else if(userInput.contains("cos(0")) {
              userInput="cos("+valueButton;
              first = double.parse(userInput
                  .substring(userInput.length -
                  (userInput.length -
                      index)));
            }
            else if(userInput.contains("tan(0")) {
              userInput="tan("+valueButton;
              first = double.parse(userInput
                  .substring(userInput.length -
                  (userInput.length -
                      index)));
            }
            else if(userInput.contains("log(0")) {
              userInput="log("+valueButton;
              first = double.parse(userInput
                  .substring(userInput.length -
                  (userInput.length -
                      index)));
            }
            else if(userInput.contains("ln(0")) {
              userInput="ln("+valueButton;
              first = double.parse(userInput
                  .substring(userInput.length -
                  (userInput.length -
                      index)));
            }
            else if(userInput.contains("!(0")) {
              userInput="!("+valueButton;
              first = double.parse(userInput
                  .substring(userInput.length -
                  (userInput.length -
                      index)));
            }
            else if(userInput.contains("0^") || userInput.contains("^0")) {
              userInput="Wrong data";
              first = double.parse(userInput
                  .substring(userInput.length -
                  (userInput.length -
                      index)));
            }
            else if (!userInput.contains("+") &&
                !userInput.contains("-") &&
                !userInput.contains("*") &&
                !userInput.contains("/") &&
                !userInput.contains("%") &&
                !userInput.contains("sqrt(") &&
                !userInput.contains("sin(") &&
                !userInput.contains("cos(") &&
                !userInput.contains("tan(") &&
                !userInput.contains("log(") &&
                !userInput.contains("ln(") &&
                !userInput.contains("!(") &&
                !userInput.contains("^")) {
              userInput = userInput + valueButton;
              // second =int.parse(userInput.substring(userInput.length-(userInput.length-index)));

            }
            // else if (!userInput.contains("sqrt(")){
            //   userInput = userInput + value_button;
            //   // second =int.parse(userInput.substring(userInput.length-(userInput.length-index)));
            //   print("second is $second");
            // }
            else {
              userInput = userInput + valueButton;
              second = double.parse(userInput
                  .substring(userInput.length -
                  (userInput.length -
                      index)));

            }
          });
        });
  }

}