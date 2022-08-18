import 'package:finance_app/constants.dart';
import 'package:finance_app/screens/add_transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';



/// The hove page which hosts the calendar
class Calendar extends StatefulWidget {
  /// Creates the home page to display teh calendar widget.
  const Calendar({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {

  final CalendarController _controller = CalendarController();
  String _text = '';

  void selectionChanged(CalendarSelectionDetails details) {
    if (_controller.view == CalendarView.month ||
        _controller.view == CalendarView.timelineMonth) {
      _text = DateFormat('dd, MMMM yyyy').format(details.date!).toString();
    } else {
      _text =
          DateFormat('dd, MMMM yyyy').format(details.date!).toString();
    }
    setState(() {
      transactionDate = _text;
    });

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Container(
                child: const Text("Transaction date")),
            content:
            Text(_text),
            actions: <Widget>[
             TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Close')),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AddTransaction()),
                    );
                  },
                  child: const Text('Ok'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SfCalendar(

          onSelectionChanged: selectionChanged,
          appointmentTextStyle: const TextStyle(
            color: Colors.orangeAccent
          ),

          viewHeaderStyle: const ViewHeaderStyle(
            dateTextStyle: TextStyle(
              color: Colors.orangeAccent
            ),
            dayTextStyle: TextStyle(
              color: Colors.orangeAccent,

            ),
            backgroundColor: Colors.purple
          ),
          viewNavigationMode: ViewNavigationMode.none,
          showCurrentTimeIndicator: false,
          allowViewNavigation: false,
          showDatePickerButton: true,
          maxDate: DateTime.now(),
          selectionDecoration: BoxDecoration(
            color: Colors.transparent,
            border:
            Border.all(color: Colors.orangeAccent,
                width: 2),
            // borderRadius: const BorderRadius.all(Radius.circular(4)),
            shape: BoxShape.rectangle,
          ),
          firstDayOfWeek: 1,
          todayTextStyle: const TextStyle(
            color: Colors.black
          ),
          headerStyle: CalendarHeaderStyle(
            textStyle: headStyle,
            backgroundColor: Colors.purple,

          ),
          blackoutDatesTextStyle: const TextStyle(
            color: Colors.orangeAccent
          ),

          headerHeight: 150,
          todayHighlightColor: Colors.orangeAccent,
          cellBorderColor: Colors.orangeAccent,
          view: CalendarView.month,
          // dataSource: MeetingDataSource(_getDataSource()),
          // monthViewSettings: const MonthViewSettings(
          //     appointmentDisplayMode: MonthAppointmentDisplayMode.indicator),
        ));
  }

  // List<Meeting> _getDataSource() {
  //   final List<Meeting> meetings = <Meeting>[];
  //   final DateTime today = DateTime.now();
  //   final DateTime startTime = DateTime(today.year, today.month, today.day, 9);
  //   final DateTime endTime = startTime.add(const Duration(hours: 2));
  //   meetings.add(Meeting(
  //       'Conference', startTime, endTime, const Color(0xFF0F8644), false));
  //   return meetings;
  // }
}
//
// /// An object to set the appointment collection data source to calendar, which
// /// used to map the custom appointment data to the calendar appointment, and
// /// allows to add, remove or reset the appointment collection.
// class MeetingDataSource extends CalendarDataSource {
//   /// Creates a meeting data source, which used to set the appointment
//   /// collection to the calendar
//   MeetingDataSource(List<Meeting> source) {
//     appointments = source;
//   }
//
//   @override
//   DateTime getStartTime(int index) {
//     return _getMeetingData(index).from;
//   }
//
//   @override
//   DateTime getEndTime(int index) {
//     return _getMeetingData(index).to;
//   }
//
//   @override
//   String getSubject(int index) {
//     return _getMeetingData(index).eventName;
//   }
//
//   @override
//   Color getColor(int index) {
//     return _getMeetingData(index).background;
//   }
//
//   @override
//   bool isAllDay(int index) {
//     return _getMeetingData(index).isAllDay;
//   }
//
//   Meeting _getMeetingData(int index) {
//     final dynamic meeting = appointments![index];
//     late final Meeting meetingData;
//     if (meeting is Meeting) {
//       meetingData = meeting;
//     }
//
//     return meetingData;
//   }
// }
//
// /// Custom business object class which contains properties to hold the detailed
// /// information about the event data which will be rendered in calendar.
// class Meeting {
//   /// Creates a meeting class with required details.
//   Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);
//
//   /// Event name which is equivalent to subject property of [Appointment].
//   String eventName;
//
//   /// From which is equivalent to start time property of [Appointment].
//   DateTime from;
//
//   /// To which is equivalent to end time property of [Appointment].
//   DateTime to;
//
//   /// Background which is equivalent to color property of [Appointment].
//   Color background;
//
//   /// IsAllDay which is equivalent to isAllDay property of [Appointment].
//   bool isAllDay;
// }