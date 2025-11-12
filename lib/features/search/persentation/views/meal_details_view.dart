import 'package:cookgram/features/search/domain/entities/meal_entity.dart';
import 'package:flutter/material.dart';

class MealDetailsView extends StatelessWidget {
 
final MealEntity meal = MealEntity(
  id: '52771',
  name: 'Spicy Arrabiata Penne',
  category: 'Vegetarian',
  area: 'Italian',
  instructions: 'Bring a large pot of water to a boil. Add kosher salt to the boiling water, then add the pasta. Cook according to the package instructions, about 9 minutes. In a large skillet over medium-high heat, add the olive oil and heat until the oil starts to shimmer. Add the garlic and cook, stirring, until fragrant, 1 to 2 minutes. Add the chopped tomatoes, red chile flakes, Italian seasoning and salt and pepper to taste. Bring to a boil and cook for 5 minutes. Remove from the heat and add the chopped basil. Drain the pasta and add it to the sauce. Garnish with Parmigiano-Reggiano flakes and more basil and serve warm.',
  thumbnail: 'https://www.themealdb.com/images/media/meals/ustsqw1468250014.jpg',
  tags: 'Pasta,Curry',
  youtubeUrl: 'https://www.youtube.com/watch?v=1IszT_guI08',
  ingredients: [
    'penne rigate',
    'olive oil',
    'garlic',
    'chopped tomatoes',
    'red chilli flakes',
    'italian seasoning',
    'basil',
    'Parmigiano-Reggiano',
  ],
  measures: [
    '1 pound',
    '1/4 cup',
    '3 cloves',
    '1 tin',
    '1/2 teaspoon',
    '1/2 teaspoon',
    '6 leaves',
    'sprinkling',
  ],
);

   MealDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(meal.safeThumbnail, width: double.infinity, height: 250, fit: BoxFit.cover),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                '${meal.category} • ${meal.safeArea}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Ingredients',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            ...List.generate(meal.ingredients.length, (index) {
              final ingredient = meal.safeIngredients[index];
              final measure = meal.safeMeasures[index];
              if (ingredient.isEmpty) return SizedBox.shrink();
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                child: Text('- $ingredient : $measure'),
              );
            }),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Instructions',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(meal.safeInstructions),
            ),
            if (meal.safeYoutubeUrl.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(16),
                child: GestureDetector(
                  onTap: () {
                  
                  },
                  child: Text(
                    'Watch on YouTube',
                    style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
