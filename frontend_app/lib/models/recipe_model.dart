class Recipe {
  final String displayName;
  final String imageUrl;
  final String description; // Adding description field
  final List<dynamic> instructions;
  Recipe({
    required this.displayName,
    required this.imageUrl,
    required this.description,
    required this.instructions,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      displayName: json['name'] ?? '',
      imageUrl: json['thumbnail_url'] ?? '',
      description: json['description'] ?? '',
      instructions: json['instructions'], // Assigning description value
    );
  }
}
