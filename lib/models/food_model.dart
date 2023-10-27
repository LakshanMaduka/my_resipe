class Recipe {
  final String? label;
  final String url;
  final String image;
  final List<dynamic> ingredients;

  Recipe(
      {required this.image,
      required this.ingredients,
      this.label,
      required this.url});
  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
        image: json['image'],
        ingredients: json['ingredients'],
        label: json['label'],
        url: 'url');
  }
}
