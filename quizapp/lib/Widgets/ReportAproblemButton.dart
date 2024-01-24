import 'package:flutter/material.dart';

class ReportAproblemButton extends StatelessWidget {
  const ReportAproblemButton({
    super.key,
    required this.myfunction,
  });
  final Function myfunction;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        myfunction();
      },
      style: ButtonStyle(
        elevation: const MaterialStatePropertyAll(2),
        shape: const MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
        backgroundColor: MaterialStatePropertyAll(
          Theme.of(context).colorScheme.primaryContainer,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          "Report A problem",
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSecondary,
              ),
        ),
      ),
    );
  }
}
