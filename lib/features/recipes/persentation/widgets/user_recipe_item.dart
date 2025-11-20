import 'package:cookgram/features/recipes/domain/entities/recipe_entity.dart';
import 'package:flutter/material.dart';

class UserRecipeItem extends StatelessWidget {
  const UserRecipeItem({
    super.key,
    required this.recipe,
  });

  final RecipeEntity recipe;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      expandedAlignment: Alignment.topLeft,
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      tilePadding: EdgeInsetsDirectional.only(start: 10),
      childrenPadding: EdgeInsetsDirectional.only(start: 10),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            recipe.title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            clipBehavior: Clip.antiAlias,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(recipe.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
      children: [
        Text(
          'ingredients',
    
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          recipe.ingredients,
          style: const TextStyle(fontSize: 16),
        ),
        Text(
          'steps',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(recipe.steps, style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}
