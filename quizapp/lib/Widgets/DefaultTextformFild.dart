import 'package:flutter/material.dart';

class DefaultTextformWidget extends StatelessWidget {
  const DefaultTextformWidget({
    super.key,
    required this.size,
    required this.textController,
    required this.lableText,
    required this.prefixIcon,
    required this.inputType,
    required this.Expression,
  });
  final Size size;
  final TextEditingController textController;
  final String lableText;
  final Icon prefixIcon;
  final TextInputType inputType;
  final RegExp Expression;

  @override
  Widget build(BuildContext context) {
    String? validateFunction(String? value) {
      if (value!.isEmpty) {
        return 'Please enter $lableText';
      } else if (!Expression.hasMatch(value)) {
        return 'Please enter a valid $lableText';
      }
      // Return null if the input is valid
      return null;
    }

    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: size.height * 0.08,
          minHeight: size.height * 0.07,
          maxWidth: size.width,
          minWidth: size.width,
        ),
        child: TextFormField(
          validator: (value) => validateFunction(value),
          keyboardType: inputType,
          controller: textController,
          decoration: InputDecoration(
            label: Text(lableText),
            prefixIcon: prefixIcon,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.tertiaryContainer,
                width: 2,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
