import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/HomeScreen.dart';

class Spalshscreen extends StatefulWidget {
  const Spalshscreen({super.key});

  @override
  State<Spalshscreen> createState() => _SpalshscreenState();
}

class _SpalshscreenState extends State<Spalshscreen> {
 double progressvalue=0.0;

@override
  void initState(){
    super.initState();
    starttimer();
  }
  void starttimer(){
Timer.periodic( const Duration(milliseconds:30), (timer) {
     setState(() {
       if(progressvalue<=1){
           progressvalue=progressvalue+0.01;
        }else{
          timer.cancel();
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
            return const HomeScreen();
          },));
          
        }
     });
},);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     body: Stack(
      children: [
       Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        color: const Color.fromARGB(255, 2, 23, 41),
        child: Image.asset('assets/splashScreen.jpg')),
      
      Positioned(
        top: 400,
        left: 100,
        child: Text("QuizTune",style: GoogleFonts.gabarito(fontSize: 40,fontWeight: FontWeight.w700,))),

         Positioned(
        top:200,
        left: 110,
        child: Container(
          height:350,
          width: 100,
          child: Image.asset('assets/ideaimage.webp'))),

            Positioned(
        top:700,
        left: 110,
        child: Container(
                      height: 15,
                      width: 170,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.black,width: 2)),
                      child:  LinearProgressIndicator(
                          value: progressvalue,
                          backgroundColor: Colors.black,
                          valueColor: const AlwaysStoppedAnimation(
                             Colors.white)),
                    ),
            )
      ],
      
     ),
     
    );
  }
}