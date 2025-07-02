import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.restartQuiz, {super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;
  final void Function() restartQuiz;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for(var i = 0; i < chosenAnswers.length; i++){
      summary.add({
        "question_index": i,
        "question": questions[i].text,
        "correct_answer": questions[i].answers[0],
        "user_answer": chosenAnswers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(context){
    final int numTotalQuestions = questions.length;
    // get length of a list of the correct user answers
    final numCorrectQuestions = summaryData.where(
      (data) => data['user_answer'] == data['correct_answer']).length;

    return SizedBox(
      // this tells dart to take up as much width as possible on screen
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!",
            style: GoogleFonts.lato
              (color:  const Color.fromARGB(255, 232, 229, 229), 
              fontSize: 25,
              fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
              ),
            const SizedBox(height: 30,),
            QuestionsSummary(summaryData),
            const SizedBox(height: 30,),
            TextButton.icon(
              // call function when button is pressed
              onPressed: restartQuiz, 
                icon: const Icon(
                  Icons.restart_alt,
                  color: Colors.white
                  ,),
                label: const Text("Restart Quiz!",
                style: TextStyle(color: Colors.white, fontSize: 18)),
            )
          ],
        ),
      ),
    );
  }
}