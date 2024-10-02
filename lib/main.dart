import 'package:flutter/material.dart';
import 'package:quiz_app/QuizProvider.dart';
import 'package:quiz_app/SpalshScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {

    return 
    ChangeNotifierProvider(create: (context) {
      return QuizProvider();
    },
    child: 
    
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  Spalshscreen(),
        
    )
    );
  }
}
