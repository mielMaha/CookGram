import 'package:cookgram/core/error/failures.dart';
import 'package:cookgram/core/usecases/usecase.dart';
import 'package:cookgram/features/search/domain/entities/meal_entity.dart';
import 'package:cookgram/features/search/domain/repositories/recipe_repository.dart';
import 'package:dartz/dartz.dart';

class GetMealDetailsById implements UseCase<MealEntity, String>{
  final RecipeRepository recipeRepository;

  GetMealDetailsById(this.recipeRepository);
  Future<Either<Failure, MealEntity>> call(params) {
    return recipeRepository.getMealDetails(params);
  }
}