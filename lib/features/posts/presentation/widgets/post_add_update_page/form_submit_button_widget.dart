import 'package:flutter/material.dart';

class FormSubmitButtonWidget extends StatelessWidget {
  final bool isEditMode;
  final VoidCallback onSubmit;

  const FormSubmitButtonWidget({
    super.key,
    required this.isEditMode,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onSubmit,
      icon: Icon(isEditMode ? Icons.update : Icons.add),
      label: const Text('Submit'),
    );
  }
}
