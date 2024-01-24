import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:badges/badges.dart' as badges;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';

import '../../Controllers/student_controller.dart';
import '../../Models/StudentScoreModel.dart';
import '../../Util/Paiter.dart';
import '../../Util/Shimmer_loading.dart';

class LeaderBoard extends StatefulWidget {
  const LeaderBoard({super.key});

  @override
  State<LeaderBoard> createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  late StreamController<StudentScoreModel> _scoreStreamController;
  late Stream<StudentScoreModel> _scoreStream;
  late Timer _fetchDataTimer;

  @override
  void initState() {
    super.initState();

    // Initialize the StreamController and Stream
    _scoreStreamController = StreamController<StudentScoreModel>();
    _scoreStream = _scoreStreamController.stream;

    // Start fetching data periodically
    _fetchDataTimer = Timer.periodic(const Duration(seconds: 5), (Timer t) {
      _fetchData();
    });
  }

  @override
  void dispose() {
    // Dispose of the StreamController and cancel the timer when the widget is disposed
    _scoreStreamController.close();
    _fetchDataTimer.cancel(); // Add this line
    super.dispose();
  }

  Future<void> _fetchData() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.mobile) {
      StudentScoreModel rankedStudents =
          await student_controller.getAllStudentsByRank();

      // Add the fetched data to the stream
      _scoreStreamController.add(rankedStudents);
    } else {
      Fluttertoast.showToast(
          msg: "Connection Problem",
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: StreamBuilder<StudentScoreModel>(
        stream: _scoreStream,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Text('Press button to start.');
            case ConnectionState.active:
            case ConnectionState.waiting:
              return AllShimmers.LeaderBoardShimmer(context, size);
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                List<Data> originalList = snapshot.data!.data;

                // Create a new list starting from index 3
                List<Data> newList =
                    originalList.length >= 4 ? originalList.sublist(3) : [];
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
                                Theme.of(context)
                                    .colorScheme
                                    .onSecondaryContainer,
                                Theme.of(context).colorScheme.primary,
                                Theme.of(context).colorScheme.onPrimary,
                                Theme.of(context)
                                    .colorScheme
                                    .onTertiaryContainer,
                                Theme.of(context)
                                    .colorScheme
                                    .onTertiaryContainer,
                                Theme.of(context)
                                    .colorScheme
                                    .onTertiaryContainer,
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
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer,
                                  ),
                            ),
                            SizedBox(
                              width: size.width,
                              height: size.height * 0.3,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  originalList.length >= 2
                                      ? Stack(
                                          alignment:
                                              const FractionalOffset(0.5, -0.5),
                                          children: [
                                            Container(
                                                width: size.width * 0.3,
                                                height: size.height * 0.18,
                                                decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .background
                                                      .withOpacity(0.2),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(10),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 55.0),
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        originalList[1]
                                                            .student
                                                            .Name,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodySmall,
                                                      ),
                                                      Text(
                                                          "${originalList[1].broadcastScore}"),
                                                    ],
                                                  ),
                                                )),
                                            CachedNetworkImage(
                                              imageUrl: originalList[1]
                                                  .student
                                                  .ImageUrl,
                                              imageBuilder:
                                                  (context, imageProvider) {
                                                return badges.Badge(
                                                  badgeContent: const Text("3"),
                                                  badgeStyle:
                                                      const badges.BadgeStyle(
                                                          badgeColor: Colors
                                                              .greenAccent),
                                                  position: badges.BadgePosition
                                                      .bottomEnd(
                                                          end: 25, bottom: -15),
                                                  child: CircleAvatar(
                                                    backgroundColor:
                                                        Colors.greenAccent,
                                                    radius: 37,
                                                    child: CircleAvatar(
                                                      backgroundColor:
                                                          Theme.of(context)
                                                              .colorScheme
                                                              .onBackground,
                                                      radius: 35,
                                                      child: CircleAvatar(
                                                        backgroundColor:
                                                            Theme.of(context)
                                                                .colorScheme
                                                                .onBackground,
                                                        backgroundImage:
                                                            imageProvider,
                                                        radius: 33,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ],
                                        )
                                      : Container(),
                                  originalList.isNotEmpty
                                      ? Stack(
                                          alignment:
                                              const FractionalOffset(0.5, -0.4),
                                          children: [
                                            Container(
                                              width: size.width * 0.3,
                                              height: size.height * 0.23,
                                              decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .background
                                                    .withOpacity(0.3),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(10),
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 70.0),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      originalList[0]
                                                          .student
                                                          .Name,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodySmall,
                                                    ),
                                                    Text(
                                                        "${originalList[0].broadcastScore}"),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Stack(
                                              alignment: const FractionalOffset(
                                                  0.5, -0.4),
                                              // alignment: Alignment.topCenter,
                                              children: [
                                                CachedNetworkImage(
                                                  imageUrl: originalList[0]
                                                      .student
                                                      .ImageUrl,
                                                  imageBuilder:
                                                      (context, imageProvider) {
                                                    return badges.Badge(
                                                      badgeContent:
                                                          const Text("1"),
                                                      badgeStyle: const badges
                                                          .BadgeStyle(
                                                          badgeColor:
                                                              Colors.yellow),
                                                      position:
                                                          badges.BadgePosition
                                                              .bottomEnd(
                                                                  end: 35,
                                                                  bottom: -15),
                                                      child: CircleAvatar(
                                                        backgroundColor:
                                                            Colors.yellow,
                                                        radius: 42,
                                                        child: CircleAvatar(
                                                          backgroundColor:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .onBackground,
                                                          radius: 39,
                                                          child: CircleAvatar(
                                                            backgroundColor:
                                                                Theme.of(
                                                                        context)
                                                                    .colorScheme
                                                                    .onBackground,
                                                            backgroundImage:
                                                                imageProvider,
                                                            radius: 37,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                                Lottie.asset(
                                                  'Assets/lottie/crown.json',
                                                  height: 30,
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                      : Container(),
                                  originalList.length >= 3
                                      ? Stack(
                                          alignment:
                                              const FractionalOffset(0.5, -0.6),
                                          children: [
                                            Container(
                                              width: size.width * 0.3,
                                              height: size.height * 0.17,
                                              decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .background
                                                    .withOpacity(0.1),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(15),
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 50.0),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      originalList[2]
                                                          .student
                                                          .Name,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodySmall,
                                                    ),
                                                    Text(
                                                        "${originalList[2].broadcastScore}"),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            CachedNetworkImage(
                                              imageUrl: originalList[2]
                                                  .student
                                                  .ImageUrl,
                                              imageBuilder:
                                                  (context, imageProvider) {
                                                return badges.Badge(
                                                  badgeContent: const Text("3"),
                                                  badgeStyle:
                                                      const badges.BadgeStyle(
                                                          badgeColor:
                                                              Colors.redAccent),
                                                  position: badges.BadgePosition
                                                      .bottomEnd(
                                                          end: 25, bottom: -15),
                                                  child: CircleAvatar(
                                                    backgroundColor:
                                                        Colors.redAccent,
                                                    radius: 37,
                                                    child: CircleAvatar(
                                                      backgroundColor:
                                                          Theme.of(context)
                                                              .colorScheme
                                                              .onBackground,
                                                      radius: 35,
                                                      child: CircleAvatar(
                                                        backgroundColor:
                                                            Theme.of(context)
                                                                .colorScheme
                                                                .onBackground,
                                                        backgroundImage:
                                                            imageProvider,
                                                        radius: 33,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ],
                                        )
                                      : Container()
                                ],
                              ),
                            ),

                            // This is the place where the bttom lists start
                            Expanded(
                              child: originalList.length >= 4
                                  ? ReorderableListView.builder(
                                      itemBuilder: (context, index) {
                                        return Container(
                                          key: Key("$index"),
                                          margin:
                                              const EdgeInsets.only(bottom: 10),
                                          decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .background,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Theme.of(context)
                                                    .canvasColor,
                                                offset: const Offset(2, 3),
                                              ),
                                            ],
                                          ),
                                          child: ListTile(
                                            leading: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 3.0),
                                                  child: Text("$index"),
                                                ),
                                                CachedNetworkImage(
                                                  imageUrl: newList[index]
                                                      .student
                                                      .ImageUrl,
                                                  imageBuilder:
                                                      (context, imageProvider) {
                                                    return CircleAvatar(
                                                      radius: 30,
                                                      backgroundImage:
                                                          imageProvider,
                                                    );
                                                  },
                                                )
                                              ],
                                            ),
                                            title: Text(
                                              newList[index].student.Name,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                            ),
                                            trailing: Text(
                                              "${newList[index].broadcastScore}",
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
                                      itemCount: newList.length,
                                      onReorder: (oldIndex, newIndex) {
                                        setState(() {
                                          if (oldIndex > newIndex) {
                                            newIndex -= 1;
                                          }
                                          final Data tmp = newList[oldIndex];
                                          newList.remove(oldIndex);
                                          newList.insert(newIndex, tmp);
                                        });
                                      },
                                    )
                                  : Container(),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }
          }
        },
      ),
    );
  }
}
