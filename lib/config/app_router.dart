import 'package:cloud_garage/features/auth/presentation/pages/auth_page.dart';
import 'package:cloud_garage/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const AuthPage(),
        routes: [
          GoRoute(
            path: 'dashboard',
            builder: (context, state) => const DashboardPage(),
          ),
          // GoRoute(
          //   path: 'billing',
          //   builder: (context, state) => const BillingScreen(),
          // ),
        ],
      ),
      // GoRoute(
      //   path: '/login',
      //   builder: (context, state) => const LoginScreen(),
      // ),
    ],
    // redirect: (context, state) {
    // final isLoggedIn = _checkAuthentication(); // Replace with your auth logic
    // final loggingIn = state.path == '/login';

    // if (!isLoggedIn && !loggingIn) return '/login';
    // if (isLoggedIn && loggingIn) return '/';
    // return null; // No redirection
    // },
  );

  // static bool _checkAuthentication() {
  //   // Implement authentication check logic
  //   return true; // Example: Replace with actual logic
  // }
}
