// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:ush/splash.dart';

class Result extends StatefulWidget {
  Result({super.key, required this.selectedTime});
  TimeOfDay selectedTime;

  @override
  State<StatefulWidget> createState() => ResultState();
}

class ResultState extends State<Result> {
  bool isFree = true;
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
      content = Text("Traffic is Free",
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(fontWeight: FontWeight.w800, color: Colors.blue));
      isFree = true;
    } else if (isAfter(widget.selectedTime, tred11) &&
        isBefore(widget.selectedTime, tred12)) {
      content = Text("Traffic is Congested",
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(fontWeight: FontWeight.w800, color: Colors.red));
      isFree = false;
    } else if (isBefore(widget.selectedTime, tred21) &&
        isBefore(widget.selectedTime, tred22)) {
      content = Text("Traffic is Free",
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(fontWeight: FontWeight.w800, color: Colors.blue));
      isFree = true;
    } else if (isAfter(widget.selectedTime, tred21) &&
        isBefore(widget.selectedTime, tred22)) {
      content = Text("Traffic is Congested",
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(fontWeight: FontWeight.w800, color: Colors.red));
      isFree = false;
    } else if (isBefore(widget.selectedTime, tred31) &&
        isBefore(widget.selectedTime, tred32)) {
      content = Text("Traffic is Free",
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(fontWeight: FontWeight.w800, color: Colors.blue));
      isFree = true;
    } else if (isAfter(widget.selectedTime, tred31) &&
        isBefore(widget.selectedTime, tred32)) {
      content = Text("Traffic is Congested",
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(fontWeight: FontWeight.w800, color: Colors.red));
      isFree = false;
    } else {
      content = Text("Traffic is Free",
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(fontWeight: FontWeight.w800, color: Colors.blue));
      isFree = true;
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
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            SizedBox(
              child: Image.asset(
                isFree ? "asset/images/free.jpg" : "asset/images/jam.jpg",
                height: MediaQuery.of(context).size.height * 0.45,
                width: MediaQuery.of(context).size.height * 0.6,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            SizedBox(
              child: content,
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => SplashScreen()));
                    },
                    child: const Icon(Icons.repeat)),
              ),
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
