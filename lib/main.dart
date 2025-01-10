// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/core/theme/app_theme.dart';
import 'package:meals/core/routes/app_route_config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: App()));
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
      designSize: const Size(844, 390),
      minTextAdapt: true,
      child: PlatformProvider(
          builder: (ctx) => PlatformTheme(
              materialLightTheme: AppTheme.light(),
              cupertinoLightTheme: AppTheme.cupLight(),
              builder: (ctx) => PlatformApp.router(
                    localizationsDelegates: const <LocalizationsDelegate<
                        dynamic>>[
                      DefaultMaterialLocalizations.delegate,
                      DefaultCupertinoLocalizations.delegate,
                      DefaultWidgetsLocalizations.delegate
                    ],
                    debugShowCheckedModeBanner: false,
                    routerConfig: MyAppRoutes.returnRouter(),
                  ))),
    );
  }
}
