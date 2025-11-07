import 'package:cookgram/features/search/domain/entities/meal_entity.dart';


class MealModel extends MealEntity {
 
  final String id;
  final String name;
  final String category;
  final String area;
  final String instructions;
  final String thumbnail;
  final String? tags;
  final String? youtubeUrl;
  final List<String> ingredients;
  final List<String> measures;

  const MealModel({
    required this.id,
    required this.name,
    required this.category,
    required this.area,
    required this.instructions,
    required this.thumbnail,
    this.tags,
    this.youtubeUrl,
    required this.ingredients,
    required this.measures,
  }) : super(
          id: id,
          name: name,
          category: category,
          area: area,
          instructions: instructions,
          thumbnail: thumbnail,
          tags: tags,
          youtubeUrl: youtubeUrl,
          ingredients: ingredients,
          measures: measures,
        );

  factory MealModel.fromJson(Map<String, dynamic> json) {
    final ingredients = <String>[];
    final measures = <String>[];

 
    for (int i = 1; i <= 20; i++) {
      final ingredient = json['strIngredient$i'];
      final measure = json['strMeasure$i'];

      if (ingredient != null && ingredient.toString().isNotEmpty) {
        ingredients.add(ingredient.toString());
      }
      if (measure != null && measure.toString().isNotEmpty) {
        measures.add(measure.toString());
      }
    }

    return MealModel(
      id: json['idMeal'] ?? '',
      name: json['strMeal'] ?? '',
      category: json['strCategory'] ?? '',
      area: json['strArea'] ?? '',
      instructions: json['strInstructions'] ?? '',
      thumbnail: json['strMealThumb'] ?? '',
      tags: json['strTags'],
      youtubeUrl: json['strYoutube'],
      ingredients: ingredients,
      measures: measures,
    );
  }
}
