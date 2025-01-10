import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meals/routes/app_route_const.dart';
import 'package:meals/view/categories.dart';
import 'package:meals/view/filters.dart';
import 'package:meals/view/login.dart';
import 'package:meals/view/signup.dart';
import 'package:meals/view/tabs.dart';

class MyAppRoutes {
  static GoRouter returnRouter() {
    GoRouter routes = GoRouter(routes: [
      GoRoute(
        name: Routes.tabs,
        path: '/',
        pageBuilder: (context, state) {
          return const MaterialPage(child: TabsScreen());
        },
      ),
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
      // GoRoute(
      //   name: Routes.meals,
      //   path: '/meals',
      //   pageBuilder: (context, state) {
      //     return MaterialPage(
      //         child: MealsScreen(
      //       meal: meal,
      //     ));
      //   },
      // ),
      // GoRoute(
      //   name: Routes.mealDetails,
      //   path: '/details/:meal',
      //   pageBuilder: (context, state) {
      //     return MaterialPage(
      //         child: MealDetailScreen(
      //       meal: state.pathParameters['meal']!,
      //     ));
      //   },
      // ),
    ]);
    return routes;
  }
}
