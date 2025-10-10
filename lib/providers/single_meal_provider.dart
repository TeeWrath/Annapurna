import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/providers/meal_provider.dart';

final mealByIdProvider = FutureProvider.family<Meal?, String>((ref, id) async {
  final mealsNotifier = ref.read(mealProvider.notifier);
  return await mealsNotifier.getMealById(id);
});