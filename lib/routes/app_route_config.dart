import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meals/controllers/meals_provider.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/routes/app_route_const.dart';
import 'package:meals/view/categories.dart';
import 'package:meals/view/filters.dart';
import 'package:meals/view/login.dart';
import 'package:meals/view/meal_detail.dart';
import 'package:meals/view/meals.dart';
import 'package:meals/view/signup.dart';
import 'package:meals/view/tabs.dart';

class MyAppRoutes {
  static GoRouter returnRouter() {
    GoRouter routes = GoRouter(routes: [
      GoRoute(
        name: Routes.login,
        path: '/login',
        pageBuilder: (context, state) {
          return const MaterialPage(child: LoginScreen());
        },
      ),
      GoRoute(
        name: Routes.signup,
        path: '/signup',
        pageBuilder: (context, state) {
          return const MaterialPage(child: SignupScreen());
        },
      ),
      GoRoute(
        name: Routes.tabs,
        path: '/tabs',
        pageBuilder: (context, state) {
          return const MaterialPage(child: TabsScreen());
        },
      ),
      GoRoute(
        name: Routes.categories,
        path: '/categories',
        pageBuilder: (context, state) {
          return const MaterialPage(child: CategoriesScreen());
        },
      ),
      GoRoute(
        name: Routes.filters,
        path: '/filters',
        pageBuilder: (context, state) {
          return const MaterialPage(child: FiltersScreen());
        },
      ),
      GoRoute(
        name: Routes.meals,
        path: '/meals/:meal',
        pageBuilder: (context, state) {
          return MaterialPage(
              child: MealsScreen(
            meal: state.pathParameters['meal']!,
          ));
        },
      ),
      GoRoute(
        name: Routes.mealDetails,
        path: '/details/:meal',
        pageBuilder: (context, state) {
          return MaterialPage(
              child: MealDetailScreen(
            meal: state.pathParameters['meal']!,
          ));
        },
      ),
    ]);
    return routes;
  }
}

List<Meal> getMealList() {
  final meal = ref.watch(mealsProvider);
  return meal;
}
