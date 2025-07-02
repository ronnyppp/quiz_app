import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/quiz-logo.png',
              width: 300,
              color: const Color.fromARGB(
                  150, 255, 255, 255) // setting transparent
              ),
          const SizedBox(height: 40),
          Text("Learn Flutter the right way!",
              style: GoogleFonts.lato
              (color:  const Color.fromARGB(255, 232, 229, 229), 
              fontSize: 18),),
          const SizedBox(height: 20),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: const Icon(
              Icons.arrow_right_alt,
              color: Colors.white,
            ),
            label: Text(
              "Start Quiz!",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}
