import 'package:flutter/material.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/results_screen.dart';

class Quiz extends StatefulWidget { // main widget that manages the quiz
  const Quiz({super.key});

  @override
  State<Quiz> createState(){
    return _QuizState();
  }
}
// a private class only connected to Quiz
class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = "start-screen";
  // init active screen to null then set to start screen

  void switchScreen(){
    setState(() {
      activeScreen = "questions-screen";
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    // update screen  and empty list when user finishes questions
    if(selectedAnswers.length == questions.length){
      setState(() {
        activeScreen = "results-screen";
      });
    }
  }
  // empty selected answers list and go back to start of quiz
  void restartQuiz(){
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  @override 
  Widget build(context){
    Widget screenWidget = StartScreen(switchScreen);

    if(activeScreen == "questions-screen"){
      // pass function to quiz screen
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    }

    if(activeScreen == "results-screen") {
      // pass function to results screen
      screenWidget = ResultsScreen(chosenAnswers: selectedAnswers, restartQuiz);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: const [Colors.deepPurple, Colors.deepPurpleAccent],
                begin: Alignment.topCenter,
                end : Alignment.bottomCenter
                ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}