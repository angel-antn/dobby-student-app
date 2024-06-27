import 'package:flutter/material.dart';
import 'package:student_app/presentation/components/buttons/primary_button.dart';
import 'package:student_app/presentation/theme/app_colors.dart';

class SilencesTutorial extends StatelessWidget {
  const SilencesTutorial({super.key, required this.increaseIndex});

  final Function increaseIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: AppColors.green.withOpacity(0.1), blurRadius: 2)
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
                        'Silencios',
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
                  Container(
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.green.withOpacity(0.25),
                    ),
                    padding: const EdgeInsets.all(24),
                    child: const Column(
                      children: [
                        Text(
                          'Así como las figuras anteriormente vistas representan un sonido, existen otras figuras que representan la ausencia del sonido, es decir, el silencio. Son aquellas pequeñas pausas que se hacen algunas veces entre una nota y otra.',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Dichas figuras están relacionadas con las que vimos en las lecciones anteriores y tienen la misma duración.',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.only(bottom: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: AppColors.green)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 80,
                            height: 70,
                            child: Opacity(
                              opacity: 0.7,
                              child: Image.asset('assets/images/silence_1.png'),
                            ),
                          ),
                          const Text('Redonda: 4 tiempos')
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.only(bottom: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: AppColors.green)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 60,
                            height: 70,
                            child: Opacity(
                              opacity: 0.7,
                              child: Image.asset('assets/images/silence_2.png'),
                            ),
                          ),
                          const Text('Blanca: 2 tiempos')
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.only(bottom: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: AppColors.green)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 70,
                            height: 70,
                            child: Opacity(
                              opacity: 0.7,
                              child: Image.asset('assets/images/silence_3.png'),
                            ),
                          ),
                          const Text('Negra: 1 tiempo')
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.only(bottom: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: AppColors.green)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 60,
                            height: 70,
                            child: Opacity(
                              opacity: 0.7,
                              child: Image.asset('assets/images/silence_4.png'),
                            ),
                          ),
                          const Text('Corchea: 1/2 tiempo')
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.only(bottom: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: AppColors.green)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 70,
                            child: Opacity(
                              opacity: 0.7,
                              child: Image.asset('assets/images/silence_5.png'),
                            ),
                          ),
                          const Text('Semicorchea: 1/4 tiempo')
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.only(bottom: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: AppColors.green)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 70,
                            child: Opacity(
                              opacity: 0.7,
                              child: Image.asset('assets/images/silence_6.png'),
                            ),
                          ),
                          const Text('Fusa: 1/8 tiempo')
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.only(bottom: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: AppColors.green)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 70,
                            child: Opacity(
                              opacity: 0.7,
                              child: Image.asset('assets/images/silence_7.png'),
                            ),
                          ),
                          const Text('Semifusa: 1/16 tiempo')
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: SizedBox(
                  height: 100,
                  child: Image.asset(
                      'assets/images/professor_dobby_sticker_border.png')),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        PrimaryButton(onTap: increaseIndex, text: 'Siguiente')
      ],
    );
  }
}
