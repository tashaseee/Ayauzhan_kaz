import 'package:flutter/material.dart';
class ListeningExercisePage extends StatefulWidget {
  const ListeningExercisePage({Key? key}) : super(key: key);

  @override
  State<ListeningExercisePage> createState() => _ListeningExercisePageState();
}

class _ListeningExercisePageState extends State<ListeningExercisePage> {
  int _selectedLevelIndex = 0;
  int _currentTaskIndex = 0;
  String? _selectedOption;
  bool _isLevelCompleted = false;

  final Map<String, List<Map<String, dynamic>>> _taskData = {
    'Бастауыш': [
      {'word': 'Алма', 'options': [{'image': 'assets/images/alma.png', 'text': 'Алма'}, {'image': 'assets/images/banan.png', 'text': 'Банан'}, {'image': 'assets/images/apelsin.png', 'text': 'Апельсин'}, {'image': 'assets/images/zhuzim.png', 'text': 'Жүзім'},], 'correctAnswer': 'Алма',},
      {'word': 'Ит', 'options': [{'image': 'assets/images/mysyq.png', 'text': 'Мысық'}, {'image': 'assets/images/it.png', 'text': 'Ит'}, {'image': 'assets/images/at.png', 'text': 'Ат'}, {'image': 'assets/images/siyr.png', 'text': 'Сиыр'},], 'correctAnswer': 'Ит',},
      {'word': 'Кітап', 'options': [{'image': 'assets/images/qalam.png', 'text': 'Қалам'}, {'image': 'assets/images/kitap.png', 'text': 'Кітап'}, {'image': 'assets/images/dapter.png', 'text': 'Дәптер'}, {'image': 'assets/images/somke.png', 'text': 'Сөмке'},], 'correctAnswer': 'Кітап',},
      {'word': 'Үй', 'options': [{'image': 'assets/images/mektep.png', 'text': 'Мектеп'}, {'image': 'assets/images/auyruhana.png', 'text': 'Аурухана'}, {'image': 'assets/images/duken.png', 'text': 'Дүкен'}, {'image': 'assets/images/uy.png', 'text': 'Үй'},], 'correctAnswer': 'Үй',},
      {'word': 'Нан', 'options': [{'image': 'assets/images/nan.png', 'text': 'Нан'}, {'image': 'assets/images/may.png', 'text': 'Май'}, {'image': 'assets/images/qant.png', 'text': 'Қант'}, {'image': 'assets/images/tuz.png', 'text': 'Тұз'},], 'correctAnswer': 'Нан',},
      {'word': 'Шай', 'options': [{'image': 'assets/images/shay.png', 'text': 'Шай'}, {'image': 'assets/images/su.png', 'text': 'Су'}, {'image': 'assets/images/sut.png', 'text': 'Сүт'}, {'image': 'assets/images/kofe.png', 'text': 'Кофе'},], 'correctAnswer': 'Шай',},
      {'word': 'Доп', 'options': [{'image': 'assets/images/mashina.png', 'text': 'Машина'}, {'image': 'assets/images/quyrshaq.png', 'text': 'Қуыршақ'}, {'image': 'assets/images/dop.png', 'text': 'Доп'}, {'image': 'assets/images/ushaq.png', 'text': 'Ұшақ'},], 'correctAnswer': 'Доп',},
    ],
    'Орта': [
      {'word': 'Жүзу', 'options': [{'image': 'assets/images/zhugiru.png', 'text': 'Жүгіру'}, {'image': 'assets/images/sekiru.png', 'text': 'Секіру'}, {'image': 'assets/images/biy.png', 'text': 'Билеу'}, {'image': 'assets/images/zhuzu.png', 'text': 'Жүзу'},], 'correctAnswer': 'Жүзу',},
      {'word': 'Оқу', 'options': [{'image': 'assets/images/oqu.png', 'text': 'Оқу'}, {'image': 'assets/images/zhazu.png', 'text': 'Жазу'}, {'image': 'assets/images/suret_salu.png', 'text': 'Сурет салу'}, {'image': 'assets/images/tyndau.png', 'text': 'Тыңдау'},], 'correctAnswer': 'Оқу',},
      {'word': 'Аурухана', 'options': [{'image': 'assets/images/mektep.png', 'text': 'Мектеп'}, {'image': 'assets/images/auyruhana.png', 'text': 'Аурухана'}, {'image': 'assets/images/duken.png', 'text': 'Дүкен'}, {'image': 'assets/images/kitapkhana.png', 'text': 'Кітапхана'},], 'correctAnswer': 'Аурухана',},
      {'word': 'Көпір', 'options': [{'image': 'assets/images/gimarat.png', 'text': 'Ғимарат'}, {'image': 'assets/images/munara.png', 'text': 'Мұнара'}, {'image': 'assets/images/kopir.png', 'text': 'Көпір'}, {'image': 'assets/images/zhol.png', 'text': 'Жол'},], 'correctAnswer': 'Көпір',},
      {'word': 'Аяқ киім', 'options': [{'image': 'assets/images/koilek.png', 'text': 'Көйлек'}, {'image': 'assets/images/ayaq_kiyim.png', 'text': 'Аяқ киім'}, {'image': 'assets/images/shalbar.png', 'text': 'Шалбар'}, {'image': 'assets/images/qalpaq.png', 'text': 'Қалпақ'},], 'correctAnswer': 'Аяқ киім',},
      {'word': 'Қайшы', 'options': [{'image': 'assets/images/pyshaq.png', 'text': 'Пышақ'}, {'image': 'assets/images/taraq.png', 'text': 'Тарақ'}, {'image': 'assets/images/qalam.png', 'text': 'Қалам'}, {'image': 'assets/images/qayshy.png', 'text': 'Қайшы'},], 'correctAnswer': 'Қайшы',},
      {'word': 'Тоңазытқыш', 'options': [{'image': 'assets/images/kir_zhughysh.png', 'text': 'Кір жуғыш'}, {'image': 'assets/images/tonazytqysh.png', 'text': 'Тоңазытқыш'}, {'image': 'assets/images/shansorqysh.png', 'text': 'Шаңсорғыш'}, {'image': 'assets/images/teledidar.png', 'text': 'Теледидар'},], 'correctAnswer': 'Тоңазытқыш',},
    ],
    'Жоғары': [
      {'sentenceToSpeak': 'Бүгін ауа райы тамаша, күн жылы.', 'options': ['Бүгін ауа райы жақсы, күн ыстық.', 'Кеше ауа райы тамаша болды, күн жылы.', 'Бүгін ауа райы тамаша, күн жылы.', 'Бүгін ауа райы бұлтты, күн жылы.',], 'correctAnswer': 'Бүгін ауа райы тамаша, күн жылы.',},
      {'sentenceToSpeak': 'Мен қазақ тілін үйреніп жүрмін.', 'options': ['Мен қазақ тілін үйреніп жатырмын.', 'Мен қазақ тілін үйреніп жүрмін.', 'Ол қазақ тілін үйреніп жүр.', 'Мен ағылшын тілін үйреніп жүрмін.',], 'correctAnswer': 'Мен қазақ тілін үйреніп жүрмін.',},
      {'sentenceToSpeak': 'Астана - Қазақстанның елордасы.', 'options': ['Астана - Қазақстанның үлкен қаласы.', 'Алматы - Қазақстанның елордасы.', 'Астана - әдемі қала.', 'Астана - Қазақстанның елордасы.',], 'correctAnswer': 'Астана - Қазақстанның елордасы.',},
      {'sentenceToSpeak': 'Кітапханадан қызықты кітап алдым.', 'options': ['Кітапханадан қызықты кітаптар алдым.', 'Дүкеннен қызықты кітап алдым.', 'Кітапханадан қызықты кітап алдым.', 'Кітапханаға қызықты кітап апардым.',], 'correctAnswer': 'Кітапханадан қызықты кітап алдым.',},
      {'sentenceToSpeak': 'Ертең мен театрға барамын.', 'options': ['Ертең сен театрға барасың.', 'Ертең мен театрға барамын.', 'Бүгін мен театрға барамын.', 'Ертең мен киноға барамын.',], 'correctAnswer': 'Ертең мен театрға барамын.',},
      {'sentenceToSpeak': 'Бұл тағам өте дәмді болыпты.', 'options': ['Бұл тағам өте дәмді болды.', 'Бұл сусын өте дәмді болыпты.', 'Бұл тағам өте дәмсіз болыпты.', 'Бұл тағам өте дәмді болыпты.',], 'correctAnswer': 'Бұл тағам өте дәмді болыпты.',},
      {'sentenceToSpeak': 'Сен сабаққа дайынсың ба?', 'options': ['Сен сабаққа дайынсың ба?', 'Сен сабаққа дайынсың.', 'Ол сабаққа дайын ба?', 'Сен жұмысқа дайынсың ба?',], 'correctAnswer': 'Сен сабаққа дайынсың ба?',},
    ]
  };

  void _playSound(String textToPlay) {
    print("Ойнатылуда: $textToPlay");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Аудио ойнатылды"),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  void _checkAnswer() {
    if (_selectedOption == null) {
       ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Алдымен жауап нұсқасын таңдаңыз!"),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    String currentLevelKey = _taskData.keys.elementAt(_selectedLevelIndex);
    final taskList = _taskData[currentLevelKey]!;
    String correctAnswer = taskList[_currentTaskIndex]['correctAnswer'];
    bool isCorrect = _selectedOption == correctAnswer;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(isCorrect ? "Дұрыс! Жарайсың!" : "Қате! Қайталап көріңіз."),
        backgroundColor: isCorrect ? Colors.green : Colors.red,
      ),
    );
    
    if (isCorrect) {
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          if (_currentTaskIndex < taskList.length - 1) {
            _currentTaskIndex++;
            _selectedOption = null;
          } else {
            _isLevelCompleted = true;
          }
        });
      });
    }
  }

  void _restartLevel() {
    setState(() {
      _currentTaskIndex = 0;
      _selectedOption = null;
      _isLevelCompleted = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    String currentLevelKey = _taskData.keys.elementAt(_selectedLevelIndex);
    final taskList = _taskData[currentLevelKey]!;

    if(taskList.isEmpty){
        return Scaffold(
             appBar: AppBar(title: const Text('Тыңдау тапсырмасы')),
             body: Center(
                child: Text('$currentLevelKey деңгейіне тапсырмалар әлі қосылмаған.'),
             ),
        );
    }
    
    final currentTask = taskList[_currentTaskIndex];

    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F8),
      appBar: AppBar(
        title: const Text('Тыңдау тапсырмасы'),
        backgroundColor: Colors.white,
        elevation: 1.0,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildLevelSelector(),
            const SizedBox(height: 16),
            
            Text(
              'Тапсырма ${_currentTaskIndex + 1} / ${taskList.length}',
              style: TextStyle(fontSize: 16, color: Colors.grey[700], fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            if (_isLevelCompleted)
              _buildCompletionWidget(currentLevelKey)
            else
              _selectedLevelIndex == 2 
                  ? _buildAdvancedTaskUI(currentTask) 
                  : _buildStandardTaskUI(currentTask), 
            
            if (!_isLevelCompleted)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _checkAnswer,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'ТЕКСЕРУ',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildStandardTaskUI(Map<String, dynamic> currentTask) {
    return Expanded(
      child: Column(
        children: [
          Text(
            'Дұрыс суретті таңдаңыз',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () => _playSound(currentTask['word']),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.volume_up, size: 40, color: Colors.blueAccent),
                const SizedBox(width: 10),
                Text(
                  currentTask['word'],
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.blueAccent
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.9,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                final option = currentTask['options'][index];
                bool isSelected = _selectedOption == option['text'];

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedOption = option['text'];
                    });
                  },
                  child: Card(
                    elevation: isSelected ? 8 : 2,
                    color: isSelected ? Colors.blue.shade50 : Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                        color: isSelected ? Colors.blue : Colors.grey.shade200,
                        width: 2,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            // =======================================================
                            // ===         МІНЕ, ОСЫ ЖЕРДЕ ӨЗГЕРІС ЕНГІЗІЛДІ       ===
                            // =======================================================
                            // Image.asset(...) орнына уақытша белгі (placeholder) қойдық
                            child: Container(
                              alignment: Alignment.center,
                              color: Colors.grey[200],
                              child: Icon(
                                Icons.image_outlined,
                                color: Colors.grey[400],
                                size: 50,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          option['text'],
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAdvancedTaskUI(Map<String, dynamic> currentTask) {
    return Expanded(
      child: Column(
        children: [
          Text(
            'Айтылған сөйлемді табыңыз',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () => _playSound(currentTask['sentenceToSpeak']),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(30)
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.volume_up, size: 30, color: Colors.blueAccent),
                  const SizedBox(width: 10),
                  Text(
                    "Сөйлемді тыңдау",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.blueAccent
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: (currentTask['options'] as List<String>).map((sentence) {
                bool isSelected = _selectedOption == sentence;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedOption = sentence;
                    });
                  },
                  child: Card(
                    elevation: isSelected ? 6 : 2,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    color: isSelected ? Colors.blue.shade50 : Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                        color: isSelected ? Colors.blue : Colors.grey.shade300,
                        width: isSelected ? 2 : 1.5,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        sentence,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          height: 1.5
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCompletionWidget(String levelKey) {
     return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 80),
            const SizedBox(height: 20),
            Text(
              '"$levelKey" деңгейін аяқтадыңыз!',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _restartLevel,
              child: const Text('Қайта бастау'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLevelSelector() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildLevelButton('Бастауыш', 0),
          _buildLevelButton('Орта', 1),
          _buildLevelButton('Жоғары', 2),
        ],
      ),
    );
  }

  Widget _buildLevelButton(String text, int index) {
    bool isSelected = _selectedLevelIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedLevelIndex = index;
            _restartLevel();
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue : Colors.transparent,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}