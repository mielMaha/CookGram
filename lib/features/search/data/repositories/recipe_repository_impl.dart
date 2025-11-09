import 'package:cookgram/core/error/failures.dart';
import 'package:cookgram/features/search/data/datasources/recipe_remote_data_source.dart';
import 'package:cookgram/features/search/domain/entities/Ingredient_entite.dart';
import 'package:cookgram/features/search/domain/entities/categories_entity.dart';
import 'package:cookgram/features/search/domain/entities/meal_entity.dart';
import 'package:cookgram/features/search/domain/repositories/recipe_repository.dart';
import 'package:dartz/dartz.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeRemoteDataSource remoteDataSource;

  RecipeRepositoryImpl({ required this.remoteDataSource});
  @override
  Future<Either<Failure, List<IngredientEntity>>> getALLMealIngredientsList()async {
    try {
       final meals =await remoteDataSource.getALLMealIngredientsList();
    return Right(meals);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CategoriesEntity>>> getAllMealCategoriesList() async{
    try {
       final meals =await remoteDataSource.getAllMealCategoriesList();
    return Right(meals);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MealEntity>>> getMealByArea(String area) async{
    try {
       final meals =await remoteDataSource.getMealByArea(area);
    return Right(meals);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
   
  
  }

  @override
  Future<Either<Failure, List<MealEntity>>> getMealByCategory(String category) async{
    try {
       final meals =await remoteDataSource.getMealByCategory(category);
    return Right(meals);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MealEntity>>> getMealByIngredient(String ingredient) async{
    try {
       final meals =await remoteDataSource.getMealByIngredient(ingredient);
    return Right(meals);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
   
  }

  @override
  Future<Either<Failure, List<MealEntity>>> getMealByName(String name)async {
   
    try {
       final meals =await remoteDataSource.getMealByName(name);
    return Right(meals);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, MealEntity>> getMealDetails(String id) async{
    try {
       final meals =await remoteDataSource.getMealDetails(id);
    return Right(meals);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MealEntity>>> getPopularRecipes()async {
    try {
       final meals =await remoteDataSource.getPopularRecipes();
    return Right(meals);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}