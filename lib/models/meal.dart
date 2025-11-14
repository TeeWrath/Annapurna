// models/meal.dart
import 'package:flutter/material.dart';

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
    // Handle enum conversion safely
    Affordability parseAffordability(String value) {
      return Affordability.values.firstWhere(
        (e) => e.toString().split('.').last == value,
        orElse: () => Affordability.affordable,
      );
    }

    Complexity parseComplexity(String value) {
      return Complexity.values.firstWhere(
        (e) => e.toString().split('.').last == value,
        orElse: () => Complexity.simple,
      );
    }

    return Meal(
      id: json['id'] as String? ?? '',
      categories: List<String>.from(json['categories'] ?? []),
      title: json['title'] as String? ?? '',
      affordability: parseAffordability(json['affordability'] as String? ?? 'affordable'),
      complexity: parseComplexity(json['complexity'] as String? ?? 'simple'),
      imageUrl: json['imageUrl'] as String? ?? '',
      duration: (json['duration'] as num?)?.toInt() ?? 0,
      ingredients: List<String>.from(json['ingredients'] ?? []),
      steps: List<String>.from(json['steps'] ?? []),
      isGlutenFree: json['isGlutenFree'] as bool? ?? false,
      isVegan: json['isVegan'] as bool? ?? false,
      isVegetarian: json['isVegetarian'] as bool? ?? false,
      isLactoseFree: json['isLactoseFree'] as bool? ?? false,
    );
  }

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