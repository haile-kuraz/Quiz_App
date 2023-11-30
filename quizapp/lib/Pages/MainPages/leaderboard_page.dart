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
          child: Stack(
            children: [
              ShaderMask(
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
                  child: SizedBox(
                    width: size.width,
                    height: size.height,
                  ),
                ),
              ),
              Column(
                children: [
                  Text(
                    "LeaderBoard",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                  ),
                  SizedBox(
                    width: size.width,
                    height: size.height * 0.3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Stack(
                          alignment: const FractionalOffset(0.5, -0.5),
                          children: [
                            Container(
                                width: size.width * 0.3,
                                height: size.height * 0.18,
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .background
                                      .withOpacity(0.2),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 40.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        "haile",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                      const Text("95"),
                                    ],
                                  ),
                                )),
                            CircleAvatar(
                              backgroundColor:
                                  Theme.of(context).colorScheme.onBackground,
                              radius: 35,
                            ),
                          ],
                        ),
                        Stack(
                          alignment: const FractionalOffset(0.5, -0.4),
                          children: [
                            Container(
                              width: size.width * 0.3,
                              height: size.height * 0.23,
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .background
                                    .withOpacity(0.3),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 50.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "haile",
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                    const Text("95"),
                                  ],
                                ),
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor:
                                  Theme.of(context).colorScheme.onBackground,
                              radius: 40,
                            ),
                          ],
                        ),
                        Stack(
                          alignment: const FractionalOffset(0.5, -0.6),
                          children: [
                            Container(
                              width: size.width * 0.3,
                              height: size.height * 0.17,
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .background
                                    .withOpacity(0.1),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 40.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "haile",
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                    const Text("95"),
                                  ],
                                ),
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor:
                                  Theme.of(context).colorScheme.onBackground,
                              radius: 35,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // This is the place where the bttom lists start
                  Expanded(
                    child: Container(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.background,
                              boxShadow: [
                                BoxShadow(
                                  color: Theme.of(context).canvasColor,
                                  offset: const Offset(2, 3),
                                ),
                              ],
                            ),
                            child: ListTile(
                              leading: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 3.0),
                                    child: Text("${index + 4}"),
                                  ),
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Theme.of(context)
                                        .colorScheme
                                        .onBackground,
                                  )
                                ],
                              ),
                              title: Text(
                                "medina nasure",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              trailing: Text(
                                "90.2",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimaryContainer,
                                    ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
