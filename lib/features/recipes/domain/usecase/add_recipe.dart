import 'package:cookgram/core/error/failures.dart';
import 'package:cookgram/core/usecases/usecase.dart';
import 'package:cookgram/features/recipes/domain/entities/recipe_entity.dart';
import 'package:cookgram/features/recipes/domain/repositories/recipe_maker_repository.dart';
import 'package:dartz/dartz.dart';

class AddRecipe implements UseCase<void, RecipeEntity> {
  RecipeMakerRepository recipeMakerRepository;

  AddRecipe(this.recipeMakerRepository);
  @override
  Future<Either<Failure, void>> call(params) {
    return recipeMakerRepository.addRecipe(params);
  
  }
}