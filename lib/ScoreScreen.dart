import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/QuizProvider.dart';
import 'package:quiz_app/QuizScreen.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int totalScore = Provider.of<QuizProvider>(context).totalScore;
    int listLength = Provider.of<QuizProvider>(context).listLength;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 23, 41),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      totalScore > 0 ? "Congratulations!!" : "",
                      style: GoogleFonts.gabriela(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      totalScore > 0 ? "Victory" : "",
                      style: GoogleFonts.gabriela(
                          fontSize: 35,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    Container(
                        height: 300,
                        width: 200,
                        child: Image.asset(totalScore > 0
                            ? 'assets/trophy.webp'
                            : 'assets/opps.webp')),
                    Text(
                      "Your Score",
                      style: GoogleFonts.gabriela(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "$totalScore / $listLength",
                      style: GoogleFonts.gabriela(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(Colors.orange)),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) {
                            return const QuizScreen();
                          },
                        ));
                      },
                      child: Row(
                        children: [
                          Text(
                            "Start Again ",
                            style: GoogleFonts.gabriela(
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          const Icon(
                            Icons.restart_alt,
                            color: Colors.white,
                            size: 27,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
