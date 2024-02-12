import 'package:flutter/material.dart';
import 'package:ush/result.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  TimeOfDay _selectedTime = TimeOfDay.now();
  bool clickedCustom = false;
  bool clickedCurr = false;

  Future<TimeOfDay?> selectedTime(context) async {
    TimeOfDay? g = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );

    setState(() {
      _selectedTime = g ?? TimeOfDay.now();
      clickedCustom = true;
      clickedCurr = false;
    });
    return g;
  }

  loadTraffic({currTime}) {
    if (_selectedTime == TimeOfDay.now()) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => Result(selectedTime: currTime)));
    }
    if (currTime == null) {
      print("not working");
    }
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => Result(selectedTime: _selectedTime)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Traffic Forecast Management"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        // decoration: BoxDecoration(border: Border.all(color: Colors.green, width: 10.0)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                    border: Border.all(
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                        width: 0.5)),
                child: Center(
                  child: clickedCurr
                      ? Text(
                          TimeOfDay.now().format(context).toString(),
                          style: Theme.of(context).textTheme.displayMedium,
                        )
                      : TextButton(
                          child: const Text("Use current Time"),
                          onPressed: () {
                            setState(() {
                              clickedCurr = true;
                              clickedCustom = false;
                            });
                          },
                        ),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                    border: Border.all(
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                        width: 0.5)),
                child: Center(
                  child: !clickedCustom
                      ? TextButton(
                          onPressed: () {
                            selectedTime(context);
                          },
                          child: const Text("Set Time"),
                        )
                      : Text(
                          _selectedTime.format(context).toString(),
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_selectedTime != TimeOfDay.now()) {
            loadTraffic(currTime: TimeOfDay.now());
          } else {
            loadTraffic();
          }
        },
        child: const Icon(Icons.login),
      ),
    );
  }
}
