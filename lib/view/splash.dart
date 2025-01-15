import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meals/controllers/meal_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/core/routes/app_route_const.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
// class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    listMeals();
    _navigatetohome();
  }

  void listMeals() async {
    final meal = ref.read(mealProvider.notifier);

    var res = await meal.getMeals();
    print(res);
  }

  void _navigatetohome() async {
    await Future.delayed(const Duration(milliseconds: 3000), () {});
    context.go(RoutePath.signup);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 101, 41),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Center(
            child: Image.asset(
          'assets/logo.png',
          scale: 0.7,
        )),
      ),
    );
  }
}
