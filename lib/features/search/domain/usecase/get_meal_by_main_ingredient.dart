import 'package:cookgram/core/error/failures.dart';
import 'package:cookgram/core/usecases/usecase.dart';
import 'package:cookgram/features/search/domain/entities/meal_entity.dart';
import 'package:cookgram/features/search/domain/repositories/recipe_repository.dart';
import 'package:dartz/dartz.dart';

class GetMealByMainIngredient implements UseCase<List<MealEntity>, String> {
  final RecipeRepository recipeRepository;

  GetMealByMainIngredient(this.recipeRepository);
  Future<Either<Failure, List<MealEntity>>> call(params) {
    return recipeRepository.getMealByIngredient(params);
  }
}
