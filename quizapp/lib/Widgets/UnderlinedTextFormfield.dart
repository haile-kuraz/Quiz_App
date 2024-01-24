import 'package:flutter/material.dart';

class UnderlinedTextFormfield extends StatelessWidget {
  const UnderlinedTextFormfield({
    super.key,
    required this.inputController,
    required this.hint,
    required this.lable,
    required this.expression,
  });

  final TextEditingController? inputController;
  final String hint;
  final String lable;
  final RegExp expression;
  String? validateFunction(String? value, String lable) {
    if (value!.isEmpty) {
      return 'Please enter A $lable';
    } else if (!expression.hasMatch(value)) {
      return 'Please enter a valid $lable';
    }
    // Return null if the input is valid
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        controller: inputController,
        validator: (value) => validateFunction(value, lable),
        style: const TextStyle(),
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onBackground,
              width: 2,
              style: BorderStyle.solid,
            ),
          ),
          labelText: lable,
          hintText: hint,
        ),
      ),
    );
  }
}
