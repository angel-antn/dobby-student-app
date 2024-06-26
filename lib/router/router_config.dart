import 'package:go_router/go_router.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:student_app/data/local/preferences.dart';
import 'package:student_app/presentation/components/transitions/swipe_to_left_transition.dart';
import 'package:student_app/presentation/components/transitions/swipe_to_right_transition.dart';
import 'package:student_app/presentation/screens/auth/auth_screen.dart';
import 'package:student_app/presentation/screens/main/main_screen.dart';
import 'package:student_app/presentation/screens/music-figures/music_figures_screen.dart';
import 'package:student_app/presentation/screens/silences/silences_screen.dart';
import 'package:student_app/presentation/screens/student/student_screen.dart';
import 'package:student_app/presentation/screens/teacher/teacher_screen.dart';
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
      GoRoute(
        path: '/',
        name: AppRouterConstants.mainScreen,
        pageBuilder: (context, state) {
          return SwipeToRightTransition(child: const MainScreen());
        },
      ),
      GoRoute(
        path: '/music-figures',
        name: AppRouterConstants.musicFiguresScreen,
        pageBuilder: (context, state) {
          return SwipeToRightTransition(child: const MusicFiguresScreen());
        },
      ),
      GoRoute(
        path: '/silences',
        name: AppRouterConstants.silencesScreen,
        pageBuilder: (context, state) {
          return SwipeToRightTransition(child: const SilencesScreen());
        },
      ),
      GoRoute(
        path: '/teacher',
        name: AppRouterConstants.teacherScreen,
        pageBuilder: (context, state) {
          return SwipeToRightTransition(child: const TeacherScreen());
        },
      ),
      GoRoute(
        path: '/student/:id',
        name: AppRouterConstants.studentScreen,
        pageBuilder: (context, state) {
          return SwipeToRightTransition(
              child: StudentScreen(
            id: state.pathParameters['id']!,
          ));
        },
      ),
    ],
    redirect: (context, state) {
      final token = Preferences.token;

      if (token != null &&
          !JwtDecoder.isExpired(token) &&
          (state.fullPath == '/auth' || state.fullPath == '/recover')) {
        return '/';
      }

      if ((token == null || JwtDecoder.isExpired(token)) &&
          state.fullPath != '/auth' &&
          state.fullPath != '/recover') {
        return '/auth';
      }

      return null;
    },
  );
}
