// Flutter imports:
import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String title;
  final bool enabled;
  const CommonTextField(
      {Key? key, this.controller, required this.title, this.enabled = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          enabled: enabled,
          controller: controller,
          decoration: InputDecoration(hintText: "Enter ${title.toLowerCase()}"),
        ),
        const SizedBox(
          height: 15,
        )
      ],
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}
