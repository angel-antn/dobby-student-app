import 'package:flutter/material.dart';
import 'package:student_app/presentation/components/buttons/primary_button.dart';
import 'package:student_app/presentation/theme/app_colors.dart';

class MusicFiguresTutorial2 extends StatelessWidget {
  const MusicFiguresTutorial2({super.key, required this.increaseIndex});

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
                      color: AppColors.primaryColor.withOpacity(0.1),
                      blurRadius: 2)
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
                        'Tiempos',
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
                  Container(
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.primaryColor.withOpacity(0.25),
                    ),
                    padding: const EdgeInsets.all(24),
                    child: const Column(
                      children: [
                        Text(
                          'Una de las características del sonido es la duración, que es el tiempo que dura una canción, una melodía o un sonido en particular.',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'En la música existen 7 figuras musicales las cuales son:',
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
                        border: Border.all(color: AppColors.primaryColor)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 70,
                            child: Opacity(
                              opacity: 0.7,
                              child: Image.asset('assets/images/figure_1.png'),
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
                        border: Border.all(color: AppColors.primaryColor)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            height: 70,
                            child: Opacity(
                              opacity: 0.7,
                              child: Image.asset('assets/images/figure_2.png'),
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
                        border: Border.all(color: AppColors.primaryColor)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 70,
                            child: Opacity(
                              opacity: 0.7,
                              child: Image.asset('assets/images/figure_3.png'),
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
                        border: Border.all(color: AppColors.primaryColor)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 70,
                            child: Opacity(
                              opacity: 0.7,
                              child: Image.asset('assets/images/figure_4.png'),
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
                        border: Border.all(color: AppColors.primaryColor)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 70,
                            child: Opacity(
                              opacity: 0.7,
                              child: Image.asset('assets/images/figure_5.png'),
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
                        border: Border.all(color: AppColors.primaryColor)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 70,
                            child: Opacity(
                              opacity: 0.7,
                              child: Image.asset('assets/images/figure_6.png'),
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
                        border: Border.all(color: AppColors.primaryColor)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 70,
                            child: Opacity(
                              opacity: 0.7,
                              child: Image.asset('assets/images/figure_7.png'),
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
