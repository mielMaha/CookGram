import 'package:cookgram/core/utils/app_theme.dart';
import 'package:cookgram/features/auth/persentaiton/views/Splash_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CookGram());
}

class CookGram extends StatelessWidget {
  const CookGram({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: SplashView(),
    );
  }
}
