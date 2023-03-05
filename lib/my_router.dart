import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart' show BuildContext;
import 'package:go_router/go_router.dart';
import 'package:labo001/modules/auth/screens/onboard_screen.dart';

import 'modules/modules.dart';
import 'shared/shared.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

class ScreenPaths {
  static const String home = '/';
  static const String splash = '/splash';
  static const String onboard = '/onboard';
  static const String login = '/login';
}

// GoRouter configuration
final GoRouter router = GoRouter(
  initialLocation: ScreenPaths.splash,
  routes: [
    ShellRoute(
      navigatorKey: _rootNavigatorKey,
      builder: (BuildContext context, GoRouterState state, Widget child) =>
          MyScaffold(child: child),
      routes: [
        AppRoute(
          ScreenPaths.home,
          (GoRouterState state) => const HomeScreen(),
        ),
        GoRoute(
          path: ScreenPaths.login,
          builder: (BuildContext context, GoRouterState state) =>
              const LoginScreen(),
        ),
        GoRoute(
          path: ScreenPaths.onboard,
          builder: (BuildContext context, GoRouterState state) =>
              const OnboardScreen(),
        ),
      ],
    ),
    GoRoute(
      path: ScreenPaths.splash,
      builder: (BuildContext context, GoRouterState state) =>
          const SplashScreen(),
    ),
  ],
  debugLogDiagnostics: true,
);

/// Custom GoRoute sub-class to make the router declaration easier to read
class AppRoute extends GoRoute {
  AppRoute(String path, Widget Function(GoRouterState s) builder,
      {List<GoRoute> routes = const [], this.useFade = false})
      : super(
          path: path,
          routes: routes,
          pageBuilder: (BuildContext context, GoRouterState state) {
            final Scaffold pageContent = Scaffold(
              body: builder(state),
              resizeToAvoidBottomInset: false,
            );
            if (useFade) {
              return CustomTransitionPage(
                key: state.pageKey,
                child: pageContent,
                transitionsBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation,
                        Widget child) =>
                    FadeTransition(opacity: animation, child: child),
              );
            }
            return CupertinoPage(child: pageContent);
          },
        );
  final bool useFade;
}
