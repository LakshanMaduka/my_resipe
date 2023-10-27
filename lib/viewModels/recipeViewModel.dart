import '../models/food_model.dart';

class RecipeViewModel {
  Recipe _recipe;
  RecipeViewModel({required Recipe recipe}) : _recipe = recipe;
  String? get label {
    return _recipe.label;
  }

  String? get title {
    return _recipe.label;
  }

  String? get image {
    return _recipe.image;
  }

  String? get url {
    return _recipe.url;
  }

  List? get ingredients {
    return _recipe.ingredients;
  }
}
