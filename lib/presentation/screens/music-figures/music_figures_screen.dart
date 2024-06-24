import 'package:flutter/material.dart';
import 'package:student_app/presentation/screens/music-figures/pages/music_figures_tutorial.dart';
import 'package:student_app/presentation/screens/music-figures/pages/music_figures_tutorial_2.dart';
import 'package:student_app/presentation/screens/music-figures/pages/music_figures_tutorial_quiz.dart';

class MusicFiguresScreen extends StatefulWidget {
  const MusicFiguresScreen({super.key});

  @override
  State<MusicFiguresScreen> createState() => _MusicFiguresScreenState();
}

class _MusicFiguresScreenState extends State<MusicFiguresScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    increaseIndex() {
      setState(() {
        index = index + 1;
      });
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                if (index == 0)
                  MusicFiguresTutorial(
                    increaseIndex: increaseIndex,
                  ),
                if (index == 1)
                  MusicFiguresTutorial2(
                    increaseIndex: increaseIndex,
                  ),
                if (index == 2)
                  MusicFiguresTutorialQuiz(
                    increaseIndex: increaseIndex,
                  ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
