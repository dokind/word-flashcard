import 'package:flutter/src/widgets/framework.dart' show BuildContext;
import 'package:go_router/go_router.dart';
import 'package:labo001/shared/utils/utils.dart';

import 'modules/modules.dart';

// GoRouter configuration
final GoRouter router = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: homePath,
      builder: (BuildContext context, GoRouterState state) =>
          const HomeScreen(),
    ),
    GoRoute(
      path: splashPath,
      builder: (BuildContext context, GoRouterState state) =>
          const SplashScreen(),
    ),
    GoRoute(
      path: splashPath,
      builder: (BuildContext context, GoRouterState state) =>
          const SplashScreen(),
    ),
    GoRoute(
      path: loginPath,
      builder: (BuildContext context, GoRouterState state) =>
          const LoginScreen(),
    ),
  ],
  debugLogDiagnostics: true,
);
