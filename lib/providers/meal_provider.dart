import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:meals/models/meal.dart';

class MealsNotifier extends StateNotifier<List<Meal>> {
  MealsNotifier() : super([]);

  Future<List<Meal>> getMeals() async {
    final url = Uri.https('meals-72a26-default-rtdb.firebaseio.com', 'meals.json');
    try {
      final response = await http.get(url);
      
      if (response.body == 'null') {
        return []; // Return an empty list if no data is found
      }

      // Decode the JSON response as a List
      final List<dynamic> mealsData = json.decode(response.body);
      
      // Convert the List into a list of Meal objects
      final List<Meal> mealList = mealsData.map((mealData) {
        return Meal.fromJson(mealData as Map<String, dynamic>);
      }).toList();

      state = mealList; // Update the state with the new meals
      return mealList;
    } catch (e) {
      print('Error fetching meals: $e');
      return []; // Return an empty list if an error occurs
    }
  }
}

final mealProvider = StateNotifierProvider<MealsNotifier, List<Meal>>((ref) {
  return MealsNotifier();
});