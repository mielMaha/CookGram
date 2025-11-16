import 'package:cookgram/features/search/domain/entities/meal_entity.dart';
import 'package:cookgram/features/search/persentation/cubits/meal_cubit.dart';
import 'package:cookgram/features/search/persentation/cubits/meal_states.dart';
import 'package:cookgram/features/search/persentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class MealDetailsView extends StatelessWidget {
  const MealDetailsView({super.key});


  void _goHome(BuildContext context) {
    context.read<SearchMealsCubit>().searchCategories();
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => Homeview()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meal Details"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => _goHome(context),
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          _goHome(context);
          return false;
        },
        child: BlocBuilder<SearchMealsCubit, MealState>(
          builder: (context, state) {
            if (state is MealLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is MealLoaded) {
              final meal = state.meals[0];

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   
                   Image.network(
                            meal.thumbnail,
                            width: double.infinity,
                            height: 250,
                            fit: BoxFit.cover,
                          ),
                    const SizedBox(height: 8),

                
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        '${meal.category} • ${meal.area}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                  
                    _IngredientsPart(meal: meal),

                    const SizedBox(height: 16),

                   
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Instructions',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Text(meal.instructions),
                    ),

                   
                    if (meal.youtubeUrl != null && meal.youtubeUrl!.isNotEmpty)
                      _YouTubeBotton(meal: meal),
                  ],
                ),
              );
            } else if (state is MealError) {
              return Center(child: Text(state.failure.message));
            } else {
              return const Center(child: Text("No data available"));
            }
          },
        ),
      ),
    );
  }
}

class _YouTubeBotton extends StatelessWidget {
  const _YouTubeBotton({
    super.key,
    required this.meal,
  });

  final MealEntity meal;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GestureDetector(
        onTap: () async {
          final url = Uri.parse(meal.youtubeUrl!);
          if (await canLaunchUrl(url)) {
            await launchUrl(
              url,
              mode: LaunchMode.externalApplication,
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Cannot open YouTube link'),
              ),
            );
          }
        },
        child: const Text(
          'Watch on YouTube',
          style: TextStyle(
            color: Colors.blue,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}

class _IngredientsPart extends StatelessWidget {
  const _IngredientsPart({
    super.key,
    required this.meal,
  });

  final MealEntity meal;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Ingredients',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 8),
        ...List.generate(meal.ingredients.length, (index) {
          final ingredient = meal.ingredients[index];
          final measure = meal.measures.length > index
              ? meal.measures[index]
              : '';
          if (ingredient.isEmpty)
            return const SizedBox.shrink();
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 2,
            ),
            child: Text('- $ingredient : $measure'),
          );
        }),
      ],
    );
  }
}
