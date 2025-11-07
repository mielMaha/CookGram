import 'package:cookgram/core/error/failures.dart';
import 'package:cookgram/core/usecases/usecase.dart';
import 'package:cookgram/features/search/domain/entities/Ingredient_entite.dart';
import 'package:cookgram/features/search/domain/repositories/recipe_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllMealIngredient implements UseCase<List<IngredientEntity>, NoParams> {
  final RecipeRepository recipeRepository;


  GetAllMealIngredient(this.recipeRepository);

  @override
  Future<Either<Failure, List<IngredientEntity>>> call(NoParams params) {
    return recipeRepository.getALLMealIngredientsList();
  }
}
