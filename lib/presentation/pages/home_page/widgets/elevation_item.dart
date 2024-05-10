import 'package:flutter/material.dart';
import 'package:phase_one_app/presentation/utils/colors.dart';

///
/// ElevatedListItem : 
/// 
/// Item used in password list
///
///
class ElevatedListItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function onTap;

  const ElevatedListItem({super.key, required this.title, required this.subtitle, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shadowColor: Colors.grey.withOpacity(0.5),
      child: InkWell(
        child: Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            padding: const EdgeInsets.only(left: 16, top: 10, right: 16, bottom: 10),
            child: Row(
              children: [
                const CircleAvatar(
                    radius: 30.0,
                    backgroundColor: ColorsPallette.buttons,
                    child: Icon(Icons.lock, color: Colors.white, size: 28)),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        subtitle,
                        style:
                            const TextStyle(fontSize: 12.0, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: ColorsPallette.buttons,
                  size: 20,
                ),
              ],
            )),
            onTap: () {
              onTap();
            },
      ),
    );
  }
}
