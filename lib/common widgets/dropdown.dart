// Flutter imports:
import 'package:flutter/material.dart';

class CommonDropdown<T> extends StatelessWidget {
  final T? value;
  final String title;
  final List<T> items;
  final void Function(T?)? onChanged;
  const CommonDropdown(
      {Key? key,
      this.value,
      required this.title,
      this.onChanged,
      required this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title),
        const SizedBox(
          height: 8,
        ),
        DropdownButtonFormField<T>(
          decoration: InputDecoration(hintText: "Enter ${title.toLowerCase()}"),
          items: items
              .map((T e) => DropdownMenuItem<T>(
                    value: e,
                    onTap: () {},
                    child: Text("$e"),
                  ))
              .toList(),
          value: value,
          onChanged: onChanged,
        ),
        const SizedBox(
          height: 15,
        )
      ],
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}
