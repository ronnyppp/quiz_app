import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});
  // function that takes arg for onselectanswer
  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    // pass answer to parent widget
    widget.onSelectAnswer(selectedAnswer);
    // calls build method every time we call function so we update the ui
    setState(() {
      currQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currQuestionIndex];
    return SizedBox(
      // this tells dart to take up as much width as possible on screen
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          // vertical alignment
          mainAxisAlignment: MainAxisAlignment.center,
          // horizontal alignment
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 231, 225, 225),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              // center text
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            // spread list into indiv vals to put in col
            ...currentQuestion.shuffledAnswers.map((answer) {
              return AnswerButton(
                answerText: answer,
               onTap: () {
                answerQuestion(answer);
               }
               );
            })
          ],
        ),
      ),
    );
  }
}
