import 'package:flutter/material.dart';

class UnderlinedTextFormfield extends StatelessWidget {
  const UnderlinedTextFormfield({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        style: const TextStyle(),
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onBackground,
              width: 2,
              style: BorderStyle.solid,
            ),
          ),
          labelText: "Name",
        ),
      ),
    );
  }
}
