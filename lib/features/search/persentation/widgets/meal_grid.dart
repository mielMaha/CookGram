import 'dart:developer';

import 'package:cookgram/features/search/persentation/cubits/meal_cubit.dart';
import 'package:cookgram/features/search/persentation/cubits/meal_states.dart';
import 'package:cookgram/features/search/persentation/views/meal_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MealGrid extends StatelessWidget {
  const MealGrid({
    super.key,
    required this.meals,
  });

  final List meals;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.85,
      ),
      itemCount: meals.length,
      itemBuilder: (context, index) {
        final meal = meals[index];
        return BlocListener<SearchMealsCubit, MealState>(
          listener: (context, state) {
            if (state is MealLoaded) {
              log('state: $state');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const MealDetailsView()),
              );
            }
          },
          child: _MealItem(meal: meal),
        );
      },
    );
  }
}

class _MealItem extends StatelessWidget {
  const _MealItem({super.key, required this.meal});

  final dynamic meal;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async{
        context.read<SearchMealsCubit>().searchDetails(meal.id);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MealDetailsView(),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(2, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              meal.thumbnail,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) =>
                  const Icon(Icons.image_not_supported),
            ),
            const SizedBox(height: 8),
            Text(
              meal.name,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
