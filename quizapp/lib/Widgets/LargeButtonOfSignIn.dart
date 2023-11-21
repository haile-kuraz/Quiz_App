import 'package:flutter/material.dart';

class largeButtonWidget extends StatelessWidget {
  const largeButtonWidget({
    required this.lable,
    required this.size,
    super.key,
  });

  final String lable;
  final Size size;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.8,
      height: size.height * 0.07,
      child: TextButton(
        onPressed: () {},
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
              ?.copyWith(color: Theme.of(context).colorScheme.tertiary),
        ),
      ),
    );
  }
}
