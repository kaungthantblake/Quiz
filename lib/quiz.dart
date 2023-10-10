import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/questions_screen.dart';
import 'package:quiz/results_screen.dart';
import 'package:quiz/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];

  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        // selectedAnswers = [];
        activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  void exitQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(contex) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
  screenWidget = QuestionsScreen(
    onSelectAnswer: chooseAnswer,
  );
}  if (activeScreen == 'results-screen') {
  screenWidget = ResultsScreen(
    chosenAnswers: selectedAnswers,
    onRestart: restartQuiz,
    onExit: exitQuiz,
  );
}


    // final screenWidget = activeScreen == 'start-screen'
    // ? StartScreen(switchScreen,)
    // : QuestionsScreen();

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 85, 9, 151),
                Color.fromARGB(255, 2, 0, 12)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,

          // child: screenWidget,

          //ternary Operator
          // child: activeScreen == 'start-screen'
          // ? StartScreen(switchScreen)
          // : const QuestionsScreen(),
        ),
      ),
    );
  }
}
