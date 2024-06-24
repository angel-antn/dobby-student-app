import 'package:flutter/material.dart';
import 'package:student_app/presentation/components/buttons/primary_button.dart';
import 'package:student_app/presentation/theme/app_colors.dart';

class MusicFiguresTutorial extends StatelessWidget {
  const MusicFiguresTutorial({super.key, required this.increaseIndex});

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
                        'Lección 1',
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
                          'Las figuras musicales son un conjunto de símbolos que se utilizan para representar la música de forma visual.',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Estas figuras se caracterizan por tener 3 elementos, los cuales te enseñare ahora mismo.',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 45,
                      ),
                      Expanded(
                          child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(color: AppColors.primaryColor)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.asset(
                              'assets/images/music_figures_parts.png'),
                        ),
                      )),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
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
