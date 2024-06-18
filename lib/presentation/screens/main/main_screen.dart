import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:student_app/presentation/screens/account/account_screen.dart';
import 'package:student_app/presentation/screens/home/home_screen.dart';
import 'package:student_app/presentation/screens/professor/professor_screen.dart';
import 'package:student_app/presentation/screens/statistics/statistics_screen.dart';
import 'package:student_app/presentation/theme/app_colors.dart';
import 'package:student_app/providers/user_provider.dart';
import 'package:student_app/utils/text/to_title_case.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  late final List<StatelessWidget> pages;

  @override
  void initState() {
    pages = [
      const HomeScreen(),
      const StatisticsScreen(),
      const AccountScreen(),
      const ProfessorScreen(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(
              height: 30,
              width: 30,
              child: Image.asset('assets/images/musica.png'),
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
                '¡Hola ${toTitleCase(userProvider.user?.name ?? '')}! Vayamos a estudiar'),
          ],
        ),
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: currentIndex,
        onTap: (i) => setState(() => currentIndex = i),
        items: [
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text("Inicio"),
            selectedColor: AppColors.purple,
            unselectedColor: Colors.black26,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.auto_graph),
            title: const Text("Estadisticas"),
            selectedColor: Colors.pink,
            unselectedColor: Colors.black26,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.account_circle_outlined),
            title: const Text("Cuenta"),
            selectedColor: Colors.orange,
            unselectedColor: Colors.black26,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.library_books_outlined),
            title: const Text("Profesor"),
            selectedColor: Colors.teal,
            unselectedColor: Colors.black26,
          ),
        ],
      ),
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
    );
  }
}
