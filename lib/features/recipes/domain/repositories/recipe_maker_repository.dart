import 'dart:io';

import 'package:cookgram/core/error/failures.dart';
import 'package:cookgram/features/recipes/domain/entities/recipe_entity.dart';
import 'package:dartz/dartz.dart';

abstract class RecipeMakerRepository {
  Future<Either<Failure, void>> addRecipe(RecipeEntity recipe);
  Future<Either<Failure, List<RecipeEntity>>> getAllRecipes();
}