import 'package:flutter/material.dart';

class messageTextAreaforReportProblem extends StatelessWidget {
  const messageTextAreaforReportProblem({
    super.key,
    required this.inputController,
  });
  final TextEditingController? inputController;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: Theme.of(context).colorScheme.onBackground,
            style: BorderStyle.solid,
          ),
        ),
        child: TextFormField(
          controller: inputController,
          maxLines: null, // Allow for multiple lines of input
          decoration: const InputDecoration(
            hintText: 'Enter your Problem...',
            contentPadding: EdgeInsets.all(16.0),
            border: InputBorder.none, // Remove the default border
          ),
        ),
      ),
    );
  }
}
