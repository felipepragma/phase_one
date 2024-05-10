import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phase_one_app/presentation/utils/colors.dart';

///
/// Custom Password TextField used in pages views.
/// 
/// [hintText] : custom hit text of textfield
/// [_textEditingController] : controller of textfield
/// [readOnly] : flag enabled/diabled textfield
/// 
class CustomPasswordTextfield extends StatefulWidget {
  final String hintText;
  final TextEditingController _textEditingController;
  final bool readOnly;

  const CustomPasswordTextfield(this.hintText, this._textEditingController, this.readOnly, {super.key});

  @override
  State<CustomPasswordTextfield> createState() =>
      _CustomPasswordTextfieldState();
}

class _CustomPasswordTextfieldState extends State<CustomPasswordTextfield> {
  bool showPass = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.hintText,
          style: GoogleFonts.openSans(
              fontSize: 14.0,
              fontWeight: FontWeight.w700,
              color: ColorsPallette.buttons),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          controller: widget._textEditingController,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          obscureText: showPass,
          readOnly: widget.readOnly,
          enabled: !widget.readOnly,
          maxLines: 1,
          style: GoogleFonts.openSans(
              fontSize: 12.0,
              fontWeight: FontWeight.w700,
              color: ColorsPallette.buttons),
          decoration: InputDecoration(
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 1.0),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 1.0),
              ),
              hintText: '',
              suffixIconConstraints:
                  const BoxConstraints(minWidth: 23, maxHeight: 20),
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: GestureDetector(
                  child: SizedBox(
                    width: 17,
                    height: 20,
                    child: Icon( showPass ? Icons.remove_red_eye : Icons.remove_red_eye_outlined, color: ColorsPallette.buttons)
                  ),
                  onTap: () {
                    showPassword();
                  },
                ),
              )),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  void showPassword() {
    setState(() {
      showPass = !showPass;
    });
  }
}
