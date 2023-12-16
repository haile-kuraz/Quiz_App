import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

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
}
