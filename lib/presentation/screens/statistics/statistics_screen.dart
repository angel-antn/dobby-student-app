import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app/presentation/components/results/stats.dart';
import 'package:student_app/providers/user_provider.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: Stats(
        userId: userProvider.user!.id!,
        isProfessor: false,
      ),
    );
  }
}
