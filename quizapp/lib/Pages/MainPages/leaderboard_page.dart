import 'package:flutter/material.dart';

import '../../Util/Paiter.dart';

class LeaderBoard extends StatelessWidget {
  const LeaderBoard({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: SafeArea(
          child: ShaderMask(
            shaderCallback: (Rect bounds) {
              // Create a linear gradient shader for the mask
              return LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.onSecondaryContainer,
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.onPrimary,
                  Theme.of(context).colorScheme.onTertiaryContainer,
                  Theme.of(context).colorScheme.onTertiaryContainer,
                  Theme.of(context).colorScheme.onTertiaryContainer,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ).createShader(bounds);
            },
            child: CustomPaint(
              size: size,
              painter: LeaderBoard_shape(context: context),
              child: const Column(
                children: [
                  Text("haha"),
                  SizedBox(
                    height: 500,
                  ),
                  Text("Baba"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
