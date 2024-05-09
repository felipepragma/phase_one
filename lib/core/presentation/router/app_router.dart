import 'package:go_router/go_router.dart';
import 'package:phase_one_app/core/domain/entities/password.dart';
import 'package:phase_one_app/core/presentation/router/app_pages.dart';
import 'package:phase_one_app/features/detail_feature/presentation/pages/detail_page.dart';
import 'package:phase_one_app/features/home_feature/presentation/pages/home_page.dart';
import 'package:phase_one_app/features/register_feature/presentation/pages/register_page.dart';

///
/// route definition used by GoRoute
/// 
/// [PageName] : list of route names
/// 
final router = GoRouter(
  initialLocation: PageName.homeRoute,
   routes: [
    GoRoute(
      path: PageName.homeRoute,
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: PageName.registerRoute,
          builder: (context, state) => const RegisterPage(),
        ),
        GoRoute(
          path: PageName.detailRoute,
          builder: (context, state) {
            PasswordModel? passwordModel = state.extra as PasswordModel?;
            return DetailPage(passwordModel: passwordModel,);
          },
        ),
      ]
    ),
]);