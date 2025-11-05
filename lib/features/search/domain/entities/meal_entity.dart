class MealEntity {
  final String id;
  final String name;
  final String category;
  final String area;
  final String instructions;
  final String thumbnail;
  final String? tags;
  final String? youtubeUrl;
  final List<String> ingredients;
  final List<String> measures;

  const MealEntity({
    required this.id,
    required this.name,
    required this.category,
    required this.area,
    required this.instructions,
    required this.thumbnail,
    this.tags,
    this.youtubeUrl,
    required this.ingredients,
    required this.measures,
  });
  String get safeTags => tags ?? 'No tags available';
  String get safeYoutubeUrl => youtubeUrl ?? '';
  String get safeInstructions => instructions ?? '';
  String get safeThumbnail => thumbnail ?? '';
  String get safeArea => area ?? '';
  List<String> get safeIngredients => ingredients ?? [];
  List<String> get safeMeasures => measures ?? [];
}
