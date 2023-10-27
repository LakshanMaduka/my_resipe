import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_resipe/models/food_model.dart';
import '../utilities/constants.dart';
import '../va.env.dart';

class RecipeService {
  Future<List<Recipe>> searchRecipe(String keyword) async {
    final response =
        await http.get(Uri.parse(Constants.keywordRecipe(keyword)));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      List<dynamic> list = result['hits'];
      return list.map((e) => Recipe.fromJson(e['recipe'])).toList();
    } else {
      throw Exception('Failed to fetch recipes');
    }
  }

  Future<List<Recipe>> fetchRecipe() async {
    final response = await http.get(Uri.parse(Constants.GET_RANDOM_RECIPE));
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      List<dynamic> list = result['hits'];
      return list.map((recipe) => Recipe.fromJson(recipe['recipe'])).toList();
    } else {
      throw Exception('Failed to fetch recipes');
    }
  }
}
