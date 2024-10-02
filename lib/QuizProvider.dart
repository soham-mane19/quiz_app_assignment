import 'package:flutter/material.dart';

class QuizProvider extends ChangeNotifier{
   int totalScore = 0;
   int listLength = 0;


   void setvalue(int totalScore,int listLength){
     this.totalScore = totalScore;
     this.listLength = listLength;
notifyListeners();
   }



  
  }