import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talking_app/core/theme/app_colors.dart';
import 'package:talking_app/features/auth/bloc/splash/splash_bloc.dart';
import 'package:talking_app/features/auth/bloc/splash/splash_event.dart';
import 'package:talking_app/features/auth/bloc/splash/splash_state.dart';
import 'package:talking_app/features/auth/view/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashBloc()..add(StartSplash()),
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is SplashFinished) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const LoginPage()),
            );
          }
        },
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(gradient: AppColors.appGradient),
            child: Center(
              child: Image.asset("assets/img/app_logo.png", height: 150),
            ),
          ),
        ),
      ),
    );
  }
}
