import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phase_one_app/core/domain/entities/password.dart';
import 'package:phase_one_app/core/presentation/providers/passwords_notifier.dart';
import 'package:phase_one_app/core/presentation/utils/colors.dart';
import 'package:phase_one_app/core/presentation/utils/utils.dart';
import 'package:phase_one_app/core/usecases/password_usecase.dart';

///
/// RegisterPage : 
/// 
/// Page to register a new password
///
class RegisterPage extends ConsumerStatefulWidget {

  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final TextEditingController _textEditingControllerName =
      TextEditingController();
  final TextEditingController _textEditingControllerPass =
      TextEditingController();
  final TextEditingController _textEditingControllerDes =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Register Password'),
          leading: GestureDetector(
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onTap: () {
                context.pop(false);
              })),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
          child: Column(children: [
            _nameTextField(),
            _passwordTextField(),
            _descriptionTextField(),
            _registerButton()
          ]),
        ),
      ),
    );
  }

  Widget _nameTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Name:",
          style: GoogleFonts.openSans(
              fontSize: 14.0,
              fontWeight: FontWeight.w700,
              color: ColorsPallette.buttons),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          controller: _textEditingControllerName,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          maxLines: 1,
          style: GoogleFonts.openSans(
              fontSize: 12.0,
              fontWeight: FontWeight.w700,
              color: ColorsPallette.buttons),
          decoration: const InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1.0),
            ),
            hintText: '',
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget _passwordTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Password:",
          style: GoogleFonts.openSans(
              fontSize: 14.0,
              fontWeight: FontWeight.w700,
              color: ColorsPallette.buttons),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          controller: _textEditingControllerPass,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          obscureText: true,
          maxLines: 1,
          style: GoogleFonts.openSans(
              fontSize: 12.0,
              fontWeight: FontWeight.w700,
              color: ColorsPallette.buttons),
          decoration: const InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 1.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 1.0),
              ),
              hintText: '',
              suffixIconConstraints:
                  BoxConstraints(minWidth: 23, maxHeight: 20),
              suffixIcon: Padding(
                padding: EdgeInsets.only(right: 20),
                child: SizedBox(
                    width: 17,
                    height: 20,
                    child: Icon(Icons.remove_red_eye,
                        color: ColorsPallette.buttons)),
              )),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget _descriptionTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description:",
          style: GoogleFonts.openSans(
              fontSize: 14.0,
              fontWeight: FontWeight.w700,
              color: ColorsPallette.buttons),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          controller: _textEditingControllerDes,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          maxLines: 1,
          style: GoogleFonts.openSans(
              fontSize: 12.0,
              fontWeight: FontWeight.w700,
              color: ColorsPallette.buttons),
          decoration: const InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1.0),
            ),
            hintText: '',
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget _registerButton() {
    return Center(
      child: ButtonTheme(
        height: 36.0,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorsPallette.buttons,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.transparent)),
          ),
          child: Text(
            "Register",
            style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: "Open Sans",
                fontWeight: FontWeight.w700),
          ),
          onPressed: () => _registerPassword(context),
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
      showMessage(context, "Error empty fields", "text fields must not be empty.");
      return ;
    }

    PasswordModel passwordModel = PasswordModel(name: name, pass: pass, description: desc);
    usecase.savePassword(passwordModel);
    context.pop(true);
  }
}
