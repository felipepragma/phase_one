import 'package:go_router/go_router.dart';
import 'package:phase_one_app/domain/entities/password.dart';
import 'package:phase_one_app/presentation/pages/detail_page/detail_page.dart';
import 'package:phase_one_app/presentation/pages/register_page/register_page.dart';
import 'package:phase_one_app/presentation/router/app_pages.dart';
import 'package:phase_one_app/presentation/pages/home_page/home_page.dart';

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
            return DetailPage(passwordModel,);
          },
        ),
      ]
    ),
]);