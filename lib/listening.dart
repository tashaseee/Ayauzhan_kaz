import 'package:flutter/material.dart';

class ListeningCoursesPage extends StatefulWidget {
  const ListeningCoursesPage({super.key});

  @override
  State<ListeningCoursesPage> createState() => _ListeningCoursesPageState();
}

class _ListeningCoursesPageState extends State<ListeningCoursesPage> {
  // Таңдалған деңгейді сақтауға арналған айнымалы
  String selectedLevel = 'Бастауыш';

  // Деңгейлер тізімі
  final List<String> levels = ['Бастауыш', 'Орта', 'Жоғары'];

  // Деңгейге байланысты курстардың үлгі деректері (әр деңгейде 4 тақырып)
  final Map<String, List<Map<String, dynamic>>> courseData = {
    'Бастауыш': [
      {'title': 'Сәлемдесу', 'subtitle': '6 диалог • 25 мин', 'image': 'assets/listen1.png'},
      {'title': 'Қаладағы Әңгіме', 'subtitle': '8 диалог • 30 мин', 'image': 'assets/listen2.png'},
      {'title': 'Отбасы туралы', 'subtitle': '5 аудио • 20 мин', 'image': 'assets/listen3.png'},
      {'title': 'Түстер мен Санау', 'subtitle': '7 аудио • 15 мин', 'image': 'assets/listen4.png'},
    ],
    'Орта': [
      {'title': 'Жаңалықтарды Тыңдау', 'subtitle': '10 подкаст • 45 мин', 'image': 'assets/listen5.png'},
      {'title': 'Телефонда Сөйлесу', 'subtitle': '8 диалог • 35 мин', 'image': 'assets/listen6.png'},
      {'title': 'Сұхбатты Түсіну', 'subtitle': '9 аудио • 40 мин', 'image': 'assets/listen7.png'},
      {'title': 'Ресми Келіссөздер', 'subtitle': '6 аудио • 30 мин', 'image': 'assets/listen8.png'},
    ],
    'Жоғары': [
      {'title': 'Әдеби Үзінділер', 'subtitle': '12 мәтін • 60 мин', 'image': 'assets/listen9.png'},
      {'title': 'Акценттерді Ажырату', 'subtitle': '15 үзінді • 50 мин', 'image': 'assets/listen10.png'},
      {'title': 'Дыбыс Фонетикасы', 'subtitle': '10 сабақ • 45 мин', 'image': 'assets/listen11.png'},
      {'title': 'Саяси Дебаттар', 'subtitle': '7 аудио • 35 мин', 'image': 'assets/listen12.png'},
    ],
  };

  @override
  Widget build(BuildContext context) {
    // Таңдалған деңгейге сәйкес курстар тізімін алу
    final currentCourses = courseData[selectedLevel] ?? [];

    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FF),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // --- 1. Жоғарғы сурет және Артқа түймесі ---
            _buildHeaderImage(context),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),

                  // --- 2. Тақырып ---
                  const Text(
                    'Тыңдау сабақтары', // Listening courses -> Тыңдау сабақтары
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2C3E50),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // --- 3. Деңгей таңдау түймелері (Бастауыш, Орта, Жоғары) ---
                  _buildLevelTabs(),
                  const SizedBox(height: 25),

                  // --- 4. Курстар тізімі ---
                  ...currentCourses.map((course) {
                    return _buildCourseCard(
                      context,
                      title: course['title'],
                      subtitle: course['subtitle'],
                      image: course['image'],
                    );
                  }).toList(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- Жоғарғы сурет бөлігін құру ---
  // (Дизайнды грамматика бетіндегідей ұқсас, бірақ түсін өзгертуге болады)
  Widget _buildHeaderImage(BuildContext context) {
    return Container(
      height: 200,
      decoration: const BoxDecoration(
        color: Color(0xFFB0E0E6), // Ашық көгілдір (Тыңдауға сәйкес)
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Stack(
        children: [
          // Артқа түймесі
          Positioned(
            top: 40,
            left: 20,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF2C3E50), size: 20),
              ),
            ),
          ),
          // Сурет элементтерін имитациялау (Құлаққап иконкасын қосамыз)
          const Positioned(
            bottom: 20,
            left: 20,
            child: Icon(Icons.headphones_rounded, size: 80, color: Color(0xFF55B4F4)),
          ),
          const Positioned(
            top: 50,
            right: 20,
            child: Icon(Icons.mic_none, size: 100, color: Color(0xFF55B4F4)),
          ),
        ],
      ),
    );
  }

  // --- Деңгей таңдау түймелерін құру ---
  Widget _buildLevelTabs() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: levels.map((level) {
          final isSelected = selectedLevel == level;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedLevel = level;
              });
            },
            child: AnimatedContainer( // Әдемі ауысу үшін
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFF55B4F4) : Colors.transparent, // Таңдалса көк
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                level,
                style: TextStyle(
                  color: isSelected ? Colors.white : const Color(0xFF2C3E50).withOpacity(0.6),
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  fontSize: 16,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  // --- Курс картасын құру (Сабақтар тізімі) ---
  Widget _buildCourseCard(BuildContext context, {required String title, required String subtitle, required String image}) {
    // Курс картасының дизайны GrammarCoursesPage-пен бірдей
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: InkWell(
          onTap: () {
            debugPrint('$title тыңдау сабағы басылды');
          },
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: <Widget>[
                // Сол жақтағы адам/сурет (Circle Avatar Placeholder)
                CircleAvatar(
                  radius: 35,
                  backgroundColor: const Color(0xFFB0E0E6).withOpacity(0.5),
                  // Тыңдау үшін құлаққап иконкасын қолданамыз
                  child: const Icon(Icons.headset, size: 40, color: Color(0xFF55B4F4)), 
                ),
                const SizedBox(width: 15),

                // Ортадағы мәтін
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2C3E50),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        subtitle, 
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFFA0A7B5),
                        ),
                      ),
                    ],
                  ),
                ),

                // Оң жақтағы Ойнату (Play) түймесі
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Color(0xFF55B4F4), // Көк түс (Тыңдауға сәйкес)
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.play_arrow, color: Colors.white, size: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}