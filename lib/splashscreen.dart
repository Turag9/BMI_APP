import 'dart:async';

import 'package:flutter/material.dart';

import 'homepage.dart';
class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  StarTimer() async{
    Timer(Duration(seconds: 5),(){
      Navigator.push(context,MaterialPageRoute(builder: (context)=>Homepage()));
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    StarTimer();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          child: Column(
            children: [
              Image.asset("assets/images/logo.jpg",height: 200,width: 200,),
              SizedBox(height: 10,),
              CircularProgressIndicator(color: Colors.redAccent,)
            ],
          ),
        ),
      ),
    );
  }
}
