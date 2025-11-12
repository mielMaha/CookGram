import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cookgram/features/search/persentation/cubits/meal_cubit.dart';
import 'package:cookgram/features/search/persentation/cubits/meal_states.dart';
import 'package:cookgram/features/search/persentation/widgets/cuisines_item.dart';

class CuisinesGridWrapper extends StatelessWidget {
  const CuisinesGridWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchMealsCubit, MealState>(
      builder: (context, state) {
        if (state is MealLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CategoriesLoaded) {
          final cuisines = state.categories
    .map((category) => {
          'name': category.name ?? 'No name',
          'thumbnail': category.imageUrl ?? '',
        })
    .toList();


          return CuisinesGrid(cuisines: cuisines);
        } else if (state is MealError) {
          return Center(child: Text('Error: ${state.failure}'));
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class CuisinesGrid extends StatelessWidget {
  const CuisinesGrid({super.key, required this.cuisines});
  final List<Map<String, String>> cuisines;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.85,
      ),
      itemCount: cuisines.length,
      itemBuilder: (context, index) {
        final cuisine = cuisines[index];
        return CuisinesCostumItem(cuisine: cuisine);
      },
    );
  }
}
