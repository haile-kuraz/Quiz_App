import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AcadamicTabview extends StatelessWidget {
  const AcadamicTabview({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: AnimationLimiter(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: size.width * 0.03,
            mainAxisSpacing: size.height * 0.02,
            childAspectRatio: 1.7,
          ),
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredGrid(
              position: index,
              duration: const Duration(milliseconds: 1500),
              columnCount: 2,
              child: ScaleAnimation(
                child: FadeInAnimation(
                  child: Container(
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
                              .withOpacity(0.9),
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
                        padding: const EdgeInsets.symmetric(
                            vertical: 3, horizontal: 5),
                        child: Text(
                          "Maths",
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer,
                                    fontWeight: FontWeight.w800,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
          itemCount: 10,
        ),
      ),
    );
  }
}
