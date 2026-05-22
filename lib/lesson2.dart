// // rule_detail_screen_with_tasks.dart

// import 'package:flutter/material.dart';
// import 'task_screens_styled.dart'; // Алдыңғы жауаптағы TaskListScreenStyled орналасқан файл

// class RuleDetailScreen extends StatelessWidget {
//   const RuleDetailScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: Row(
//           children: [
//             IconButton(
//               icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
//               onPressed: () => Navigator.pop(context),
//             ),
//             const SizedBox(width: 8),
//             const Text(
//               'Қазіргі Шақ',
//               style: TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 22,
//               ),
//             ),
//           ],
//         ),
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         actions: [
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//             decoration: BoxDecoration(
//               color: Colors.red.shade700,
//               borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10)),
//             ),
//             child: const Text('DEBUG', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
//           ),
//         ],
//       ),
//       body: Stack(
//         children: [
//           SingleChildScrollView(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 // 1. Жалпы анықтама БЛОГЫ (Сіздің бірінші карточкаңыз)
//                 RuleCard(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'Қазіргі Шақ (Present Tense)',
//                         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFFE65100)), // Қызғылт-сары акцент
//                       ),
//                       const SizedBox(height: 8),
//                       Text(
//                         'Іс-әрекеттің сөйлеп тұрған сәтте немесе осы мезгілде (қазір, бүгін, осы кезде) болып жатқанын білдіретін етістік формасы.',
//                         style: TextStyle(fontSize: 15, color: Colors.grey.shade700),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 16),

//                 // 2. Қазіргі шақтың түрлері (ExpansionTile 1)
//                 StyledExpansionTile(
//                   title: '1. Қазіргі шақтың түрлері',
//                   children: [
//                     RuleTypeBox(
//                       title: 'Нақ қазіргі шақ',
//                       description: 'Іс-әрекет дәл қазір, сөйлеп тұрған сәтте болып жатқанын білдіреді.',
//                       iconColor: Colors.teal,
//                     ),
//                     const SizedBox(height: 10),
//                     RuleTypeBox(
//                       title: 'Ауыспалы қазіргі шақ',
//                       description: 'Іс-әрекет әдетте орындалатынын, жиі қайталанатынын немесе қазіргі уақытта жүзеге асып жүргенін білдіреді.',
//                       iconColor: Colors.teal,
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 16),

//                 // 3. Нақ Қазіргі Шақ (Ереже және Мысалдар) (ExpansionTile 2)
//                 StyledExpansionTile(
//                   title: '2. Нақ қазіргі шақ (Ереже және Мысалдар)',
//                   children: [
//                     const Text('Нақ қазіргі шақ', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 16)),
//                     const SizedBox(height: 5),
//                     const Text('Етістік түбіріне **-ып, -іп, -п** кәсемше жұрнағы жалғанып, оған **жүр, отыр, тұр, жатыр** көмекші етістіктері тіркеседі.'),
//                     const SizedBox(height: 10),
//                     const Text('Мысалы:', style: TextStyle(fontWeight: FontWeight.bold)),
//                     _buildExampleList('Мен кітап **оқып отырмын**.'),
//                     _buildExampleList('Ол тамақ **ішіп жатыр**.'),
//                     _buildExampleList('Біз сабаққа **дайындалып тұрмыз**.'),
//                     _buildExampleList('Қызметкерлер жиналыста **сөйлеп жатыр**.'),
//                   ],
//                 ),
//                 const SizedBox(height: 100), // Төменгі батырмаға орын қалдыру
//               ],
//             ),
//           ),
          
//           // 4. Төменгі Бекіту Батырмасы (Footer Button)
//           Positioned(
//             left: 0,
//             right: 0,
//             bottom: 0,
//             child: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//               color: Colors.white.withOpacity(0.95), // Фон
//               child: ElevatedButton.icon(
//                 onPressed: () {
//                   // Бұл жерде сіздің 12 тапсырмаңыздың тізімі бар бет ашылады
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => const TaskListScreenStyled(ruleTitle: "Нақ Қазіргі Шақ"),
//                     ),
//                   );
//                 },
//                 icon: const Icon(Icons.help_outline, color: Colors.white),
//                 label: const Text('Бекіту үшін тест тапсыру (12 тапсырма)', style: TextStyle(fontSize: 18, color: Colors.white)),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFF4DB6AC), // Көк-жасыл (Teal) түс
//                   padding: const EdgeInsets.symmetric(vertical: 14),
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                   elevation: 6,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // Мысалдарды тізім түрінде көрсететін кішігірім виджет
//   Widget _buildExampleList(String text) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 8.0, top: 4),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Padding(
//             padding: EdgeInsets.only(top: 5.0),
//             child: Icon(Icons.play_arrow, size: 14, color: Colors.blue),
//           ),
//           const SizedBox(width: 5),
//           Expanded(
//             child: Text(text),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // -----------------------------------------------------------------------------
// // Қайта қолдануға болатын виджеттер (RuleCard, StyledExpansionTile, RuleTypeBox)
// // -----------------------------------------------------------------------------

// // Негізгі карточка стилі
// class RuleCard extends StatelessWidget {
//   final Widget child;
//   const RuleCard({super.key, required this.child});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(15),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.2),
//             spreadRadius: 2,
//             blurRadius: 5,
//             offset: const Offset(0, 3),
//           ),
//         ],
//         border: Border.all(color: Colors.orange.shade200, width: 2), // Басты карточканың қызғылт-сары шекарасы
//       ),
//       child: child,
//     );
//   }
// }

// // Қайта қолданылатын ExpansionTile стилі
// class StyledExpansionTile extends StatelessWidget {
//   final String title;
//   final List<Widget> children;
//   const StyledExpansionTile({super.key, required this.title, required this.children});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//       child: Theme(
//         data: Theme.of(context).copyWith(dividerColor: Colors.transparent), // Ішкі сызықты жасыру
//         child: ExpansionTile(
//           initiallyExpanded: true,
//           title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
//           trailing: const Icon(Icons.keyboard_arrow_up, color: Colors.black),
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: children,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // Түрлерді көрсететін ішкі қорапша (Нақ қазіргі шақ, Ауыспалы қазіргі шақ)
// class RuleTypeBox extends StatelessWidget {
//   final String title;
//   final String description;
//   final Color iconColor;

//   const RuleTypeBox({super.key, required this.title, required this.description, required this.iconColor});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//         border: Border.all(color: Colors.grey.shade300),
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Icon(Icons.check_circle, color: iconColor, size: 20),
//           const SizedBox(width: 10),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
//                 const SizedBox(height: 4),
//                 Text(description, style: TextStyle(fontSize: 14, color: Colors.grey.shade700)),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // -----------------------------------------------------------------------------
// // 4. Ескерту: Тапсырмалар Тізімі (TaskListScreenStyled)
// // -----------------------------------------------------------------------------

// /* Ескерту: Тапсырмалар тізімі (TaskListScreenStyled) коды алдыңғы жауапта берілген.
//    Оны осы кодпен бірге бір жобаға қосыңыз.

//    TaskListScreenStyled ішінде 12 тапсырманың тізімі бар.
// */