import '../../domain/entities/recipe_entity.dart';

class RecipeModel extends RecipeEntity {
  RecipeModel({
    required String title,
    required String ingredients,
    required String steps,
    required String imageUrl,
  }) : super(
          title: title,
          ingredients: ingredients,
          steps: steps,
          imageUrl: imageUrl,
        );

  factory RecipeModel.fromJson(Map<String, dynamic> json) => RecipeModel(
        title: json['title'] as String,
        ingredients: json['ingredients'] as String,
        steps: json['steps'] as String,
        imageUrl: json['image_url'] as String,
      );

  Map<String, dynamic> toJson() => {
        
        'title': title,
        'ingredients': ingredients,
        'steps': steps,
        'image_url': imageUrl,
        
      };
}