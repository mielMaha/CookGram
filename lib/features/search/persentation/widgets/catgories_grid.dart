import 'package:cookgram/features/search/persentation/views/meal_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/meal_cubit.dart';
import '../cubits/meal_states.dart';

class CatgoriesGrid extends StatelessWidget {
  const CatgoriesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchMealsCubit, MealState>(
      listener: (context, state) {
        if (state is MealLoaded) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => MealGridView(meals: state.meals)),
          );
        } else if (state is MealError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.failure.message)));
        }
      },
      builder: (context, state) {
        if (state is MealLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CategoriesLoaded) {
          final categories = state.categories;
          return GridView.builder(
            padding: const EdgeInsets.all(10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.85,
            ),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return GestureDetector(
                onTap: () {
                  context.read<SearchMealsCubit>().searchByCategory(
                    category.name ?? '',
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: const Offset(2, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        category.imageUrl ?? '',
                        width: 60,
                        height: 60,
                        errorBuilder: (_, __, ___) =>
                            const Icon(Icons.image_not_supported),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        category.name ?? 'No Name',
                        style: const TextStyle(fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        } else {
          return const Center(child: Text('No categories loaded.'));
        }
      },
    );
  }
}
