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
      final bool loggedIn = authCubit.state.status == AuthStatus.authenticated;
      final bool loggingIn = state.matchedLocation == '/login';
      final bool registering = state.matchedLocation == '/registration';

      if (!loggedIn && !loggingIn && !registering) {
        return '/login';
      } 

      if(loggedIn && (loggingIn || registering)){
        return '/';
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
