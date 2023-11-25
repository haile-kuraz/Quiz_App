import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class Brodcast extends StatelessWidget {
  const Brodcast({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            // width: size,
            child: Column(
              children: [
                // This is the place where the broud cast timer shown
                Container(
                  width: size.width,
                  height: size.height * 0.3,
                  decoration: BoxDecoration(
                      color: Theme.of(context).canvasColor,
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).colorScheme.onBackground,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                          blurStyle: BlurStyle.normal,
                          spreadRadius: 5,
                        )
                      ]),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image(
                        image: AssetImage(
                          "Assets/Images/persone waiting.png",
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "History of best performers",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          color:
                              Theme.of(context).colorScheme.onTertiaryContainer,
                        ),
                  ),
                ),

                // This is the place where the list of best perfromers shown
                Expanded(
                  child: AnimationLimiter(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 1500),
                          child: SlideAnimation(
                            horizontalOffset: 30,
                            child: FadeInAnimation(
                              child: ListTile(
                                leading: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 3.0),
                                      child: Text("${index + 1}"),
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
                                subtitle: Text(
                                  "Rank: 200",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                ),
                                trailing: Text(
                                  "1000 points",
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
                            ),
                          ),
                        );
                      },
                      itemCount: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
