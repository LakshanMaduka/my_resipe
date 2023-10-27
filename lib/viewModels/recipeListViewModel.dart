import 'package:flutter/material.dart';
import 'package:my_resipe/services/recipe_service.dart';
import 'package:my_resipe/viewModels/recipeViewModel.dart';

import '../models/food_model.dart';

enum Loadingstatus { searching, empty, completed }

class RecipeListViewModel extends ChangeNotifier {
  var loadingStatus = Loadingstatus.searching;

  List<RecipeViewModel> recipies = [];

  void keywordRecipe(String keyword) async {
    loadingStatus = Loadingstatus.searching;
    // notifyListeners();
    List<Recipe> recipe = await RecipeService().searchRecipe(keyword);
    recipies = recipe.map((recipe) => RecipeViewModel(recipe: recipe)).toList();
    loadingStatus =
        recipies.isEmpty ? Loadingstatus.empty : Loadingstatus.completed;
    notifyListeners();
  }

  void populateRecipe() async {
    loadingStatus = Loadingstatus.searching;
    //notifyListeners();

    List<Recipe> recipe = await RecipeService().fetchRecipe();
    recipies = recipe.map((recipe) => RecipeViewModel(recipe: recipe)).toList();
    loadingStatus =
        recipies.isEmpty ? Loadingstatus.empty : Loadingstatus.completed;
    notifyListeners();
  }
}
