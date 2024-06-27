import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:student_app/data/local/preferences.dart';
import 'package:student_app/data/remote/dobby/result_request.dart';
import 'package:student_app/presentation/components/buttons/primary_button.dart';
import 'package:student_app/presentation/components/question-model/vertical_image_question.dart';
import 'package:student_app/presentation/theme/app_colors.dart';
import 'package:student_app/utils/toast/show_toast.dart';

class SilencesTutorialQuiz extends StatefulWidget {
  const SilencesTutorialQuiz({super.key, required this.increaseIndex});

  final Function increaseIndex;

  @override
  State<SilencesTutorialQuiz> createState() => _SilencesTutorialQuizState();
}

class _SilencesTutorialQuizState extends State<SilencesTutorialQuiz> {
  int? response1;
  int? response2;
  int? response3;
  int? response4;
  int? response5;
  int? response6;

  bool review = false;

  @override
  Widget build(BuildContext context) {
    setResponse1(int response) {
      if (review) return;
      setState(() {
        response1 = response;
      });
    }

    setResponse2(int response) {
      if (review) return;
      setState(() {
        response2 = response;
      });
    }

    setResponse3(int response) {
      if (review) return;
      setState(() {
        response3 = response;
      });
    }

    setResponse4(int response) {
      if (review) return;
      setState(() {
        response4 = response;
      });
    }

    setResponse5(int response) {
      if (review) return;
      setState(() {
        response5 = response;
      });
    }

    setResponse6(int response) {
      if (review) return;
      setState(() {
        response6 = response;
      });
    }

    onClick() {
      String details = '';
      int count = 6;

      if (response1 != 1) {
        details += 'Debe repasar el silencio de redonda\n';
        count--;
      }
      if (response2 != 2) {
        details += 'Debe repasar el silencio de blanca\n';
        count--;
      }
      if (response3 != 2) {
        details += 'Debe repasar el silencio de semicorchea\n';
        count--;
      }
      if (response4 != 0) {
        details += 'Debe repasar el silencio de blanca\n';
        count--;
      }
      if (response5 != 1) {
        details += 'Debe repasar el silencio de corchea\n';
        count--;
      }
      if (response6 != 2) {
        details += 'Debe repasar el silencio de semifusa\n';
        count--;
      }

      if (details.isEmpty) {
        details = 'Esta lección tuvo resultados perfectos';
      }

      ResultRequest()
          .createResult(
        userId: Preferences.user?.id ?? '',
        details: details,
        level: '2 - Silencios 🎸',
        questionsCount: count,
        questionsQty: 6,
      )
          .then(
        (value) {
          context.pop();
          showToast('¡Lección compleatada con éxito!');
        },
      );
    }

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: AppColors.primaryColor.withOpacity(0.1), blurRadius: 2)
            ],
            color: Colors.white,
          ),
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  SizedBox(
                      height: 35,
                      child: Image.asset('assets/images/musica.png')),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Preguntas',
                    style: TextStyle(
                        color: AppColors.green,
                        fontSize: 32,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              VerticalImageQuestion(
                borderColor: AppColors.green,
                color: AppColors.green.withOpacity(0.25),
                question: '¿Cuál es el nombre de esta figura?.',
                imagePath: 'assets/images/silence_1.png',
                labels: const ['Blanca', 'Redonda', 'Corchea'],
                setResponse: setResponse1,
                response: response1,
                correctResponse: 1,
                review: review,
              ),
              VerticalImageQuestion(
                borderColor: AppColors.green,
                color: AppColors.green.withOpacity(0.25),
                question: '¿Cuántos tiempos dura esta figura?',
                imagePath: 'assets/images/silence_3.png',
                labels: const ['2 tiempos', '1/2 tiempo', '1 tiempo'],
                setResponse: setResponse2,
                response: response2,
                correctResponse: 2,
                review: review,
              ),
              VerticalImageQuestion(
                borderColor: AppColors.green,
                color: AppColors.green.withOpacity(0.25),
                question: '¿Cuál es el nombre de esta figura?.',
                imagePath: 'assets/images/silence_5.png',
                labels: const ['Fusa', 'Corchea', 'Semicorchea'],
                setResponse: setResponse3,
                response: response3,
                correctResponse: 2,
                review: review,
              ),
              VerticalImageQuestion(
                borderColor: AppColors.green,
                color: AppColors.green.withOpacity(0.25),
                question: '¿Cuántos tiempos dura esta figura?',
                imagePath: 'assets/images/silence_2.png',
                labels: const ['2 tiempos', '1/2 tiempo', '1 tiempo'],
                setResponse: setResponse4,
                response: response4,
                correctResponse: 0,
                review: review,
              ),
              VerticalImageQuestion(
                borderColor: AppColors.green,
                color: AppColors.green.withOpacity(0.25),
                question: '¿Cuál es el nombre de esta figura?.',
                imagePath: 'assets/images/silence_4.png',
                labels: const ['Negra', 'Corchea', 'Semicorchea'],
                setResponse: setResponse5,
                response: response5,
                correctResponse: 1,
                review: review,
              ),
              VerticalImageQuestion(
                borderColor: AppColors.green,
                color: AppColors.green.withOpacity(0.25),
                question: '¿Cuántos tiempos dura esta figura?',
                imagePath: 'assets/images/silence_7.png',
                labels: const ['4 tiempos', '1/2 tiempo', '1/16 tiempo'],
                setResponse: setResponse6,
                response: response6,
                correctResponse: 2,
                review: review,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        if (!review)
          PrimaryButton(
            onTap: () {
              if (response1 == null ||
                  response2 == null ||
                  response3 == null ||
                  response4 == null ||
                  response5 == null ||
                  response6 == null) {
                showToast('Aún quedan preguntas por responder');
                return;
              }
              setState(() {
                review = true;
              });
            },
            text: 'Corregir',
          ),
        if (review) PrimaryButton(onTap: () => onClick(), text: 'Siguiente')
      ],
    );
  }
}
