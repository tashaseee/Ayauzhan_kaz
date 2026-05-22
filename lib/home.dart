import 'package:flutter/material.dart';
import 'lesson.dart'; // GrammarLessonsPage
import 'audio.dart';  // ListeningExercisePage
import 'quiz.dart';   // TestPage

class ModuleData {
  final String title;
  final IconData icon;
  final Color baseColor;

  ModuleData(this.title, this.icon, this.baseColor);
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<ModuleData> modules = [
    ModuleData('Грамматика', Icons.menu_book, const Color(0xFFF9AA33)),
    ModuleData('Тыңдау', Icons.headset_mic, const Color(0xFF42A5F5)),
    ModuleData('Тест', Icons.quiz, const Color(0xFF81C784)),
    ModuleData('Оқу', Icons.view_list, const Color(0xFFBA68C8)),
    ModuleData('жазу', Icons.view_list, const Color(0xFFBA68C8)),
  ];

  int? _pressedIndex;
  final Color _activeColor = const Color(0xFF4A90E2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Бастауыш деңгей',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              _buildMainFocusCard(),
              const SizedBox(height: 30),
              const Text(
                'Танымал сабақтар',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF333333)),
              ),
              const SizedBox(height: 20),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 1.1,
                ),
                itemCount: modules.length,
                itemBuilder: (context, index) {
                  return _buildModuleCard(modules[index], index);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMainFocusCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: const LinearGradient(
            colors: [Color(0xFF50E3C2), Color(0xFF4A90E2)],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight),
        boxShadow: [
          BoxShadow(
              color: const Color(0xFF4A90E2).withOpacity(0.5),
              blurRadius: 20,
              offset: const Offset(0, 10))
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -10,
            top: -10,
            child:
                Icon(Icons.school, size: 130, color: Colors.white.withOpacity(0.1)),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              'Бүгін не\nүйренгің келеді?',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w900,
                color: Colors.white,
                height: 1.3,
                shadows: [
                  Shadow(color: Colors.black, blurRadius: 5, offset: Offset(1, 1))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildModuleCard(ModuleData module, int index) {
    final Color cardColor = _pressedIndex == index ? _activeColor : Colors.white;
    final Color contentColor = _pressedIndex == index ? Colors.white : module.baseColor;
    final Color textColor = _pressedIndex == index ? Colors.white : const Color(0xFF333333);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 5))
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: () async {
            setState(() {
              _pressedIndex = index;
            });

            // Навигация экранға өту
            if (module.title == 'Грамматика') {
              await Navigator.push(context, MaterialPageRoute(builder: (_) => GrammarLessonsPage()));
            } else if (module.title == 'Тыңдау') {
              await Navigator.push(context, MaterialPageRoute(builder: (_) => ListeningExercisePage()));
            } else if (module.title == 'Тест') {
              await Navigator.push(context, MaterialPageRoute(builder: (_) => TestPage()));
            } else if (module.title == 'Оқу') {
              print("Оқу басылды");
            }

            if (mounted) {
              setState(() {
                _pressedIndex = null;
              });
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: contentColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(module.icon, size: 35, color: contentColor),
                ),
                Text(
                  module.title,
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w700, color: textColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
