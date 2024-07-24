import 'package:flutter/material.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/login.dart';
import 'package:meals/screens/signup.dart';
// import 'package:meals/screens/meal_detail.dart';
// import 'package:meals/screens/meals.dart';
import 'package:meals/screens/tabs.dart';

class Routes {
  static const String signup = '/';
  static const String login = '/login';
  static const String tabs = '/tabs';
  static const String categories = '/categories';
  static const String filters = '/filters';
  static const String meals = '/meals';
  static const String mealDetails = '/details';
}

class RouteMap extends Routes {
  static Map<String, WidgetBuilder> get routes {
    return {
      Routes.signup: (context) => const SignupScreen(),
      Routes.login: (context) => const LoginScreen(),
      Routes.tabs: (context) => const TabsScreen(),
      Routes.categories: (context) => const CategoriesScreen(),
      Routes.filters: (context) => const FiltersScreen(),
      // Routes.meals : (context) => const MealsScreen(meal: meal),
      // Routes.mealDetails : (context) => const MealDetailScreen(meal: meal),
    };
  }
}
