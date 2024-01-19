import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../Controllers/student_controller.dart';
import '../../../Util/Shimmer_loading.dart';
import '../../../Models/StudentScoreModel.dart' as score;

class BestPerformaers extends StatelessWidget {
  const BestPerformaers({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomMaterialIndicator(
        onRefresh: () async {
          final connectivityResult = await Connectivity().checkConnectivity();
          if (connectivityResult == ConnectivityResult.wifi ||
              connectivityResult == ConnectivityResult.mobile) {
            await student_controller.getTopTenStudentsByRank();
          } else {
            Fluttertoast.showToast(
                msg: "Connection Problem",
                toastLength: Toast.LENGTH_SHORT,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        },
        indicatorBuilder: (context, controller) {
          return const Icon(
            Icons.donut_large,
            size: 30,
          );
        },
        child: FutureBuilder(
          future: student_controller.getTopTenStudentsByRank(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Text('Press button to start.');
              case ConnectionState.active:
              case ConnectionState.waiting:
                return AllShimmers.TopTenBestPerformesShimmer(
                    context); // 4. Loading state
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}'); // 5. Error state
                } else {
                  // 6. Success state
                  // Access your data using snapshot.data
                  List<score.Data> data = snapshot.data!.data;
                  return AnimationLimiter(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 1500),
                          child: SlideAnimation(
                            horizontalOffset: 30,
                            child: FadeInAnimation(
                              child: Card(
                                elevation: 2,
                                child: ListTile(
                                  leading: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 3.0),
                                        child: Text("${index + 1}"),
                                      ),
                                      CachedNetworkImage(
                                        imageUrl: data[index].student.ImageUrl,
                                        imageBuilder: (context, imageProvider) {
                                          return CircleAvatar(
                                            backgroundImage: imageProvider,
                                            radius: 30,
                                          );
                                        },
                                        placeholder: (context, url) =>
                                            const CircularProgressIndicator(),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                      ),
                                    ],
                                  ),
                                  title: Text(
                                    data[index].student.Name,
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  subtitle: Text(
                                    "Rank: ${data[index].rank ?? 0}",
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
                                    "${data[index].points} Point",
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
                          ),
                        );
                      },
                      itemCount: data.length,
                    ),
                  );
                }
            }
          },
        ),
      ),
    );
  }
}
