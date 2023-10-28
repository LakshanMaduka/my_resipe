import 'package:flutter/material.dart';
import 'package:my_resipe/viewModels/recipeViewModel.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailsPage extends StatelessWidget {
  RecipeViewModel recipe;
  DetailsPage({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(recipe.label!),
        ),
        body: WebViewWidget(
            controller: WebViewController()
              ..setJavaScriptMode(JavaScriptMode.unrestricted)
              ..loadRequest(Uri.parse(recipe.url!))));
  }
}
