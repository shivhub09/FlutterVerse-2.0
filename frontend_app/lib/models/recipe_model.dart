class RecipeModel
{
  final String applabel;
  final String appimgUrl;
  final double appcalories;
  final String appurl;

  RecipeModel({required this.applabel,required this.appcalories ,required this.appimgUrl,required this.appurl});
  factory RecipeModel.fromMap(Map recipe)
  {
    return RecipeModel(
      applabel: recipe["label"],
      appcalories: recipe["calories"],
      appimgUrl: recipe["image"],
      appurl: recipe["url"]
    );
  }
}