import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AllShimmers {
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
}
