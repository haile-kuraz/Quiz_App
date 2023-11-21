import 'package:flutter/material.dart';

class DefaultTextformWidget extends StatelessWidget {
  const DefaultTextformWidget(
      {super.key,
      required this.size,
      required this.textController,
      required this.lableText,
      required this.prefixIcon,
      required this.inputType});
  final Size size;
  final TextEditingController textController;
  final String lableText;
  final Icon prefixIcon;
  final TextInputType inputType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: SizedBox(
        height: size.height * 0.07,
        child: TextFormField(
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
