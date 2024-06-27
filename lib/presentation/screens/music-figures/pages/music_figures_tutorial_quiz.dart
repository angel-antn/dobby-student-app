import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:student_app/data/local/preferences.dart';
import 'package:student_app/data/remote/dobby/result_request.dart';
import 'package:student_app/presentation/components/buttons/primary_button.dart';
import 'package:student_app/presentation/components/question-model/horizontal_non_image_question.dart';
import 'package:student_app/presentation/components/question-model/vertical_image_question.dart';
import 'package:student_app/presentation/theme/app_colors.dart';
import 'package:student_app/utils/toast/show_toast.dart';

class MusicFiguresTutorialQuiz extends StatefulWidget {
  const MusicFiguresTutorialQuiz({super.key, required this.increaseIndex});

  final Function increaseIndex;

  @override
  State<MusicFiguresTutorialQuiz> createState() =>
      _MusicFiguresTutorialQuizState();
}

class _MusicFiguresTutorialQuizState extends State<MusicFiguresTutorialQuiz> {
  int? response1;
  int? response2;
  int? response3;
  int? response4;
  int? response5;
  int? response6;
  int? response7;
  int? response8;

  bool review = false;

  @override
  Widget build(BuildContext context) {
    onClick() {
      String details = '';
      int count = 8;

      if (response1 != 1) {
        details += 'Debe repasar los elementos de la figura musical\n';
        count--;
      }
      if (response2 != 1) {
        details += 'Debe repasar la redonda\n';
        count--;
      }
      if (response3 != 1) {
        details += 'Debe repasar cual es el nucleo\n';
        count--;
      }
      if (response4 != 2) {
        details += 'Debe repasar la negra\n';
        count--;
      }
      if (response5 != 0) {
        details += 'Debe repasar cual es la plica\n';
        count--;
      }
      if (response6 != 0) {
        details += 'Debe repasar la corchea\n';
        count--;
      }
      if (response7 != 0) {
        details += 'Debe repasar la blanca\n';
        count--;
      }
      if (response8 != 2) {
        details += 'Debe repasar cual es el corchete\n';
        count--;
      }

      if (details.isEmpty) {
        details = 'Esta lección tuvo resultados perfectos';
      }

      ResultRequest()
          .createResult(
        userId: Preferences.user?.id ?? '',
        details: details,
        level: '1 - Figuras musicales 🎸',
        questionsCount: count,
        questionsQty: 8,
      )
          .then(
        (value) {
          context.pop();
          showToast('¡Lección compleatada con éxito!');
        },
      );
    }

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

    setResponse7(int response) {
      if (review) return;
      setState(() {
        response7 = response;
      });
    }

    setResponse8(int response) {
      if (review) return;
      setState(() {
        response8 = response;
      });
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
                        color: AppColors.purple.withOpacity(0.65),
                        fontSize: 32,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              HorizontalNonImageQuestion(
                correctResponse: 1,
                review: review,
                setResponse: setResponse1,
                response: response1,
                question:
                    '¿Por cuantos elementos se conforman las figuras musicales?.',
                labels: const ['4', '3', '2', '5'],
              ),
              VerticalImageQuestion(
                question: '¿Cuál es el nombre de esta figura?.',
                imagePath: 'assets/images/figure_1.png',
                labels: const ['Blanca', 'Redonda', 'Corchea'],
                setResponse: setResponse2,
                response: response2,
                correctResponse: 1,
                review: review,
              ),
              VerticalImageQuestion(
                question: '¿Como se llama esta parte de la figura?',
                imagePath: 'assets/images/nucleo.png',
                labels: const ['Plica', 'Núcleo', 'Corchete'],
                setResponse: setResponse3,
                response: response3,
                correctResponse: 1,
                review: review,
              ),
              VerticalImageQuestion(
                question: '¿Cuántos tiempos dura esta figura?',
                imagePath: 'assets/images/figure_3.png',
                labels: const ['2 tiempos', '1/2 tiempo', '1 tiempo'],
                setResponse: setResponse4,
                response: response4,
                correctResponse: 2,
                review: review,
              ),
              VerticalImageQuestion(
                question: '¿Como se llama esta parte de la figura?',
                imagePath: 'assets/images/plica.png',
                labels: const ['Plica', 'Núcleo', 'Corchete'],
                setResponse: setResponse5,
                response: response5,
                correctResponse: 0,
                review: review,
              ),
              VerticalImageQuestion(
                question: '¿Cuántos tiempos dura esta figura?',
                imagePath: 'assets/images/figure_4.png',
                labels: const ['1/2 tiempo', '4 tiempos', '1/4 tiempo'],
                setResponse: setResponse6,
                response: response6,
                correctResponse: 0,
                review: review,
              ),
              VerticalImageQuestion(
                question: '¿Cuál es el nombre de esta figura?.',
                imagePath: 'assets/images/figure_2.png',
                labels: const ['Blanca', 'Fusa', 'Corchea'],
                setResponse: setResponse7,
                response: response7,
                correctResponse: 0,
                review: review,
              ),
              VerticalImageQuestion(
                question: '¿Como se llama esta parte de la figura?',
                imagePath: 'assets/images/corchete.png',
                labels: const ['Plica', 'Núcleo', 'Corchete'],
                setResponse: setResponse8,
                response: response8,
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
                  response6 == null ||
                  response7 == null ||
                  response8 == null) {
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
