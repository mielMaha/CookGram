import 'package:cookgram/core/error/failures.dart';
import 'package:cookgram/core/usecases/usecase.dart';
import 'package:cookgram/features/search/domain/entities/meal_entity.dart';
import 'package:cookgram/features/search/domain/repositories/recipe_repository.dart';
import 'package:dartz/dartz.dart';

class GetPopularRecipe implements UseCase<List<MealEntity>, NoParams>{
  @override

final RecipeRepository recipeRepository;

  GetPopularRecipe(this.recipeRepository);
  Future<Either<Failure, List<MealEntity>>> call(params) {
    return recipeRepository.getPopularRecipes();
  }

  

}