import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ush/home.dart';

// ignore: must_be_immutable
class SplashScreen extends StatefulWidget{
   SplashScreen({super.key, this.load,});
int? load;
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
void initState() {
    // TODO: implement initState
    super.initState();
     Timer(Duration(seconds: 8), 
          ()=>Navigator.pushReplacement(context, 
                                        MaterialPageRoute(builder: 
                                                          (context) =>  
                                                          Home() 
                                                         ) 
                                       ) 
         );
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: Center(child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       Text("Traffic Forecast", style: Theme.of(context).textTheme.displayMedium!.copyWith( color: Theme.of(context).colorScheme.primaryContainer, fontWeight: FontWeight.w800),),
      const SizedBox(height: 40),
      Image.asset(
  "asset/images/rocket.gif",
  height: 125.0,
  width: 125.0,
),
const Text("...loading"),],),),
  );
  }
}