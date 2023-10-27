import 'package:flutter/material.dart';
import 'package:my_resipe/services/recipe_service.dart';
import 'package:my_resipe/viewModels/recipeViewModel.dart';

import '../models/food_model.dart';

class RecipeListViewModel extends ChangeNotifier {
  List<RecipeViewModel> recipies = [];
  void keywordRecipe(String keyword) async {
    List<Recipe> recipe = await RecipeService().searchRecipe(keyword);
    recipies = recipe.map((recipe) => RecipeViewModel(recipe: recipe)).toList();
    notifyListeners();
  }

  void populateRecipe() async {
    List<Recipe> recipe = await RecipeService().fetchRecipe();
    recipies = recipe.map((recipe) => RecipeViewModel(recipe: recipe)).toList();
    notifyListeners();
  }
}
