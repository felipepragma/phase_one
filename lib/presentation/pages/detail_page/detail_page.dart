import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phase_one_app/domain/entities/password.dart';
import 'package:phase_one_app/presentation/pages/detail_page/widgets/custom_password_textfield.dart';
import 'package:phase_one_app/presentation/pages/detail_page/widgets/custom_textfield.dart';
import 'package:phase_one_app/presentation/providers/password_provider.dart';
import 'package:phase_one_app/presentation/utils/colors.dart';
import 'package:phase_one_app/presentation/utils/utils.dart';
import 'package:phase_one_app/usecases/interface_password_case.dart';

///
/// DetailPage : 
/// 
/// Page contain detail of password
/// 
/// [passwordModel] : Inject [PasswordModel]
///
class DetailPage extends ConsumerStatefulWidget {

  final PasswordModel? passwordModel;

  const DetailPage(this.passwordModel, {super.key});

  @override
  ConsumerState<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends ConsumerState<DetailPage> {
  final TextEditingController _textEditingControllerName =
      TextEditingController();
  final TextEditingController _textEditingControllerPass =
      TextEditingController();
  final TextEditingController _textEditingControllerDes =
      TextEditingController();
  bool editEnabled = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() {
    _textEditingControllerName.text = widget.passwordModel?.name ?? "";
    _textEditingControllerPass.text = widget.passwordModel?.pass ?? "";
    _textEditingControllerDes.text = widget.passwordModel?.description ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Detalle de contraseña'),
          leading: GestureDetector(
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onTap: () {
                context.pop(true);
              }),
          actions: [
            GestureDetector(
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(
                    Icons.delete,
                    color: Colors.black,
                  ),
                ),
                onTap: () => deletePassword()
            )
          ],
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
          child: Column(children: [
            CustomTextfield("Nombre de contraseña:", _textEditingControllerName, editEnabled),
            CustomPasswordTextfield("Contraseña:", _textEditingControllerPass, editEnabled),
            CustomTextfield("Descripción:", _textEditingControllerDes, editEnabled),
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorsPallette.buttons,
        tooltip: 'Nueva Contraseña',
        onPressed: () => editPassword(),
        child: Icon( !editEnabled ? Icons.check : Icons.edit, color: Colors.white, size: 28),
      ),
    );
  }

  void editPassword() {
    if (!editEnabled) {
      IPasswordUseCase usecase = ref.watch(passwordProvider);
      String name = _textEditingControllerName.text;
      String pass = _textEditingControllerPass.text;
      String desc = _textEditingControllerDes.text;
      if(name.isEmpty || pass.isEmpty || desc.isEmpty) {
        Utils.showMessage(context, "Error campos vacios", "Todos los campos deben estar completos.");
        return ;
      }
      PasswordModel? passwordModel = widget.passwordModel?.copyWith(name: name, pass: pass, description: desc);
      usecase.updatePasswordById(passwordModel?.uuid, passwordModel);
      if (!context.mounted) return;
      const snackBar = SnackBar(content: Text('La contraseña se editó correctamente.'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    setState(() {
      editEnabled = !editEnabled;
    });
  }

  void deletePassword() { 
    IPasswordUseCase usecase = ref.watch(passwordProvider);
    usecase.deletePasswordById(widget.passwordModel?.uuid);
    if (!context.mounted) return;
    const snackBar = SnackBar(content: Text('La contraseña se elimino correctamente.'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    context.pop(true);
  }
}
