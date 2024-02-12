// import 'dart:html';

import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  Result({super.key, required this.selectedTime});
  TimeOfDay selectedTime;

  @override
  State<StatefulWidget> createState() => ResultState();
}

class ResultState extends State<Result> {
  String res = "";
  TimeOfDay tred11 = TimeOfDay(hour: 9, minute: 00);
  TimeOfDay tred12 = TimeOfDay(hour: 12, minute: 00);
  TimeOfDay tred21 = TimeOfDay(hour: 14, minute: 00);
  TimeOfDay tred22 = TimeOfDay(hour: 15, minute: 00);
  TimeOfDay tred31 = TimeOfDay(hour: 18, minute: 00);
  TimeOfDay tred32 = TimeOfDay(hour: 21, minute: 00);

  Widget content = Center();

  @override
  Widget build(BuildContext context) {
    // if (widget.selectedTime.hour < const  ||)
    //     widget.selectedTime < const TimeOfDay(hour: 12, minute: 00)) {

    //     }
    if (isBefore(widget.selectedTime, tred11) &&
        isBefore(widget.selectedTime, tred12)) {
      content = const Text("Traffic is Free");
    } else if (isAfter(widget.selectedTime, tred11) &&
        isBefore(widget.selectedTime, tred12)) {
      content = const Text("Traffic is Congested");
    } else if (isBefore(widget.selectedTime, tred21) &&
        isBefore(widget.selectedTime, tred22)) {
      content = const Text("Traffic is Free");
    } else if (isAfter(widget.selectedTime, tred11) &&
        isBefore(widget.selectedTime, tred12)) {
      content = const Text("Traffic is Congested");
    } else if (isBefore(widget.selectedTime, tred31) &&
        isBefore(widget.selectedTime, tred32)) {
      content = const Text("Traffic is Free");
    } else if (isAfter(widget.selectedTime, tred11) &&
        isBefore(widget.selectedTime, tred12)) {
      content = const Text("Traffic is Congested");
    } else {
      content = const Text("Traffic is Congested");
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Forcast Result"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              child: Text(TimeOfDay.now().toString()),
            ),
            SizedBox(
              child: content,
            )
          ],
        ),
      ),
    );
  }

  bool isBefore(TimeOfDay time1, TimeOfDay time2) {
    return time1.hour < time2.hour ||
        (time1.hour == time1.hour && time1.minute < time2.minute);
  }

  bool isAfter(TimeOfDay time1, TimeOfDay time2) {
    return time1.hour > time2.hour ||
        (time1.hour == time1.hour && time1.minute > time2.minute);
  }
}
