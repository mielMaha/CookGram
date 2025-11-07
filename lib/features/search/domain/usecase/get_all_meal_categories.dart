import 'package:cookgram/core/error/failures.dart';
import 'package:cookgram/core/usecases/usecase.dart';
import 'package:cookgram/features/search/domain/entities/categories_entity.dart';
import 'package:cookgram/features/search/domain/repositories/recipe_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllMealCategories implements UseCase<List<CategoriesEntity>, NoParams> {
  final RecipeRepository recipeRepository;


  GetAllMealCategories(this.recipeRepository);

  @override
  Future<Either<Failure, List<CategoriesEntity>>> call(NoParams params) {
    return recipeRepository.getAllMealCategoriesList();
  }
}
