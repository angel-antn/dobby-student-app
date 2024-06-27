import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:student_app/presentation/components/buttons/touchable_opacity.dart';
import 'package:student_app/presentation/theme/app_colors.dart';
import 'package:student_app/router/router_const.dart';

class ProfessorScreen extends StatelessWidget {
  const ProfessorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(48),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 370,
              padding: const EdgeInsets.all(65),
              decoration: BoxDecoration(
                  color: AppColors.green.withOpacity(0.7),
                  shape: BoxShape.circle),
              child: Image.asset(
                'assets/images/professor_dobby_sticker_border.png',
              ),
            ),
            const SizedBox(
              height: 34,
            ),
            const Text(
              'Aquí puede realizar el seguimiento detallado de los resultados de sus estudiantes, analizar el progreso y planificar estrategias educativas efectivas.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 32,
            ),
            TouchableOpacity(
              onTap: () {
                context.pushNamed(AppRouterConstants.teacherScreen);
              },
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.green.withOpacity(0.85),
                ),
                child: const Text(
                  'Ver estudiantes',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
