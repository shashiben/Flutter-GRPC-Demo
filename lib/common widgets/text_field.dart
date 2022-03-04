// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String title;
  final bool enabled;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  const CommonTextField(
      {Key? key,
      this.controller,
      required this.title,
      this.inputFormatters,
      this.enabled = true,
      this.keyboardType})
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
          keyboardType: keyboardType,
          enabled: enabled,
          controller: controller,
          inputFormatters: inputFormatters,
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
