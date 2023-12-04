import 'package:flutter/material.dart';

class RankandPointDashbord extends StatelessWidget {
  const RankandPointDashbord({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width,
      height: size.height * 0.12,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          // color: Theme.of(context).colorScheme.secondary,
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                blurStyle: BlurStyle.outer,
                color: Theme.of(context).colorScheme.onBackground)
          ]),
      child: Row(
        children: [
          Expanded(
              child: Row(
            children: [
              Image.asset(
                width: 70,
                "Assets/Images/cup_one.png",
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Ranking",
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .tertiaryContainer
                              .withOpacity(0.7)),
                    ),
                    Text(
                      "214",
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ],
                ),
              )
            ],
          )),
          VerticalDivider(
            color: Theme.of(context).colorScheme.primary,
          ),
          Expanded(
            child: Row(
              children: [
                Image.asset(
                  width: 70,
                  "Assets/Images/coin.png",
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Points",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .tertiaryContainer
                                .withOpacity(0.7)),
                      ),
                      Text(
                        "214",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
