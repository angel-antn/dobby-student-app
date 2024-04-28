import 'package:go_router/go_router.dart';
import 'package:student_app/presentation/components/transitions/swipe_to_left_transition.dart';
import 'package:student_app/presentation/screens/auth/auth_screen.dart';
import 'package:student_app/router/router_const.dart';

class AppRouter {
  static final AppRouter _singleton = AppRouter._internal();

  factory AppRouter() {
    return _singleton;
  }

  AppRouter._internal();

  final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/auth',
    routes: [
      GoRoute(
        path: '/auth',
        name: AppRouterConstants.authScreen,
        pageBuilder: (context, state) {
          return SwipeToLeftTransition(child: const AuthScreen());
        },
      ),
    ],
  );
}
