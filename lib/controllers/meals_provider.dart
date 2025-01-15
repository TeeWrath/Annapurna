import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/core/data/dummy_data.dart';
import 'package:http/http.dart' as http;
import 'package:meals/models/meal.dart';

final mealsProvider = Provider((ref) {
  return dummyMeals;
});


