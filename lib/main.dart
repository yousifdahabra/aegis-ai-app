import 'package:ai_safety_app/bloc/login/login_bloc.dart';
import 'package:ai_safety_app/bloc/tests/tests_bloc.dart';
import 'package:ai_safety_app/bloc/user_expert_requests/user_expert_request_bloc.dart';
import 'package:ai_safety_app/data/repositories/tests_repository.dart';
import 'package:ai_safety_app/data/repositories/user_expert_requests_repository.dart';
import 'package:ai_safety_app/theme/app_theme.dart';
import 'package:ai_safety_app/views/intro_screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ai_safety_app/bloc/auth/auth_bloc.dart';
import 'package:ai_safety_app/data/repositories/auth_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(AuthRepository()),
        ),
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(AuthRepository()),
        ),
        BlocProvider<UserExpertRequestBloc>(
          create: (context) =>
              UserExpertRequestBloc(UserExpertRequestRepository()),
        ),
        BlocProvider<TestsBloc>(
          create: (context) => TestsBloc(TestsRepository()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'AegisAI',
        theme: AppTheme.lightTheme,
        home: const OnboardingScreen(),
      ),
    );
  }
}
