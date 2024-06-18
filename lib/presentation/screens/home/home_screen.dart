import 'package:flutter/material.dart';
import 'package:student_app/presentation/components/buttons/primary_button.dart';
import 'package:student_app/presentation/components/buttons/touchable_opacity.dart';
import 'package:student_app/presentation/theme/app_colors.dart';
import 'package:student_app/utils/toast/show_toast.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          _LevelCard(
            title: 'Figuras musicales',
            color: AppColors.purple.withOpacity(0.65),
            image: Image.asset('assets/images/libro-de-musica.png'),
            body: 'Comienza aprendiendo que son las figuras musicales',
            onTap: () {},
            number: 1,
          ),
          _LevelCard(
            title: 'Compás musical',
            color: Colors.pink.withOpacity(0.6),
            image: Image.asset('assets/images/metronomo.png'),
            body: 'Continúa aprendiendo sobre el compás en la música',
            onTap: () {
              showToast('Proximamente...');
            },
            number: 2,
          ),
          _LevelCard(
            title: 'Notas musicales',
            color: Colors.amber.withOpacity(0.6),
            image: Image.asset('assets/images/notas-musica.png'),
            body: 'Es tiempo de repasar las nota musicales: DO-RE-MI...',
            onTap: () {
              showToast('Proximamente...');
            },
            number: 3,
          ),
        ],
      ),
    ));
  }
}

class _LevelCard extends StatelessWidget {
  const _LevelCard({
    required this.title,
    required this.color,
    required this.image,
    required this.body,
    required this.onTap,
    required this.number,
  });

  final String title;
  final Color color;
  final Image image;
  final String body;
  final Function onTap;
  final int number;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 24, right: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TouchableOpacity(
            onTap: () => onTap(),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    offset: Offset(0, 10),
                  )
                ],
                color: color,
              ),
              child: SizedBox(
                height: 100,
                width: 100,
                child: image,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 6,
                ),
                Text(
                  'Nivel $number',
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 1,
                ),
                Text(
                  body,
                  style: const TextStyle(
                    color: Colors.black87,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 2,
                ),
                const SizedBox(
                  height: 15,
                ),
                PrimaryButton(
                  onTap: () => onTap(),
                  text: 'Empezar',
                  color: color,
                  textColor: Colors.white,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
