import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../Controllers/mainCategory_controller.dart';

import '../../Models/CategoryPointsModel.dart';
import '../../Provider/PeriferanceProvider.dart';
import '../../Util/Shimmer_loading.dart';
import '../../Widgets/EditProfilePageDialog.dart';
import '../../Widgets/PopUps.dart';
import '../../Widgets/RankandPoint.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final Connectivity _connectivity = Connectivity();
  ConnectivityResult _connectivityResult = ConnectivityResult.none;

  @override
  void initState() {
    _connectivity.onConnectivityChanged.listen(_updateConnectivityStatus);
    super.initState();
  }

  Future<void> _updateConnectivityStatus(ConnectivityResult result) async {
    setState(() {
      _connectivityResult = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    var PeriferianceState = Provider.of<Periferance>(context);
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(children: [
            Consumer(builder: (context, LanguageProvider, child) {
              return SizedBox(
                height: size.height * 0.07,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Profile",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onTertiaryContainer,
                          ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/Setting");
                      },
                      icon: Icon(
                        FontAwesomeIcons.gear,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        size: 30,
                      ),
                    )
                  ],
                ),
              );
            }),
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("Assets/Images/profilebg.png"),
                  opacity: 0.2,
                  fit: BoxFit.cover,
                ),
              ),
              constraints: BoxConstraints(
                maxHeight: 300,
                minHeight: 200,
                maxWidth: size.width,
                minWidth: size.width,
              ),
              child: Column(
                children: [
                  AvatarGlow(
                    glowColor: Theme.of(context).colorScheme.primary,
                    animate: true,
                    endRadius: 80.0,
                    duration: const Duration(milliseconds: 8000),
                    repeat: true,
                    showTwoGlows: true,
                    repeatPauseDuration: const Duration(milliseconds: 1000),
                    child: Material(
                      // Replace this child with your own
                      elevation: 8.0,
                      shape: const CircleBorder(),
                      child: InkWell(
                        onTap: () {
                          showGeneralDialog(
                            context: context,
                            /*  barrierLabel: "Dismiss",
                                            barrierDismissible: true, */
                            transitionDuration:
                                const Duration(milliseconds: 400),
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return Container();
                            },
                            transitionBuilder: (context, a1, a2, child) {
                              return ScaleTransition(
                                scale: Tween<double>(begin: 0.5, end: 1)
                                    .animate(a1),
                                child: FadeTransition(
                                  opacity: Tween<double>(begin: 0.5, end: 1)
                                      .animate(a1),
                                  child: const Dialog(
                                    child: EditProfileDialog(),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.grey[100],
                              radius: 45.0,
                              child: Image.asset(
                                "Assets/Images/SignUp/ProfileAvatar.png",
                                // height: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: Theme.of(context).canvasColor,
                              radius: 15,
                              child: Icon(
                                FontAwesomeIcons.pencil,
                                color: Theme.of(context).colorScheme.onPrimary,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Text(
                    PeriferianceState.getName()!.toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontFamily: "wellcome"),
                  ),

                  // This the place where the point and and ranking starts
                  RankandPointDashbord(
                    size: size,
                  )
                ],
              ),
            ),
            Expanded(
                child: CustomMaterialIndicator(
              onRefresh: () async {
                if (_connectivityResult == ConnectivityResult.wifi ||
                    _connectivityResult == ConnectivityResult.mobile) {
                  await mainCategory_controller.getAllcategoiesWithPoint(
                      PeriferianceState.getStudentId() ?? 0);
                } else {
                  AllPopUps.messageflutterToast("Connection Problem");
                }
              },
              indicatorBuilder: (currentcontext, controller) {
                return const Icon(
                  Icons.donut_large,
                  size: 30,
                );
              },
              child: Container(
                child: FutureBuilder(
                    future: mainCategory_controller.getAllcategoiesWithPoint(
                        PeriferianceState.getStudentId() ?? 0),
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
                            if (_connectivityResult.name == "none") {
                              AllPopUps.messageflutterToast(
                                  "Connection Problem");
                              AllPopUps.messageflutterToast(
                                  "Connection Problem");
                              AllPopUps.messageflutterToast(
                                  "Connection Problem");
                              return SizedBox(
                                  height: size.height * 0.3,
                                  child: FittedBox(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Lottie.asset(
                                            'Assets/lottie/nowifi.json'),
                                        Text(
                                          " There is connection Problem",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium,
                                        ),
                                      ],
                                    ),
                                  ));
                            } else {
                              return Text("server is the problem");
                            }
                          } else {
                            List<Data> categories = snapshot.data!.data;
                            return ListView.builder(
                              itemBuilder: (
                                context,
                                index,
                              ) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 8.0,
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .background,
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Theme.of(context).canvasColor,
                                            blurRadius: 2,
                                            offset: const Offset(2, 2),
                                            blurStyle: BlurStyle.normal,
                                            spreadRadius: 2,
                                          )
                                        ]),
                                    child: ListTile(
                                      leading: SizedBox(
                                        width: size.width * 0.2,
                                        height: double.infinity,
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              "${categories[index].imageUrl}",
                                          fit: BoxFit.cover,
                                          progressIndicatorBuilder: (context,
                                                  url, downloadProgress) =>
                                              CircularProgressIndicator(
                                                  value: downloadProgress
                                                      .progress),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                        ),
                                      ),
                                      title: Text(
                                        " ${categories[index].name}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                      subtitle: LinearPercentIndicator(
                                        barRadius: const Radius.circular(10),
                                        backgroundColor:
                                            Theme.of(context).canvasColor,
                                        percent:
                                            (categories[index].point!.point)! /
                                                100,
                                        // fillColor: Theme.of(context).colorScheme.primary,
                                        trailing: Text(
                                            "${categories[index].point!.point} %"),
                                        lineHeight: size.height * 0.015,
                                        progressColor: Theme.of(context)
                                            .colorScheme
                                            .onSecondaryContainer,
                                      ),
                                    ),
                                  ),
                                );
                              },
                              itemCount: categories.length,
                              // categories.length, // Number of list items
                            );
                          }
                      }
                    }),
              ),
            ))
          ]),
        ),
      ),
    );
  }
}
