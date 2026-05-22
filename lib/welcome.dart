import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/widgets.dart';


class OnboardingPageModel{
  final String imagePath;
  final String title;
  final String description;

  OnboardingPageModel({
    required this.imagePath,
    required this.title,
    required this.description,
  });
}

final List<OnboardingPageModel> pageData = [
  OnboardingPageModel(
    imagePath: 'assets/logo.png',
    title: 'Мир Казахского Языка',
    description:'Изучение казахского языка еще никогда не было таким простым! С нами вы быстро освоите язык.',

  ),
  OnboardingPageModel(
    imagePath: 'assets/logo.png',
    title: 'Интерактивные Уроки',
    description: 'Осваивайте грамматику и лексику через увлекательные задания и игры, созданные экспертами.',
  ),
  OnboardingPageModel(
    imagePath: 'assets/logo.png',
    title:'Следите за Прогрессом',
    description: 'Получайте награды, отслеживайте свой рост и ставьте новые цели для эффективного обучения.',
  ),
];

const Color kPrimaryColor = Color(0xFF1E88E5);
const Color kTitleColor = Colors.black87;

class WelcomeScreen extends StatefulWidget{
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}
class _WelcomeScreenState extends State<WelcomeScreen>{
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState(){
    super.initState();
    _pageController.addListener(() {
      int next = _pageController.page!.round();
      if (_currentPage != next){
        setState(() {
          _currentPage = next;
          
        });
      }
    });
  }
  void _navigateToLogin(BuildContext context){
    Navigator.pushNamed(context, '/login');
  }
  void _navigateToRegitration(BuildContext context){
    Navigator.pushNamed(context, '/register');
  }
  @override
  void dispose(){
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: pageData.length,
                itemBuilder: (context, index){
                  final page = pageData[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 30.0),
                    child: Column(
                      children: [
                        Image.asset(
                          page.imagePath,
                          height: 180,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 40),
                        Text(
                          page.title,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: kTitleColor  ,
                          ),
                        ),
                        const SizedBox(height: 15),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            page.description,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                              color: Colors.grey.shade600,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                pageData.length,
                (index) => _buildDot(index == _currentPage ? kPrimaryColor : Colors.grey.shade300),
              ),
            ),
            const SizedBox(height: 40),

            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 20.0),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () => _navigateToLogin(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(12)),
                        elevation: 5,

                      ),
                      child: const Text('Войти', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white )),
                    ),
                  ),
                  const SizedBox(height: 15),

                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: OutlinedButton(
                      onPressed: () => _navigateToRegitration(context),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: kPrimaryColor, width: 2),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(12)),
                        backgroundColor: Colors.white,
                      ),
                      child: const Text('Зарегистрироваться',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: kPrimaryColor)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
    Widget _buildDot(Color color) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      width: 8.0,
      height: 8.0,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4.0),
      ),
     );
   }
 }
