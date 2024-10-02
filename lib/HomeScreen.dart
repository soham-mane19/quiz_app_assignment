
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/QuizScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
  
      body: Stack(
        children: [
         Container(
          height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
             Color.fromARGB(255, 2, 23, 41),
              Color.fromARGB(255, 2, 23, 41),
              Color.fromARGB(255, 2, 23, 41),
             Colors.pink,
             

          ],
           begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )
        ),
         ),
        Positioned(
          top: 150,
          left: 130,
          child: Container(
            height:300,
            width: 170,
            decoration:const  BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/finaliconhome.png'),fit: BoxFit.cover)
            ),
        
        )
        ),
       
        
        
         Positioned(
          top: 600,
           left: 70,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor:const  WidgetStatePropertyAll(Colors.orange),
              minimumSize:const WidgetStatePropertyAll(Size(250, 70)),
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),side:const BorderSide(color: Colors.black)))
            ),
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const QuizScreen();
              },));
            },
           child:  Text("Start Quiz",style:GoogleFonts.gabarito(fontSize: 30,fontWeight: FontWeight.w700,color: Colors.white)),),
         )
        ],
      ),
    );
  }
}