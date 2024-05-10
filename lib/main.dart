import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phase_one_app/presentation/router/app_router.dart';
import 'package:phase_one_app/presentation/utils/colors.dart';

///
/// Main App
/// 
/// [ProviderScope] : Riverpod Scope
/// [router] : Routes GoRoute
/// 
void main() {
  runApp(
   const ProviderScope(
      child: MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(scaffoldBackgroundColor: ColorsPallette.main),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}

