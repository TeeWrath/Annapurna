enum Complexity {
  simple,
  challenging,
  hard,
}

enum Affordability {
  affordable,
  pricey,
  luxurious,
}

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final Affordability affordability;
  final Complexity complexity;
  final String imageUrl;
  final int duration;
  final List<String> ingredients;
  final List<String> steps;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;

  Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.affordability,
    required this.complexity,
    required this.imageUrl,
    required this.duration,
    required this.ingredients,
    required this.steps,
    required this.isGlutenFree,
    required this.isVegan,
    required this.isVegetarian,
    required this.isLactoseFree,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      id: json['id'] as String,
      categories: List<String>.from(json['categories']),
      title: json['title'] as String,
      affordability: Affordability.values
          .firstWhere((e) => e.toString().split('.').last == json['affordability']),
      complexity: Complexity.values
          .firstWhere((e) => e.toString().split('.').last == json['complexity']),
      imageUrl: json['imageUrl'] as String,
      duration: json['duration'] as int,
      ingredients: List<String>.from(json['ingredients']),
      steps: List<String>.from(json['steps']),
      isGlutenFree: json['isGlutenFree'] as bool,
      isVegan: json['isVegan'] as bool,
      isVegetarian: json['isVegetarian'] as bool,
      isLactoseFree: json['isLactoseFree'] as bool,
    );
  }

  // Add toJson method for completeness
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'categories': categories,
      'title': title,
      'affordability': affordability.toString().split('.').last,
      'complexity': complexity.toString().split('.').last,
      'imageUrl': imageUrl,
      'duration': duration,
      'ingredients': ingredients,
      'steps': steps,
      'isGlutenFree': isGlutenFree,
      'isVegan': isVegan,
      'isVegetarian': isVegetarian,
      'isLactoseFree': isLactoseFree,
    };
  }

  @override
  String toString() {
    return '''
    Meal(
      title: $title,
      id: $id,
      duration: $duration minutes,
      complexity: ${complexity.toString().split('.').last},
      affordability: ${affordability.toString().split('.').last},
      categories: $categories
    )''';
  }
}