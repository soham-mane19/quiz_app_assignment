import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/QuizProvider.dart';
import 'package:quiz_app/ScoreScreen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int questionNO = 0;
  int correctAns = 0;
  bool isAnswered = false;
  int selectedAnswerIndex = -1;
  List<Map> questionList = [
    {
      "Question": "Who composed the iconic song Vande Mataram ?",
      "options": [
        'Rabindranath Tagore',
        'Bankim Chandra Chatterjee',
        'A.R. Rahman',
        'M.S. Subbulakshmi'
      ],
      'answerindex': 0,
    },
    {
      "Question":
          "Who is the music composer for the film Slumdog Millionaire that won an Academy Award for Best Original Score ?",
      "options": ['Anu Malik', 'A.R. Rahman', 'Vishal Bhardwaj', 'Ilaiyaraaja'],
      'answerindex': 1,
    },
    {
      "Question": "What is the national instrument of India?",
      "options": ['Veena', 'Sitar', 'Tabla', 'Shehnai'],
      'answerindex': 1,
    },
    {
      "Question": "What genre of music is Bollywood famous for?",
      "options": ['Pop', 'Film Music', 'Jazz', 'Classical'],
      'answerindex': 3,
    },
    {
      "Question": "Which legendary singer is known for the song Lag Ja Gale ?",
      "options": [
        'Lata Mangeshkar',
        'Asha Bhosle',
        'Shreya Ghoshal',
        'Kavita Krishnamurthy'
      ],
      'answerindex': 0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 2, 23, 41),
                Color.fromARGB(255, 2, 23, 41),
                Colors.blue,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
            child: Padding(
              padding: const EdgeInsets.only(top: 40, left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${questionNO + 1} of ${questionList.length}",
                        style: GoogleFonts.gabarito(
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                  ),
                  Container(
                    height: 10,
                    width: double.infinity,
                    decoration: const BoxDecoration(),
                    child: LinearProgressIndicator(
                      borderRadius: BorderRadius.circular(20),
                      value: questionNO / questionList.length,
                      backgroundColor: Colors.black,
                      valueColor: const AlwaysStoppedAnimation(Colors.green),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Text(
                          "${questionList[questionNO]['Question']}",
                          style: GoogleFonts.gabarito(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    WidgetStatePropertyAll(checkColor(0)),
                                shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    side: const BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                minimumSize: const WidgetStatePropertyAll(
                                    Size(double.infinity, 50))),
                            onPressed: () {
                              checkans(0);
                            },
                            child: Text(
                              "${questionList[questionNO]['options'][0]}",
                              style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            )),
                        const SizedBox(
                          height: 15,
                        ),
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    WidgetStatePropertyAll(checkColor(1)),
                                shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    side: const BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                minimumSize: const WidgetStatePropertyAll(
                                    Size(double.infinity, 50))),
                            onPressed: () {
                              checkans(1);
                            },
                            child: Text(
                              "${questionList[questionNO]['options'][1]}",
                              style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            )),
                        const SizedBox(
                          height: 15,
                        ),
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    WidgetStatePropertyAll(checkColor(2)),
                                shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    side: const BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                minimumSize: const WidgetStatePropertyAll(
                                    Size(double.infinity, 50))),
                            onPressed: () {
                              checkans(2);
                            },
                            child: Text(
                              "${questionList[questionNO]['options'][2]}",
                              style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            )),
                        const SizedBox(
                          height: 15,
                        ),
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    WidgetStatePropertyAll(checkColor(3)),
                                shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    side: const BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                minimumSize: const WidgetStatePropertyAll(
                                    Size(double.infinity, 50))),
                            onPressed: () {
                              checkans(3);
                            },
                            child: Text(
                              "${questionList[questionNO]['options'][3]}",
                              style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color checkColor(int index) {
    if (!isAnswered) {
      return Colors.white;
    } else if (index == questionList[questionNO]['answerindex']) {
      return Colors.green;
    } else if (index == selectedAnswerIndex) {
      return Colors.red;
    } else {
      return Colors.white;
    }
  }

  void checkans(int index) {
    setState(() {
      isAnswered = true;
      selectedAnswerIndex = index;
    });

    if (index == questionList[questionNO]['answerindex']) {
      print("Correct answer");
      correctAns++;
    } else {
      print("Wrong answer");
    }

    Timer(const Duration(seconds: 2), () {
      setState(() {
        if (questionNO < questionList.length - 1) {
          questionNO++;
          isAnswered = false;
          selectedAnswerIndex = -1;
        } else {
          Provider.of<QuizProvider>(context, listen: false)
              .setvalue(correctAns, questionList.length);
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) {
            return const ScoreScreen();
          }));
        }
      });
    });
  }
}
