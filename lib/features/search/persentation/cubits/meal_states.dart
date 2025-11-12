import 'package:cookgram/core/error/failures.dart';
import 'package:cookgram/features/search/domain/entities/categories_entity.dart';
import 'package:cookgram/features/search/domain/entities/meal_entity.dart';

abstract class MealState {}

class MealInitial extends MealState {}

class MealLoading extends MealState {}

class MealLoaded extends MealState {
  final List<MealEntity> meals;

  MealLoaded(this.meals);
}

class MealError extends MealState {
  final Failure failure;

  MealError(this.failure);
}
class CategoriesLoaded extends MealState {
  final List<CategoriesEntity> categories;
  CategoriesLoaded(this.categories);
}