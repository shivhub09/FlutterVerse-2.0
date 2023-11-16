class Recipe {
  final String displayName;
  final String imageUrl;
  final String description; // Adding description field

  Recipe({
    required this.displayName,
    required this.imageUrl,
    required this.description,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      displayName: json['name'] ?? '',
      imageUrl: json['thumbnail_url'] ?? '',
      description: json['description'] ?? '', // Assigning description value
      // totalTime: json['cook_time_minutes'],
    );
  }
}
