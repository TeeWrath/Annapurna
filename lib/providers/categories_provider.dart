import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/category.dart';
import 'package:meals/providers/meal_provider.dart';

// Predefined category data with colors
const _categoryData = {
  'c1': Category(id: 'c1', title: 'Italian', color: Colors.purple),
  'c2': Category(id: 'c2', title: 'Quick & Easy', color: Colors.red),
  'c3': Category(id: 'c3', title: 'Hamburgers', color: Colors.orange),
  'c4': Category(id: 'c4', title: 'German', color: Colors.amber),
  'c5': Category(id: 'c5', title: 'Light & Lovely', color: Colors.blue),
  'c6': Category(id: 'c6', title: 'Exotic', color: Colors.green),
  'c7': Category(id: 'c7', title: 'Breakfast', color: Colors.lightBlue),
  'c8': Category(id: 'c8', title: 'Asian', color: Colors.lightGreen),
  'c9': Category(id: 'c9', title: 'French', color: Colors.pink),
  'c10': Category(id: 'c10', title: 'Summer', color: Colors.teal),
};

// Provider that provides available categories based on meals data
final availableCategoriesProvider = Provider<List<Category>>((ref) {
  final meals = ref.watch(mealProvider);
  
  if (meals.isEmpty) {
    return _categoryData.values.toList();
  }
  
  // Get all unique category IDs from meals
  final Set<String> usedCategoryIds = {};
  for (final meal in meals) {
    usedCategoryIds.addAll(meal.categories);
  }
  
  // Return only categories that are actually used in meals
  return _categoryData.entries
      .where((entry) => usedCategoryIds.contains(entry.key))
      .map((entry) => entry.value)
      .toList();
});

// Provider for all possible categories (for AddMealScreen)
final allCategoriesProvider = Provider<List<Category>>((ref) {
  return _categoryData.values.toList();
});