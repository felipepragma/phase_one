import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phase_one_app/domain/entities/password.dart';
import 'package:phase_one_app/presentation/pages/detail_page/widgets/custom_button.dart';
import 'package:phase_one_app/presentation/pages/detail_page/widgets/custom_password_textfield.dart';
import 'package:phase_one_app/presentation/pages/detail_page/widgets/custom_textfield.dart';
import 'package:phase_one_app/presentation/providers/password_provider.dart';
import 'package:phase_one_app/presentation/utils/utils.dart';
import 'package:phase_one_app/usecases/interface_password_case.dart';
import 'package:uuid/uuid.dart';

///
/// RegisterPage : 
/// 
/// Page to register a new password
///
class RegisterPage extends ConsumerStatefulWidget {

  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final TextEditingController _textEditingControllerName =
      TextEditingController();
  final TextEditingController _textEditingControllerPass =
      TextEditingController();
  final TextEditingController _textEditingControllerDes =
      TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Registro de Contraseña'),
          leading: GestureDetector(
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onTap: () {
                context.pop(false);
              }),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
          child: Column(children: [
            CustomTextfield("Nombre de contraseña:", _textEditingControllerName, false),
            CustomPasswordTextfield("Contraseña:", _textEditingControllerPass, false),
            CustomTextfield("Descripción:", _textEditingControllerDes, false),
            CustomButton("Guardar", (context) => _registerPassword(context))
          ]),
        ),
      ),
    );
  }

  void _registerPassword(BuildContext context) {
    IPasswordUseCase usecase = ref.watch(passwordProvider);
    String name = _textEditingControllerName.text;
    String pass = _textEditingControllerPass.text;
    String desc = _textEditingControllerDes.text;
    if(name.isEmpty || pass.isEmpty || desc.isEmpty) {
      Utils.showMessage(context, "Error campos vacios", "Todos los campos deben estar completos.");
      return ;
    }
    String uuid = const Uuid().v1();
    PasswordModel passwordModel = PasswordModel(uuid: uuid, name: name, pass: pass, description: desc);
    usecase.savePassword(passwordModel);
    context.pop(true);
  }
}
