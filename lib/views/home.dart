import 'package:flutter/material.dart';
import 'package:my_resipe/services/recipe_service.dart';
import 'package:my_resipe/viewModels/recipeListViewModel.dart';
import 'package:my_resipe/views/detailsPage.dart';
import 'package:my_resipe/widgets/recipeCard.dart';
import 'package:my_resipe/widgets/recipeList.dart';
import 'package:provider/provider.dart';

import '../viewModels/recipeViewModel.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    Provider.of<RecipeListViewModel>(context, listen: false).populateRecipe();
    // TODO: implement initState
    super.initState();
  }

  RecipeListViewModel _recipeListViewBuilder = RecipeListViewModel();
  TextEditingController _keywordController = TextEditingController();

  Widget _buildList(BuildContext context, RecipeListViewModel vm) {
    switch (vm.loadingStatus) {
      case Loadingstatus.searching:
        return Center(
          child: CircularProgressIndicator(),
        );
      case Loadingstatus.empty:
        return Center(
          child: Text('List is empty'),
        );
      case Loadingstatus.completed:
        return recipeList(
          vm: vm,
          onTap: (recipe) {
            _buildPage(context, recipe);
          },
        );
    }
  }

  void _buildPage(BuildContext context, RecipeViewModel recipe) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DetailsPage(
          recipe: recipe,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<RecipeListViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('MyRecipe'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _keywordController,
            onSubmitted: (value) {
              if (value.isNotEmpty) {
                vm.keywordRecipe(value);
              }
            },
            decoration: InputDecoration(
                labelText: "Search recipe",
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.search),
                ),
                suffixIcon: IconButton(
                    onPressed: () {
                      _keywordController.clear();
                    },
                    icon: Icon(Icons.cancel))),
          ),
          Expanded(child: _buildList(context, vm)),
        ],
      ),
    );
  }
}
