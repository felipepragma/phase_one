import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phase_one_app/domain/entities/password.dart';
import 'package:phase_one_app/presentation/providers/password_provider.dart';
import 'package:phase_one_app/presentation/router/app_pages.dart';
import 'package:phase_one_app/presentation/utils/colors.dart';
import 'package:phase_one_app/presentation/pages/home_page/widgets/elevation_item.dart';

///
/// HomePage : 
/// 
/// Page showing the list of passwords
///
class HomePage extends ConsumerStatefulWidget {
  
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Contraseñas'),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
          child: ref.watch(passwordProvider).getAllPassword().isEmpty ? 
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 150,
                height: 150,
                child: Icon(
                Icons.close_fullscreen_sharp,
                color: Colors.grey.withOpacity(0.8),
                size: 80,
              ),
              ),
             Text(
                "No tienes contraseñas guardadas.",
                textAlign: TextAlign.center,
                style: TextStyle(
                color: Colors.grey.withOpacity(0.8),
                fontSize: 20,
                fontFamily: "Open Sans",
                fontWeight: FontWeight.w700)
              )
            ],
          ) : 
          ListView.builder(
            itemCount: ref.watch(passwordProvider).getAllPassword().length,
            itemBuilder: (context, index) {
              PasswordModel? passwordModel = ref.watch(passwordProvider).getAllPassword()[index];
              return ElevatedListItem(title: passwordModel.name ?? "", subtitle: passwordModel.description ?? "", onTap: () => goToDetail(passwordModel));
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorsPallette.buttons,
        tooltip: 'Nueva Contraseña',
        onPressed: () => goRegister(context),
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
    );
  }

  Future<void> goRegister(BuildContext context) async {
    final result =
        await context.push(PageName.homeRoute + PageName.registerRoute, extra: null) as bool;
    if (result) {
      if (!context.mounted) return;
      const snackBar = SnackBar(content: Text('Se agrego la nueva contraseña con éxito.'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      setState(() {});
    }
  }

  void goToDetail(PasswordModel? passwordModel) async {
    final result =
        await context.push(PageName.homeRoute + PageName.detailRoute, extra: passwordModel) as bool;
    if (result) {
      setState(() {});
    }
  }
}
