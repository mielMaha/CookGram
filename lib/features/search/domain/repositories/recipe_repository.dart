import 'package:cookgram/core/error/failures.dart';
import 'package:cookgram/features/search/domain/entities/meal_entity.dart';
import 'package:dartz/dartz.dart';

abstract class RecipeRepository {

  Future<Either<Failure, List<MealEntity>>> getPopularRecipes();
  Future<Either<Failure, List<MealEntity>>> getMealByName(String name);
  Future<Either<Failure, List<MealEntity>>> getMealByCategory(String category);
  Future<Either<Failure, List<MealEntity>>> getMealByIngredient(String ingredient);
  Future<Either<Failure, List<MealEntity>>> getMealByArea(String area);
  Future<Either<Failure, MealEntity>> getMealDetails(String id);
  Future<Either<Failure, List<MealEntity>>> getAllMealCategories();



}