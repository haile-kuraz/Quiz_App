import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:badges/badges.dart' as badges;

import 'Paiter.dart';

class AllShimmers {
  static Widget TopTenBestPerformesShimmer(
    BuildContext context,
  ) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Theme.of(context).canvasColor,
          direction: ShimmerDirection.ltr,
          highlightColor: Theme.of(context).colorScheme.onBackground,
          child: Container(
            height: size.height * 0.1,
            width: size.width,
            color: Theme.of(context).canvasColor.withOpacity(0.1),
            margin: const EdgeInsets.only(bottom: 10),
            child: ListTile(
              leading: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 3.0),
                    child: Text("${index + 1}"),
                  ),
                  Shimmer.fromColors(
                    baseColor: Theme.of(context).canvasColor,
                    direction: ShimmerDirection.ttb,
                    highlightColor:
                        Theme.of(context).colorScheme.onSecondaryContainer,
                    child: CircleAvatar(
                      backgroundColor: Theme.of(context).canvasColor,
                      radius: 30,
                    ),
                  )
                ],
              ),
              title: Padding(
                padding: const EdgeInsets.only(right: 80),
                child: Container(
                  height: size.height * 0.01,
                  color: Theme.of(context).canvasColor,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(right: 100),
                child: Container(
                  height: size.height * 0.01,
                  color: Theme.of(context).canvasColor,
                ),
              ),
              trailing: Text(
                "Point",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
              ),
            ),
          ),
        );
      },
      itemCount: 10,
    );
  }

  static Widget MainCategoriesShimmer(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).canvasColor,
      direction: ShimmerDirection.ttb,
      highlightColor: Theme.of(context).colorScheme.onSecondaryContainer,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color:
                  Theme.of(context).colorScheme.onBackground.withOpacity(0.5),
              blurRadius: 2,
              blurStyle: BlurStyle.normal,
              offset: const Offset(2, 4),
              spreadRadius: 1,
            )
          ],
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topRight: Radius.circular(25),
                )),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
              child: Text(
                "....................",
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Widget rankDialogShimmer(Size size) {
    return Container(
      height: size.height * 0.7,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            key: Key("{newList[index].rank}"),
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
            child: Shimmer.fromColors(
              baseColor: Theme.of(context).canvasColor,
              direction: ShimmerDirection.ltr,
              highlightColor: Theme.of(context).colorScheme.onBackground,
              child: ListTile(
                leading: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 3.0),
                      child: Text("1"),
                    ),
                    Shimmer.fromColors(
                      baseColor: Theme.of(context).canvasColor,
                      direction: ShimmerDirection.ltr,
                      highlightColor:
                          Theme.of(context).colorScheme.onBackground,
                      child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Theme.of(context).canvasColor),
                    )
                  ],
                ),
                title: Text(
                  "newList",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                trailing: Text(
                  "34565",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  static Widget LeaderBoardShimmer(BuildContext context, Size size) {
    return SizedBox(
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
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
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
                          Shimmer.fromColors(
                            baseColor: Theme.of(context).canvasColor,
                            direction: ShimmerDirection.ltr,
                            highlightColor:
                                Theme.of(context).colorScheme.onBackground,
                            child: Container(
                                width: size.width * 0.3,
                                height: size.height * 0.18,
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .canvasColor
                                      .withOpacity(0.3),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 55.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        "original",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                      const Text("45345"),
                                    ],
                                  ),
                                )),
                          ),
                          Shimmer.fromColors(
                            baseColor: Theme.of(context).canvasColor,
                            direction: ShimmerDirection.ltr,
                            highlightColor:
                                Theme.of(context).colorScheme.onBackground,
                            child: CircleAvatar(
                              backgroundColor: Theme.of(context).canvasColor,
                              radius: 37,
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        alignment: const FractionalOffset(0.5, -0.4),
                        children: [
                          Shimmer.fromColors(
                            baseColor: Theme.of(context).canvasColor,
                            direction: ShimmerDirection.ltr,
                            highlightColor:
                                Theme.of(context).colorScheme.onBackground,
                            child: Container(
                              width: size.width * 0.3,
                              height: size.height * 0.23,
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .canvasColor
                                    .withOpacity(0.3),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 70.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "origin",
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                    const Text("46987"),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Shimmer.fromColors(
                            baseColor: Theme.of(context).canvasColor,
                            direction: ShimmerDirection.ltr,
                            highlightColor:
                                Theme.of(context).colorScheme.onBackground,
                            child: CircleAvatar(
                              backgroundColor: Theme.of(context).canvasColor,
                              radius: 42,
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        alignment: const FractionalOffset(0.5, -0.6),
                        children: [
                          Shimmer.fromColors(
                            baseColor: Theme.of(context).canvasColor,
                            direction: ShimmerDirection.ltr,
                            highlightColor:
                                Theme.of(context).colorScheme.onBackground,
                            child: Container(
                              width: size.width * 0.3,
                              height: size.height * 0.17,
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .canvasColor
                                    .withOpacity(0.3),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 50.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "originalL",
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                    const Text("4365"),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Shimmer.fromColors(
                            baseColor: Theme.of(context).canvasColor,
                            direction: ShimmerDirection.ltr,
                            highlightColor:
                                Theme.of(context).colorScheme.onBackground,
                            child: CircleAvatar(
                              backgroundColor: Theme.of(context).canvasColor,
                              radius: 37,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // This is the place where the bttom lists start
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Container(
                        key: Key("{newList[index].rank}"),
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
                        child: Shimmer.fromColors(
                          baseColor: Theme.of(context).canvasColor,
                          direction: ShimmerDirection.ltr,
                          highlightColor:
                              Theme.of(context).colorScheme.onBackground,
                          child: ListTile(
                            leading: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(right: 3.0),
                                  child: Text("1"),
                                ),
                                Shimmer.fromColors(
                                  baseColor: Theme.of(context).canvasColor,
                                  direction: ShimmerDirection.ltr,
                                  highlightColor: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                  child: CircleAvatar(
                                      radius: 30,
                                      backgroundColor:
                                          Theme.of(context).canvasColor),
                                )
                              ],
                            ),
                            title: Text(
                              "newList",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            trailing: Text(
                              "34565",
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
                      );
                    },
                    itemCount: 10,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
