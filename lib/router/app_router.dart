import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:herppro/auth/cubit/auth_cubit.dart';
import 'package:herppro/home/view/home_page.dart';
import 'package:herppro/login/view/login_page.dart';
import 'package:herppro/registration/view/registration_page.dart';
import 'package:herppro/splash/view/splash_page.dart';

class AppRouter {
  final AuthCubit authCubit;

  AppRouter(this.authCubit);

  late final GoRouter router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        },
      ),
      GoRoute(
        path: '/login',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginPage();
        },
      ),
      GoRoute(
        path: '/registration',
        builder: (BuildContext context, GoRouterState state) {
          return const RegistrationPage();
        },
      ),
      GoRoute(
        path: '/splash',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashPage();
        },
      ),
    ],
    redirect: (BuildContext context, GoRouterState state) {
      final authStatus = authCubit.state.status;
      final location = state.matchedLocation;

      if (authStatus == AuthStatus.unknown) {
        return '/splash';
      }

      final loggedIn = authStatus == AuthStatus.authenticated;
      final onAuthRoutes = location == '/login' || location == '/registration';
      final onSplash = location == '/splash';

      if (loggedIn) {
        if (onAuthRoutes || onSplash) {
          return '/';
        }
        return null;
      }

      if (!loggedIn) {
        if (!onAuthRoutes) {
          return '/login';
        }
        return null;
      }

      return null;
    },
    refreshListenable: GoRouterRefreshStream(authCubit.stream),
  );
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
      (dynamic _) => notifyListeners(),
    );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
