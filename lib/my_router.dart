import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';

import 'modules/modules.dart';

// GoRouter configuration
final GoRouter router = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (BuildContext context, GoRouterState state) =>
          const SplashScreen(),
    ),
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) =>
          const HomeScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) =>
          const LoginScreen(),
    ),
  ],
  debugLogDiagnostics: true,
);
