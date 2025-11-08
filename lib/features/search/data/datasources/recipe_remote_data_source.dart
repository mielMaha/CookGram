import 'package:cookgram/core/network/api_service/api_service.dart';
import 'package:cookgram/core/network/endpoints/api_endpoints.dart';
import 'package:cookgram/features/search/data/models/categories_model.dart';
import 'package:cookgram/features/search/data/models/ingredient_model.dart';
import 'package:cookgram/features/search/data/models/meal_model.dart';
import 'package:cookgram/features/search/domain/entities/Ingredient_entite.dart';
import 'package:cookgram/features/search/domain/entities/categories_entity.dart';
import 'package:cookgram/features/search/domain/entities/meal_entity.dart';

abstract class RecipeRemoteDataSource {
  Future<List<MealEntity>> getPopularRecipes();

  Future<List<MealEntity>> getMealByName(String name);

  Future<MealEntity> getMealDetails(String id);

  Future<List<MealEntity>> getMealByCategory(String category);

  Future<List<MealEntity>> getMealByArea(String area);

  Future<List<MealEntity>> getMealByIngredient(String ingredient);

  Future<List<IngredientEntity>> getALLMealIngredientsList();

  Future<List<CategoriesEntity>> getAllMealCategoriesList();
}

class RecipeRemoteDataSourceImpl implements RecipeRemoteDataSource {
  @override
  final ApiService _apiService;
  RecipeRemoteDataSourceImpl({required ApiService apiService})
    : _apiService = apiService;
    //xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
  Future<List<IngredientEntity>> getALLMealIngredientsList() async {
    return await _apiService.getDataList<IngredientEntity>(
      endpoint: ApiEndpoints().getpath(ApiEndpointsEnum.getIngredientsList),
      converter: IngredientModel.fromJson,
    );
  }

  @override
  //xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
  Future<List<CategoriesEntity>> getAllMealCategoriesList() async {
    return await _apiService.getDataList<CategoriesEntity>(
      endpoint: ApiEndpoints().getpath(ApiEndpointsEnum.getCategoriesList),
      converter: CategoriesModel.fromJson,
    );
  }

  @override
  Future<List<MealEntity>> getMealByArea(String area) async {
    return await _apiService.getDataList<MealEntity>(
      endpoint: ApiEndpoints().getpath(ApiEndpointsEnum.getMealByArea),
      param: area,
      converter: MealModel.fromJson,
    );
  }

  @override
  Future<List<MealEntity>> getMealByCategory(String category) async {
    return await _apiService.getDataList<MealEntity>(
      endpoint: ApiEndpoints().getpath(ApiEndpointsEnum.getMealByCategory),
      param: category,
      converter: MealModel.fromJson,
    );
  }

  @override
  Future<List<MealEntity>> getMealByIngredient(String ingredient) async {
    return await _apiService.getDataList<MealEntity>(
      endpoint: ApiEndpoints().getpath(ApiEndpointsEnum.getMealByIngredient),
      param: ingredient,
      converter:MealModel.fromJson,
    );
  }

  @override
  Future<List<MealEntity>> getMealByName(String name) async {
    return await _apiService.getDataList<MealEntity>(
      endpoint: ApiEndpoints().getpath(ApiEndpointsEnum.getMealByName),
      param: name,
      converter: MealModel.fromJson,
    );
  }

  @override
  Future<MealEntity> getMealDetails(String id) async {
    return await _apiService.getData<MealEntity>(
      endpoint: ApiEndpoints().getpath(ApiEndpointsEnum.getMealDetails),
      param: id,
      converter:MealModel.fromJson,
    );
  }

  @override
  Future<List<MealEntity>> getPopularRecipes() async {
    return await _apiService.getDataList<MealEntity>(
      endpoint: ApiEndpoints().getpath(ApiEndpointsEnum.getPopular),
      converter: MealModel.fromJson,
    );
  }
}
