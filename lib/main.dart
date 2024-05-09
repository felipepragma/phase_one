import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phase_one_app/core/presentation/router/app_router.dart';
import 'package:phase_one_app/core/presentation/utils/colors.dart';

void main() {
  runApp(
   const ProviderScope(
      child: MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(scaffoldBackgroundColor: ColorsPallette.main),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}

