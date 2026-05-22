import 'package:flutter/material.dart';

// Сабақтардың деректер класы
class Lesson {
  final String title;
  final int lessonCount;
  final int hourCount;

  Lesson(this.title, this.lessonCount, this.hourCount);
}

class GrammarLessonsPage extends StatefulWidget {
  const GrammarLessonsPage({super.key});

  @override
  State<GrammarLessonsPage> createState() => _GrammarLessonsPageState();
}

class _GrammarLessonsPageState extends State<GrammarLessonsPage> {
  // Активті деңгейді сақтау үшін
  String _selectedLevel = 'Бастауыш';
  
  // Деңгейлер тізімі
  final List<String> _levels = ['Бастауыш', 'Орта', 'Жоғары'];
  
  // Көк түс схемасы
  final Color _primaryBlue = const Color(0xFF4A90E2);
  final Color _lightBlue = const Color(0xFFE3F2FD); // Өте ашық көк
  final Color _backgroundColor = const Color(0xFFF5F5F5); // Фон түсі

  // Әр деңгейге арналған сабақтар дерегі (Скриншоттарға сәйкес)
  Map<String, List<Lesson>> lessonData = {
    'Бастауыш': [
      Lesson('Қазіргі Шақ', 12, 4),
      Lesson('Өткен Шақ', 10, 5),
      Lesson('Келер Шақ', 8, 3),
      Lesson('Сөздердің Реті', 7, 2),
    ],
    'Орта': [
      Lesson('Септік Жалғаулары', 15, 6),
      Lesson('Көсемшелер', 12, 5),
      Lesson('Есімшелер', 10, 4),
      Lesson('Шылаулар', 8, 3),
    ],
    'Жоғары': [
      Lesson('Сөзжасам', 18, 8),
      Lesson('Тұрақты Тіркестер', 15, 7),
      Lesson('Күрделі Сөйлем', 13, 6),
      Lesson('Стильдік Ерекшеліктер', 10, 5),
    ],
  };

  @override
  Widget build(BuildContext context) {
    // Таңдалған деңгейге сәйкес сабақтарды алу
    final currentLessons = lessonData[_selectedLevel] ?? [];

    return Scaffold(
      backgroundColor: _backgroundColor,
      body: CustomScrollView(
        slivers: [
          // 1. Жоғарғы бөлім (Header)
          _buildSliverHeader(),

          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      // 2. Деңгей таңдау батырмалары
                      _buildLevelSelectionButtons(),
                      const SizedBox(height: 25),
                      // 3. Сабақтар тізімі
                      ...currentLessons.map((lesson) => _buildLessonCard(lesson)).toList(),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- Виджеттерді құру функциялары ---

  // Жоғарғы бөлім (Sliver AppBar)
  Widget _buildSliverHeader() {
    return SliverAppBar(
      backgroundColor: _backgroundColor,
      automaticallyImplyLeading: false, // Әдепкі артқа батырмасын өшіру
      expandedHeight: 220.0, // Бастың биіктігін арттыру
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.zero,
        background: Stack(
          children: [
            // Артқы фондық графика (Көк түсті версиясы)
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Icon(
                  Icons.menu_book, 
                  size: 100, 
                  color: _primaryBlue.withOpacity(0.15)
                ),
              ),
            ),
            Positioned(
              top: 40,
              right: 20,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Icon(
                  Icons.person_pin_circle, 
                  size: 100, 
                  color: _primaryBlue.withOpacity(0.15)
                ),
              ),
            ),
          ],
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, bottom: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Артқа қайту батырмасы (Скриншоттағыдай таза стильде)
              Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios_new, size: 20, color: _primaryBlue),
                  onPressed: () {
                    // Артқа қайту логикасы
                    Navigator.pop(context);
                  },
                ),
              ),
              const SizedBox(height: 10),
              // Тақырып
              Text(
                'Грамматика сабақтары',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: Colors.grey.shade800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Деңгей таңдау батырмалары
  Widget _buildLevelSelectionButtons() {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _levels.map((level) {
          final isSelected = _selectedLevel == level;
          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedLevel = level;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                decoration: BoxDecoration(
                  color: isSelected ? _primaryBlue : Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    level,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: isSelected ? Colors.white : Colors.grey.shade600,
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  // Әр сабаққа арналған карточка
  Widget _buildLessonCard(Lesson lesson) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Card(
        margin: EdgeInsets.zero,
        elevation: 3, // Көлеңкені арттыру
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: () {
            // Сабақты ашу логикасы
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${lesson.title} сабағын ашу...'), duration: const Duration(milliseconds: 500)));
          },
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                // Сол жақтағы дөңгелек иконка (Көк түсті)
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: _lightBlue, // Ашық көк фон
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.person, size: 28, color: _primaryBlue),
                ),
                const SizedBox(width: 15),
                // Мәтін ақпараты
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        lesson.title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey.shade800,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${lesson.lessonCount} сабақ • ${lesson.hourCount} сағат',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                // Оң жақтағы Play батырмасы (Көк түсті)
                Icon(
                  Icons.play_circle_fill,
                  size: 35,
                  color: _primaryBlue,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}