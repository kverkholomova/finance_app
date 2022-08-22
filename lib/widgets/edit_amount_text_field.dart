import 'package:advance_text_field/advance_text_field.dart';
import 'package:flutter/material.dart';

import '../screens/change_transaction.dart';

class AdvanceTextFieldEditTransaction extends StatelessWidget {
  final String? textToChange;
  AdvanceTextFieldEditTransaction({
    Key? key, required this.textToChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context)
              .size
              .height *
              0.03),
      child: SizedBox(
        width: double.infinity,
        child: AdvanceTextField(
          height: 55,
          type: AdvanceTextFieldType.EDIT,
          editLabel: const Icon(
            Icons.edit,
            color: Colors.white,
          ),
          saveLabel: const Icon(
            Icons.check,
            color: Colors.white,
          ),
          text:textToChange,
          textStyle: const TextStyle(
            fontSize: 19,
          ),
          backgroundColor: Colors.orangeAccent,
          onEditTap: () {},
          onSaveTap: (text) async {
            transferAmountNew =
                double.parse(text);
            amount = true;
          },
        ),
      ),
    );
  }
}
