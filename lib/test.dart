import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  final String lessonTitle;

  const TestPage({super.key, required this.lessonTitle});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  int currentQuestion = 0;
  int score = 0;
  bool isAnswered = false;
  String? selectedAnswer;

  final List<Map<String, dynamic>> questions = [
    {
      'question': 'Қазіргі шақты білдіретін сөйлемді таңда:',
      'answers': [
        {'text': 'Мен мектепке барамын.', 'isCorrect': true},
        {'text': 'Мен кеше бардым.', 'isCorrect': false},
        {'text': 'Мен ертең барармын.', 'isCorrect': false},
      ],
    },
    {
      'question': 'Жедел өткен шақ қайсы?',
      'answers': [
        {'text': 'Мен барып жатырмын.', 'isCorrect': false},
        {'text': 'Мен бардым.', 'isCorrect': true},
        {'text': 'Мен баратынмын.', 'isCorrect': false},
      ],
    },
    {
      'question': 'Келер шақтың мысалы:',
      'answers': [
        {'text': 'Мен жаздым.', 'isCorrect': false},
        {'text': 'Мен оқып отырмын.', 'isCorrect': false},
        {'text': 'Мен барамын.', 'isCorrect': true},
      ],
    },
  ];

  void checkAnswer(bool isCorrect, String answer) {
    if (isAnswered) return;
    setState(() {
      isAnswered = true;
      selectedAnswer = answer;
      if (isCorrect) score++;
    });

    Future.delayed(const Duration(seconds: 1), () {
      if (currentQuestion < questions.length - 1) {
        setState(() {
          currentQuestion++;
          isAnswered = false;
          selectedAnswer = null;
        });
      } else {
        _showResultDialog();
      }
    });
  }

  void _showResultDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        title: const Text('Нәтиже'),
        content: Text('Сен ${questions.length}-тің $score сұрағына дұрыс жауап бердің!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text('Аяқтау'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final current = questions[currentQuestion];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.lessonTitle} тесті',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF4DB6AC),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Сұрақ ${currentQuestion + 1}/${questions.length}',
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 15),
            Text(
              current['question'],
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            ...current['answers'].map<Widget>((answer) {
              final bool isSelected = selectedAnswer == answer['text'];
              final bool isCorrect = answer['isCorrect'];
              Color color = Colors.white;
              if (isAnswered && isSelected) {
                color = isCorrect ? Colors.green.shade100 : Colors.red.shade100;
              }
              return GestureDetector(
                onTap: () => checkAnswer(isCorrect, answer['text']),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: isAnswered && isSelected
                          ? (isCorrect ? Colors.green : Colors.red)
                          : Colors.grey.shade300,
                      width: 2,
                    ),
                  ),
                  child: Text(
                    answer['text'],
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
