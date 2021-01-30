import 'package:flutter/material.dart';
import 'package:grocery/shared/horizontal_time_picker.dart';

class TimeSlot extends StatefulWidget {
  List<dynamic> slot;
  TimeSlot({this.slot});

  @override
  _TimeSlotState createState() => _TimeSlotState();
}

class _TimeSlotState extends State<TimeSlot> {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      child : HorizontalTimePicker(
          key: UniqueKey(),
          startTimeInHour: 6,
          endTimeInHour: 13,
          timeIntervalInMinutes: 30,
          onTimeSelected: (dateTime) {
            print(dateTime);
          },
          //timeslot:widget.slot ?? [],
          dateForTime: DateTime.now(),
          selectedTimeTextStyle: TextStyle(
            color: Colors.white,
            fontFamily: "Helvetica Neue",
            fontWeight: FontWeight.w300,
            fontSize: 16,
            height: 1.0,
          ),
          timeTextStyle: TextStyle(
            color: Colors.black,
            fontFamily: "Helvetica Neue",
            fontWeight: FontWeight.w300,
            fontSize: 16,
            height: 1.0,
          ),
          defaultDecoration: const BoxDecoration(
            color: Colors.white,
            border: Border.fromBorderSide(BorderSide(
              color: Color.fromARGB(255, 151, 151, 151),
              width: 1,
              style: BorderStyle.solid,
            )),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          selectedDecoration: const BoxDecoration(
            color: Colors.black,
            border: Border.fromBorderSide(BorderSide(
              color: Color.fromARGB(255, 151, 151, 151),
              width: 1,
              style: BorderStyle.solid,
            )),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          disabledDecoration: const BoxDecoration(
            color: Colors.black26,
            border: Border.fromBorderSide(BorderSide(
              color: Color.fromARGB(255, 151, 151, 151),
              width: 1,
              style: BorderStyle.solid,
            )),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          showDisabled: true,
        )
      );
  }
}


