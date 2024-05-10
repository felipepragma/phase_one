import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phase_one_app/presentation/utils/colors.dart';

///
/// Custom TextField used in pages views.
/// 
/// [hintText] : custom hit text of textfield
/// [_textEditingController] : controller of textfield
/// [readOnly] : flag enabled/diabled textfield
/// 
class CustomTextfield extends StatelessWidget {
  
  final String hintText;
  final TextEditingController _textEditingController;
  final bool readOnly;

  const CustomTextfield(this.hintText, this._textEditingController, this.readOnly, {super.key});

  @override
  Widget build(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hintText,
          style: GoogleFonts.openSans(
              fontSize: 14.0,
              fontWeight: FontWeight.w700,
              color: ColorsPallette.buttons),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          controller: _textEditingController,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          readOnly: readOnly,
          enabled: !readOnly,
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
}