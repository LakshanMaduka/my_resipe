import 'package:flutter/material.dart';

import '../viewModels/recipeListViewModel.dart';
import '../viewModels/recipeViewModel.dart';
import '../views/detailsPage.dart';
import 'recipeCard.dart';

class recipeList extends StatelessWidget {
  final Function(RecipeViewModel recipe)? onTap;
  recipeList({super.key, required this.vm, this.onTap});

  final RecipeListViewModel vm;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: vm.recipies.length,
        itemBuilder: (context, index) {
          return RecipeCard(
            title: vm.recipies[index].label,
            imgUrl: vm.recipies[index].image,
            onTap: () {
              onTap!(vm.recipies[index]);
            },
          );
        });
  }
}
