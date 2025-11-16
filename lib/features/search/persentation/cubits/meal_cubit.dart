import 'package:cookgram/features/search/persentation/cubits/meal_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cookgram/features/search/domain/repositories/recipe_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:cookgram/core/error/failures.dart';
import 'package:cookgram/features/search/domain/entities/meal_entity.dart';

class SearchMealsCubit extends Cubit<MealState> {
  final RecipeRepository repository;

  SearchMealsCubit(this.repository) : super(MealInitial()) {
   
  }

  Future<void> searchByName(String name) async {
    emit(MealLoading());
    final Either<Failure, List<MealEntity>> result = await repository.getMealByName(name);
    result.fold(
      (failure) => emit(MealError(failure)),
      (meals) => emit(MealLoaded(meals)),
    );
  }


Future<void> searchByCategory(String category) async {
  emit(MealLoading());
  final result = await repository.getMealByCategory(category);
  result.fold(
    (failure) => emit(MealError(failure)),
    (meals) {
      print('Meals for $category: $meals');
      emit(MealLoaded(meals));
    },
  );
}


  Future<void> searchByIngredient(String ingredient) async {
    emit(MealLoading());
    final result = await repository.getMealByIngredient(ingredient);
    result.fold(
      (failure) => emit(MealError(failure)),
      (meals) => emit(MealLoaded(meals)),
    );
  }
  

  Future<void> searchByArea(String area) async {
    emit(MealLoading());
    final result = await repository.getMealByArea(area);
    result.fold(
      (failure) => emit(MealError(failure)),
      (meals) => emit(MealLoaded(meals)),
    );
  }

Future<void> searchPopular() async {
    emit(MealLoading());
    final result = await repository.getPopularRecipes();
    result.fold(
      (failure) => emit(MealError(failure)),
      (meals) {
        print('Meals for $meals');
        emit(MealLoaded(meals));
      },
    );
  }
Future<void> searchDetails(String id) async {
  emit(MealLoading());
  final result = await repository.getMealDetails(id);
result.fold(
  (failure) => emit(MealError(failure)),
  (meal) {
   
    emit(MealLoaded([meal]));
  },
);
}



Future<void> searchCategories() async {
 
  emit(MealLoading());

  final result = await repository.getAllMealCategoriesList();

  result.fold(
    (failure) {
      
      emit(MealError(failure));
    },
    (categories) {
     
      emit(CategoriesLoaded(categories));
    },
  );
}



}
