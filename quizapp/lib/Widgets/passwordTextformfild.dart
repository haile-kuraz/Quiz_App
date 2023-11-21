import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PasswordTextField extends StatefulWidget {
  PasswordTextField(
      {super.key,
      required this.size,
      required this.isvisible,
      required this.passwordController});
  final Size size;
  bool isvisible;
  final TextEditingController? passwordController;
  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: SizedBox(
        height: widget.size.height * 0.07,
        child: TextFormField(
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
      ),
    );
  }
}
