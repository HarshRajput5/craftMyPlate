class FoodItem {
  final String name;
  final String imageUrl;
  final bool isVeg;
  bool added;

  FoodItem(
      {required this.name,
      required this.imageUrl,
      required this.isVeg,
      required this.added});
}

final List<FoodItem> foodItems = [
  FoodItem(
      name: "Idli Sambar",
      imageUrl: "images/Edli.png",
      isVeg: true,
      added: true),
  FoodItem(
      name: "Appam", imageUrl: "images/appam.png", isVeg: true, added: true),
  FoodItem(
      name: "Dosa", imageUrl: "images/dosa.png", isVeg: true, added: false),
  FoodItem(
      name: "Wada", imageUrl: "images/wada.png", isVeg: true, added: false),
  FoodItem(
      name: "Pongal", imageUrl: "images/pongal.png", isVeg: true, added: false),
  FoodItem(
      name: "Ponda", imageUrl: "images/poda.png", isVeg: true, added: false),
];
