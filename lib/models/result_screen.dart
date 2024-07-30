import 'package:flutter/material.dart';
import 'package:quizz_app/data/questions.dart';
import 'package:quizz_app/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.chosenAnswers,
    required this.restartQuiz,
  });

  //restartQuiz, Quiz'i yeniden başlatma fonksiyonu olarak tanımlandı.
  final void Function() restartQuiz;
  // chosenAnswers kullanıcın seçtiği cevapların listesi.
  final List<String> chosenAnswers;

// summaryData , kullanıcı cevapları ve doğru cevapları içeren bir liste oluşturur.
  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i]
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    //toplam soru sayısını ve doğru ceavp sayısını hesaplar.
    int numTotalQuestions = questions.length;
    int numCorrectQuestions = summaryData
        .where(
          (data) => data['user_answer'] == data['correct_answer'],
        )
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),

            //cevap özetini gösterir.
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),

            //yeniden başlatma butonu.
            TextButton(
              onPressed: () {
                restartQuiz();
              },
              child: const Text('Restart Quiz!'),
            ),
          ],
        ),
      ),
    );
  }
}
