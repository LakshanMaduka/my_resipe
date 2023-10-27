import 'api_key.dart';

class Constants {
  static String GET_RANDOM_RECIPE =
      "https://api.edamam.com/api/recipes/v2?type=public&q=random&app_id=${APP_ID}&app_key=${APP_KEY}&random=true";

  static String keywordRecipe(keyword) {
    return "https://api.edamam.com/api/recipes/v2?type=public&q=${keyword}&app_id=${APP_ID}&app_key=${APP_KEY}&random=true";
  }
}
