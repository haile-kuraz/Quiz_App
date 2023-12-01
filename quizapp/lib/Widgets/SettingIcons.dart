import 'package:flutter/material.dart';

class SettingIcons extends StatelessWidget {
  const SettingIcons({
    super.key,
    required this.icon,
  });

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          colors: [
            Theme.of(context).colorScheme.onSecondaryContainer,
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.onTertiaryContainer,
          ], // Specify your gradient colors
          tileMode: TileMode.clamp,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ).createShader(bounds);
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 6.0),
        child: Icon(
          icon,
          size: 25.0,
          color: Colors
              .white, // You can set the color to white or any other color that suits your design
        ),
      ),
    );
  }
}
