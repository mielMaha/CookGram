import 'package:cookgram/features/recipes/domain/entities/recipe_entity.dart';

abstract class RecipeStates {}
//states get recipes 

class RecipeInitial extends RecipeStates {}
class RecipeLoading extends RecipeStates {}


class RecipeLoaded extends RecipeStates {
  final List<RecipeEntity> recipes;
  RecipeLoaded(this.recipes);
}

class RecipeError extends RecipeStates {
  final String message;
  RecipeError(this.message);
}

// states add recipe
class RecipeAddedSuccess extends RecipeStates {}

class RecipeAddedError extends RecipeStates {
  final String message;
  RecipeAddedError(this.message);
}

// states upload image
class ImageUpLoading extends RecipeStates {}

class ImageUpLoadedComplete extends RecipeStates {}


class ImageDownLoaded extends RecipeStates {
  final String imageUrl;
  ImageDownLoaded(this.imageUrl);
}

class ImageError extends RecipeStates {
  final String message;
  ImageError(this.message);
}
