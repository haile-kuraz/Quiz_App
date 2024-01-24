import 'package:flutter/material.dart';

class largeButtonWidget extends StatelessWidget {
  const largeButtonWidget({
    required this.lable,
    required this.size,
    required this.formKey,
    required this.myFunction,
    super.key,
  });

  final String lable;
  final Size size;
  final GlobalKey<FormState> formKey;
  final Function myFunction;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.8,
      height: size.height * 0.07,
      child: TextButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            myFunction();
            // Form is valid, perform desired action
            // e.g., submit the form
          }
        },
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
              Theme.of(context).colorScheme.primaryContainer),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(17),
              ),
              side: BorderSide(color: Theme.of(context).colorScheme.primary),
            ),
          ),
        ),
        child: Text(
          lable,
          style: Theme.of(context)
              .textTheme
              .labelLarge
              ?.copyWith(color: Theme.of(context).colorScheme.secondary),
        ),
      ),
    );
  }
}
