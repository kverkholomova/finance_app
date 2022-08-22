import 'package:advance_text_field/advance_text_field.dart';
import 'package:flutter/material.dart';

import '../screens/calendar_edit.dart';
import '../screens/change_transaction.dart';

class AdvanceTextFieldChangeDate extends StatelessWidget {
  final String? dateToChange;
  AdvanceTextFieldChangeDate({
    Key? key, required this.dateToChange
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdvanceTextField(
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
      text: dateTime == ''
          ? dateToChange
          : dateTime,
      textStyle: const TextStyle(
        fontSize: 19,
      ),
      backgroundColor: Colors.orangeAccent,
      onEditTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                const CalendarEdit()));
      },
      onSaveTap: (text) async {},
    );
  }
}

