import 'package:flutter/material.dart';
import 'package:phase_one_app/presentation/utils/colors.dart';

///
/// Custom Button used in pages views.
/// 
/// [textButton] : Text of button
/// [onTap] : Override onTap function
/// 
class CustomButton extends StatelessWidget {
  final String textButton;
  final Function(BuildContext context) onTap;

  const CustomButton(this.textButton, this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ButtonTheme(
        height: 36.0,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorsPallette.buttons,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: const BorderSide(color: Colors.transparent)),
          ),
          child: Text(
            textButton,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: "Open Sans",
                fontWeight: FontWeight.w700),
          ),
          onPressed: () => onTap(context),
        ),
      ),
    );
  }
}
