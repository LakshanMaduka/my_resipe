const APP_ID = '1aadd2e3';
const APP_KEY = "e72a5a48473fb2f9f702b505a82519de";

class Constants {
  static String GET_RANDOM_RECIPE =
      "https://api.edamam.com/api/recipes/v2?type=public&q=random&app_id=${APP_ID}&app_key=${APP_KEY}&random=true";

  static String keywordRecipe(keyword) {
    return "https://api.edamam.com/api/recipes/v2?type=public&q=${keyword}&app_id=${APP_ID}&app_key=${APP_KEY}&random=true";
  }
}
