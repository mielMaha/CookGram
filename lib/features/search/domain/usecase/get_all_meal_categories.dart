import 'package:cookgram/core/error/failures.dart';
import 'package:cookgram/core/usecases/usecase.dart';
import 'package:cookgram/features/search/domain/entities/meal_entity.dart';
import 'package:cookgram/features/search/domain/repositories/recipe_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllMealCategories implements UseCase<List<MealEntity>, NoParams> {
  final RecipeRepository recipeRepository;

  GetAllMealCategories(this.recipeRepository);

  @override
  Future<Either<Failure, List<MealEntity>>> call(NoParams params) {
    return recipeRepository.getAllMealCategories();
  }
}
