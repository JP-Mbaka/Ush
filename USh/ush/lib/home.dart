import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  
  const Home({super.key});
  @override
  State<Home> createState () => HomeState();
}

class HomeState extends State<Home>{
  
TimeOfDay _selectedTime = TimeOfDay.now();

// Future<TimeOfDay> _selectTime() async {
  


  @override
  Widget build(BuildContext context) {
    Future<TimeOfDay?> selectedTime = showTimePicker(
  initialTime: TimeOfDay.now(),
  context: context,
).then((value) {
  if(value == null){
return;
  }
  setState(() {
    _selectedTime == value;
  });
});



   return Scaffold(
    appBar: AppBar(title: const Text("Traffic Forecast Management"),),
    body: Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: Column(children: [
        SizedBox(child: Center(child: TextButton(child: const Text("Use current Time"), onPressed: (){},),),),
        SizedBox(child: Center(child: TextButton(onPressed: (){selectedTime;},child: const Text("Set Time"),),),)
      ],),
    ),
    floatingActionButton: FloatingActionButton(onPressed: (){
      if( _selectedTime == TimeOfDay.now()){
        return;
      }
      //We call the URL model and send response
    }, child: const Icon(Icons.login),),
   );
  }
}