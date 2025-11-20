import 'dart:async';
import 'dart:io';

import 'package:cookgram/core/network/api_service/supabase_manager.dart';
import 'package:cookgram/features/recipes/data/datasources/recipes_maker_remote_data_source.dart';
import 'package:cookgram/features/recipes/domain/entities/recipe_entity.dart';
import 'package:cookgram/features/recipes/persentation/cubit/recipe_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipeCubit extends Cubit<RecipeStates> {
  final RecipesMakerRemoteDataSource remoteDataSource;
  final SupabaseManager supabaseManager;

  RecipeCubit({required this.remoteDataSource, required this.supabaseManager})
    : super(RecipeInitial());
   Future<void> getAllRecipes() async {
    emit(RecipeLoading());
    final result = await remoteDataSource.getAllRecipes();
    result.fold(
      (failure) => emit(RecipeError(failure.message)),
      (recipes) => emit(RecipeLoaded(recipes)),
    );
  }



  Future<void> addRecipe(RecipeEntity recipe) async {
    emit(RecipeLoading());

    final result = await remoteDataSource.addRecipe(recipe);

    result.fold(
      (failure) => emit(RecipeAddedError(failure.message)),
      (_) => emit(RecipeAddedSuccess()),
    );
  }

  String? imageUrl;
  Future<void> uploadImage(File imageFile) async {
    emit(ImageUpLoading());

    try {
      final imagePath = await supabaseManager.uploadImage(imageFile);

      emit(ImageUpLoadedComplete());

      imageUrl = await supabaseManager.downloadImage(imagePath);

      emit(ImageDownLoaded(imageUrl!));
    } catch (e) {
      emit(ImageError(e.toString()));
    }
  }
}
