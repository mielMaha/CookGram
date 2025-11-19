import 'package:cookgram/core/error/failures.dart';
import 'package:cookgram/core/network/api_service/supabase_manager.dart';
import 'package:cookgram/features/recipes/domain/entities/recipe_entity.dart';
import 'package:cookgram/features/recipes/domain/repositories/recipe_maker_repository.dart';
import 'package:dartz/dartz.dart';

class RecipesMakerRemoteDataSource implements RecipeMakerRepository{
  @override
    SupabaseManager supabaseManager ;

  RecipesMakerRemoteDataSource({required this.supabaseManager});

  Future<Either<Failure, void>> addRecipe(RecipeEntity recipe) async{
    try {
      await supabaseManager.addRecipe(recipe);
      return Right(null);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
    
  
  }

  @override
  Future<Either<Failure, List<RecipeEntity>>> getAllRecipes() async{
    try {
      List<RecipeEntity> recipes = await supabaseManager.getUsersRecipes();
      return Right(recipes);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
  
}