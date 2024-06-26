import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:student_app/presentation/theme/app_theme.dart';
import 'package:student_app/providers/user_provider.dart';
import 'package:student_app/router/router_config.dart';

class AppProviderTree extends StatelessWidget {
  const AppProviderTree({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
      ],
      child: const DobbyApp(),
    );
  }
}

class DobbyApp extends StatelessWidget {
  const DobbyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp.router(
      title: 'Dobby app',
      theme: AppTheme.themeData,
      debugShowCheckedModeBanner: false,
      routeInformationParser: AppRouter().router.routeInformationParser,
      routerDelegate: AppRouter().router.routerDelegate,
      routeInformationProvider: AppRouter().router.routeInformationProvider,
    );
  }
}
