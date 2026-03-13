import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:herppro/home/view/home_page.dart';
import 'package:herppro/login/view/login_page.dart';
import 'package:herppro/registration/view/registration_page.dart';
import 'package:herppro/splash/view/splash_page.dart';

final GoRouter router = GoRouter(
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
);
