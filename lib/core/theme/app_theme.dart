import 'package:cookgram/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData themeData=ThemeData(
  scaffoldBackgroundColor: AppColors.whiteAppC,
bottomNavigationBarTheme: BottomNavigationBarThemeData(
  elevation: 0,
  backgroundColor: AppColors.whiteAppC,
  unselectedItemColor: Colors.grey,
  showUnselectedLabels: true,
  selectedItemColor: AppColors.yellowAppC,)
  
);