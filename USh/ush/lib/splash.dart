import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ush/home.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key, required int seconds, required navigateAfterSeconds, required Text title});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
void initState() {
    // TODO: implement initState
    super.initState();
     Timer(Duration(seconds: 3), 
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
    body: Center(child: Text("Icon that dances"),),
  );
  }
}