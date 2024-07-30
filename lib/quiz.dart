import 'package:flutter/material.dart';
import 'package:quizz_app/data/questions.dart';
import 'package:quizz_app/models/result_screen.dart';
import 'package:quizz_app/questions_screen.dart';
import 'package:quizz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> _selectedAnswers = [];

  //activeScreen bulunduğumuz ekranın hangi ekranda aktif olduğunu gösterir.
  String activeScreen = 'start-screen';

// switcScreen fonksiyonu sorular sayfasını görmemizi sağlar.
  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

// restartQuizApp fonksiyonu, start-screen dönmemizi sağlar.
  void restartQuizApp() {
    setState(() {
      activeScreen = 'start-screen';
    });
  }

//chooseAnswer fonksiyonu, kullanıcının seçtiği cevabı(selectedAnswer) listeye ekler ve tüm sorular cevaplandığında result-screen'de gösterir.
  void chooseAnswer(String answer) {
    _selectedAnswers.add(answer);

    if (_selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

//restartQuiz fonksiyonu,cevaplanan soruları sıfırlar.
  void restartQuiz() {
    setState(() {
      _selectedAnswers = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    //başlangıçta gösterilmesi gereken ekranı StartScreen olarak tanımladık.
    Widget screenWidget = StartScreen(switchScreen);

// activeScreen 'question-screen' gösterir
    if (activeScreen == 'question-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    // activeScreen 'result-screen' gösterir.
    if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(
        chosenAnswers: _selectedAnswers,
        restartQuiz: () {
          restartQuizApp();
          restartQuiz();
        },
      );
    }

    return Scaffold(
      body: Container(
        // ekran UI için gradient tanımlandı.
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 192, 45, 143),
              Color.fromARGB(255, 85, 24, 71),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: screenWidget,
      ),
    );
  }
}
