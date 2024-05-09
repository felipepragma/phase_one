import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phase_one_app/core/domain/entities/password.dart';
import 'package:phase_one_app/core/presentation/utils/colors.dart';

///
/// DetailPage : 
/// 
/// Page that shows the details of a password
///

class DetailPage extends StatefulWidget {
  final PasswordModel? passwordModel;

  const DetailPage({this.passwordModel, Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Password'),
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
          width: double.infinity,
          padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _avatar(), 
              _nameText(),
              _passText(), 
              _descText()]
            ),
      )),
    );
  }

  Widget _avatar() {
    return Container(
      width: double.infinity,
      height: 120,
      child: const CircleAvatar(
          radius: 30.0,
          backgroundColor: ColorsPallette.buttons,
          child: Icon(Icons.lock, color: Colors.white, size: 40)
      ),
    );
  }

  Widget _nameText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Text(
          "Name: ${widget.passwordModel?.name ?? ""}",
          style: GoogleFonts.openSans(
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
              color: ColorsPallette.buttons),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget _passText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Password: ${widget.passwordModel?.pass ?? ""}",
          style: GoogleFonts.openSans(
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
              color: ColorsPallette.buttons),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget _descText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description: ${widget.passwordModel?.description ?? ""}",
          style: GoogleFonts.openSans(
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
              color: ColorsPallette.buttons),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
