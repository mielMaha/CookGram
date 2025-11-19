class RecipeEntity {
  final String title;
  final String ingredients;
  final String steps;
  final String imageUrl;

  RecipeEntity({
    required this.title,
    required this.ingredients,
    required this.steps,
    required this.imageUrl,
  });

 Map<String, dynamic> toJson() => {
        
        'title': title,
        'ingredients': ingredients,
        'steps': steps,
        'image_url': imageUrl,
        
      };

}