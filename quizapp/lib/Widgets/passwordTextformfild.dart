import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PasswordTextField extends StatefulWidget {
  PasswordTextField(
      {super.key,
      required this.size,
      required this.isvisible,
      required this.passwordController,
      required this.Expression});
  final Size size;
  bool isvisible;
  final TextEditingController? passwordController;
  final RegExp Expression;
  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  @override
  Widget build(BuildContext context) {
    String? validateFunction(String? value) {
      if (value!.isEmpty) {
        return 'Please enter A Password';
      } else if (!widget.Expression.hasMatch(value)) {
        return 'Please enter a valid Password';
      }
      // Return null if the input is valid
      return null;
    }

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: widget.size.height * 0.08,
        minHeight: widget.size.height * 0.07,
        maxWidth: widget.size.width,
        minWidth: widget.size.width,
      ),
      child: TextFormField(
        validator: (value) => validateFunction(value),
        controller: widget.passwordController,
        obscureText: !widget.isvisible,
        decoration: InputDecoration(
          label: const Text("password"),
          prefixIcon: const Icon(Icons.lock),
          suffix: IconButton(
            onPressed: () {
              setState(() {
                widget.isvisible = !widget.isvisible;
              });
            },
            icon: widget.isvisible
                ? const Icon(Icons.visibility)
                : const Icon(Icons.visibility_off),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.tertiaryContainer,
              width: 2,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }
}
