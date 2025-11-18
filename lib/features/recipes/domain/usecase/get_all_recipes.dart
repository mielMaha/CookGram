import 'package:cookgram/core/error/failures.dart';
import 'package:cookgram/core/usecases/usecase.dart';
import 'package:cookgram/features/recipes/domain/entities/recipe_entity.dart';
import 'package:cookgram/features/recipes/domain/repositories/recipe_maker_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllRecipes  implements UseCase<List<RecipeEntity>, NoParams>{
  RecipeMakerRepository recipeMakerRepository;

  GetAllRecipes(this.recipeMakerRepository);
  @override
  Future<Either<Failure, List<RecipeEntity>>> call(params) {
  
    return recipeMakerRepository.getAllRecipes();
  }
}