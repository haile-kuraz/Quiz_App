import 'package:flutter/material.dart';

class AcadamicTabview extends StatelessWidget {
  const AcadamicTabview({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: size.width * 0.03,
          mainAxisSpacing: size.height * 0.02,
          childAspectRatio: 1.5,
        ),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage(
                  "Assets/Images/maths.png",
                ),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.onBackground,
                    BlendMode.darken),
              ),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.7),
                  blurRadius: 4,
                  blurStyle: BlurStyle.normal,
                  offset: const Offset(2, 4),
                  spreadRadius: 3,
                )
              ],
              color: Theme.of(context).colorScheme.background,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                child: Text(
                  "Maths",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        fontWeight: FontWeight.w800,
                      ),
                ),
              ),
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
