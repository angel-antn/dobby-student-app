import 'package:flutter/material.dart';
import 'package:student_app/presentation/screens/silences/pages/silences_tutorial.dart';
import 'package:student_app/presentation/screens/silences/pages/silences_tutorial_quiz.dart';

class SilencesScreen extends StatefulWidget {
  const SilencesScreen({super.key});

  @override
  State<SilencesScreen> createState() => _SilencesScreenState();
}

class _SilencesScreenState extends State<SilencesScreen> {
  int index = 0;
  late ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    increaseIndex() {
      scrollController.position.animateTo(
        0,
        curve: Easing.emphasizedAccelerate,
        duration: Durations.medium3,
      );
      setState(() {
        index = index + 1;
      });
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            controller: scrollController,
            primary: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                if (index == 0)
                  SilencesTutorial(
                    increaseIndex: increaseIndex,
                  ),
                if (index == 1)
                  SilencesTutorialQuiz(
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
