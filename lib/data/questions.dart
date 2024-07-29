import 'package:quizz_app/models/quiz_questions.dart';

const questions = [
  QuizQuestions(
    'What are the main building blocks of Flutter UIs?',
    [
      'Widgets',
      'Components',
      'Blocks',
      'Functions',
    ],
  ),
  QuizQuestions(
    'How are Flutter UIs built?',
    [
      'By combining widgets in code',
      'By combining widgets in a visual editor',
      'By definig widgets in config files',
      'By using XCode for İOS and Android Studio for Android',
    ],
  ),
  QuizQuestions(
    'What\'s the purpose of a StatefulWidget?',
    [
      'Update UI as data changes',
      'Update data as UI changes',
      'Ignore data changes',
      'Render UI that does not depend on data',
    ],
  ),
  QuizQuestions(
    'Which widget should you try to use more often: StatlesWidget or StatefulWidget?',
    [
      'StatelesWidgets',
      'Stateful Widget',
      'Both are equally good',
      'None of the above',
    ],
  ),
  QuizQuestions(
    'What happens if you change data in a StatelesWidget?',
    [
      'Any nested StatefulWidgets are updated',
      'The closest StatefulWidget is updated',
      'The UI is updated',
      'Rhe UI is not updated',
    ],
  ),
  QuizQuestions(
    'How should you update data inside of StatefulWidgets?',
    [
      'by calling updateState()',
      'by calling update()',
      'by calling setState()',
      'by calling updateData()',
    ],
  ),
];
