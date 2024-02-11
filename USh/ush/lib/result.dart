import 'package:flutter/material.dart';

class Result extends StatefulWidget{
  const Result({super.key});
  @override

  State<StatefulWidget> createState() => ResultState();
}
class ResultState extends State<Result>{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(title: const Text("Forcast Result"),),
    body: Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(child: Text(TimeOfDay.now().toString()),),
          SizedBox(child: Text("Traffic is Congested || Traffic is Free"),)
        ],
      ),),
   );
  }
}