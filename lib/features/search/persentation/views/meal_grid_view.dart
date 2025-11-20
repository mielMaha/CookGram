
import 'package:cookgram/features/search/persentation/cubits/meal_cubit.dart';

import 'package:cookgram/features/search/persentation/widgets/meal_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MealGridView extends StatelessWidget {
  final List meals;

  const MealGridView({super.key, required this.meals});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meals'), backgroundColor: Colors.white),
      body: WillPopScope(
        onWillPop: () async {
          context.read<SearchMealsCubit>().searchCategories();
          return true;
        },
        child: MealGrid(meals: meals),
      ),
    );
  }
}

