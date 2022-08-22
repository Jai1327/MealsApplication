enum Complexity {
  Simple,
  Challenging,
  Hard,
}

enum Affordability {
  Affordable,
  Pricy,
  Luxurious,
}

class Meal {
  final String id;
  final List<String> catagoryID;
  final String title;
  final String ImageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  // now properties used for filtering
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVeg;

  const Meal({
    required this.ImageUrl,
    required this.catagoryID,
    required this.id,
    required this.title,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVeg,
    required this.isVegan,
  });
}
