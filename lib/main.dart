import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herppro/auth/repository/auth_repository.dart';
import 'package:herppro/router/app_router.dart';
import 'auth/cubit/auth_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(),
      child: BlocProvider(
        create: (context) => AuthCubit(
          authRepository: context.read<AuthRepository>(),
        ),
        child: Builder(builder: (context) {
          return MaterialApp.router(
            routerConfig: AppRouter(context.read<AuthCubit>()).router,
            title: 'HerpPro Montitoring',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
          );
        }),
      ),
    );
  }
}
