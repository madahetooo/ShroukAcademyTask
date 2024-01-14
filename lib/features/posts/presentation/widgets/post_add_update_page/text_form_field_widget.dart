import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String name;
  final TextEditingController controller;
  final bool multiLine;

  const TextFormFieldWidget({
    super.key,
    required this.name,
    required this.controller,
    required this.multiLine,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: name,
          border: const OutlineInputBorder(),
          alignLabelWithHint: true,
        ),
        style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
        maxLines: multiLine ? 5 : 1,
        keyboardType: multiLine ? TextInputType.multiline : TextInputType.text,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '$name cannot be empty';
          }
          return null;
        },
      ),
    );
  }
}
