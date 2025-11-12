import 'package:cookgram/core/theme/app_colors.dart';
import 'package:cookgram/features/search/persentation/views/home_screen.dart';
import 'package:cookgram/features/search/persentation/cubits/meal_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: BlocProvider.of<SearchMealsCubit>(context),
            child:  Homeview(),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellowAppC,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: double.infinity),
          const Image(image: AssetImage('assets/logo.png'), height: 132, width: 150),
          Container(
            width: 172,
            height: 5,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.redAppC,
                  AppColors.whiteAppC.withOpacity(0.3),
                  AppColors.whiteAppC.withOpacity(0.3),
                  AppColors.whiteAppC.withOpacity(0.2),
                  AppColors.whiteAppC.withOpacity(0.2),
                ],
              ),
              borderRadius: BorderRadiusDirectional.circular(15),
            ),
          ),
        ],
      ),
    );
  }
}
