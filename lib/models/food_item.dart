class FoodItem {
  final String name;
  final String assetPath;
  final bool isHealthy;
  final int nutrition;
  final double saturation;

  FoodItem(
    this.name,
    this.assetPath, {
    required this.isHealthy,
    required this.nutrition,
    required this.saturation,
  });
}