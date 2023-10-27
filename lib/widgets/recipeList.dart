import 'package:flutter/material.dart';

import '../viewModels/recipeListViewModel.dart';
import 'recipeCard.dart';

class recipeList extends StatelessWidget {
  const recipeList({
    super.key,
    required this.vm,
  });

  final RecipeListViewModel vm;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: vm.recipies.length,
        itemBuilder: (context, index) {
          return RecipeCard(
            title: vm.recipies[index].label,
            imgUrl: vm.recipies[index].image,
          );
        });
  }
}
