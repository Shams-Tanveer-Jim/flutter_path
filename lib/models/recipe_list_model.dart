class RecipeListModel {
  List<Recipe>? results;

  RecipeListModel({this.results});

  RecipeListModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Recipe>[];
      json['results'].forEach((v) {
        results!.add(Recipe.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Recipe {
  int? id;
  String? name;
  String? recipeBy;
  String? image;
  double? rating;

  Recipe({this.id, this.name, this.recipeBy, this.image, this.rating});

  Recipe.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    recipeBy = json['recipe_by'];
    image = json['image'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['recipe_by'] = recipeBy;
    data['image'] = image;
    data['rating'] = rating;
    return data;
  }
}
