import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phase_one_app/core/domain/entities/password.dart';
import 'package:phase_one_app/core/presentation/providers/passwords_notifier.dart';
import 'package:phase_one_app/core/presentation/router/app_pages.dart';
import 'package:phase_one_app/core/presentation/utils/colors.dart';
import 'package:phase_one_app/features/home_feature/presentation/widgets/elevation_item.dart';

///
/// HomePage : 
/// 
/// Page showing the list of passwords
///
class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Passwords'),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
          child: ListView.builder(
            itemCount: ref.watch(passwordProvider).getAllPassword().length,
            itemBuilder: (context, index) {
              PasswordModel? passwordModel = ref.watch(passwordProvider).getAllPassword()[index];
              return _buildPasswordItem(passwordModel);
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorsPallette.buttons,
        tooltip: 'New Password',
        onPressed: () => goRegister(context),
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
    );
  }

  Widget _buildPasswordItem(PasswordModel? passwordModel) {
    return ElevatedListItem(title: passwordModel?.name ?? "", subtitle: passwordModel?.description ?? "", onTap: () => goToDetail(passwordModel));
  }

  Future<void> goRegister(BuildContext context) async {
    final result =
        await context.push(PageName.homeRoute + PageName.registerRoute) as bool;
    if (result) {
      if (!context.mounted) return;
      const snackBar = SnackBar(content: Text('Successful registration'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      setState(() {});
    }
  }

  void goToDetail(PasswordModel? passwordModel) {
    context.go(PageName.homeRoute + PageName.detailRoute, extra: passwordModel);
  }
}
