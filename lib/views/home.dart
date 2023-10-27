import 'package:flutter/material.dart';
import 'package:my_resipe/services/recipe_service.dart';
import 'package:my_resipe/viewModels/recipeListViewModel.dart';
import 'package:my_resipe/widgets/recipeCard.dart';
import 'package:my_resipe/widgets/recipeList.dart';
import 'package:provider/provider.dart';

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
          Expanded(child: recipeList(vm: vm)),
        ],
      ),
    );
  }
}
