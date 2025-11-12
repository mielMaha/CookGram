class ApiEndpoints {
  static const String baseUrl = 'https://www.themealdb.com/api/json/v1/1/';
  String getpath(ApiEndpointsEnum apiEndpointsEnum) {
    switch (apiEndpointsEnum) {
      case ApiEndpointsEnum.getCategoriesList:
        return 'categories.php';
      case ApiEndpointsEnum.getPopular:
        return 'search.php?f=a';
      case ApiEndpointsEnum.getMealByName:
        return 'search.php?s=';
      case ApiEndpointsEnum.getMealByCategory:
        return 'filter.php?c=';
      case ApiEndpointsEnum.getMealByIngredient:
        return 'list.php?i=';
      case ApiEndpointsEnum.getMealByArea:
        return 'filter.php?a=';
      case ApiEndpointsEnum.getMealDetails:
        return 'lookup.php?i=';
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