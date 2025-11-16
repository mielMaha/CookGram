class ApiEndpoints {
  static const String baseUrl = 'https://www.themealdb.com/api/json/v1/1/';
  String getpath(ApiEndpointsEnum apiEndpointsEnum) {
    switch (apiEndpointsEnum) {
      case ApiEndpointsEnum.getCategoriesList:
        return 'categories.php';
      case ApiEndpointsEnum.getPopular:
        return 'search.php?';
      case ApiEndpointsEnum.getMealByName:
        return 'search.php?';
      case ApiEndpointsEnum.getMealByCategory:
        return 'filter.php?';
      case ApiEndpointsEnum.getMealByIngredient:
        return 'list.php?';
      case ApiEndpointsEnum.getMealByArea:
        return 'filter.php?';
      case ApiEndpointsEnum.getMealDetails:
        return 'lookup.php?';
      case ApiEndpointsEnum.getIngredientsList:
        return 'list.php?i=list';
    }
  }
  
}
enum ApiEndpointsEnum { 
  getCategoriesList,
  getIngredientsList,
  getPopular,
  getMealByName,
  getMealByCategory,
  getMealByIngredient,
  getMealByArea,
  getMealDetails
 }