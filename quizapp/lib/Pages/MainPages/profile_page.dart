import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../Controllers/mainCategory_controller.dart';

import '../../Models/MainCategryModel.dart';
import '../../Provider/PeriferanceProvider.dart';
import '../../Widgets/RankandPoint.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    var PeriferianceState = Provider.of<Periferance>(context);
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: FutureBuilder(
              future: mainCategory_controller.showAllMainCategories(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Categories> categories = snapshot.data!.categories;

                  return CustomScrollView(
                    slivers: <Widget>[
                      SliverAppBar(
                        automaticallyImplyLeading: false,
                        pinned: true,
                        floating: true,
                        backgroundColor:
                            Theme.of(context).colorScheme.background,
                        expandedHeight: 0,
                        // centerTitle: true,
                        actions: [
                          IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "/Setting");
                            },
                            icon: Icon(
                              FontAwesomeIcons.gear,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                              size: 30,
                            ),
                          )
                        ],
                        title: Text(
                          "Profile",
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onTertiaryContainer,
                                  ),
                        ),
                        snap: true,
                        flexibleSpace: const FlexibleSpaceBar(
                            // Flexible space content...
                            ),
                      ),
                      SliverToBoxAdapter(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: 300,
                            minHeight: 200,
                            maxWidth: size.width,
                            minWidth: size.width,
                          ),
                          child: Column(
                            children: [
                              AvatarGlow(
                                glowColor:
                                    Theme.of(context).colorScheme.primary,
                                animate: true,
                                endRadius: 80.0,
                                duration: const Duration(milliseconds: 8000),
                                repeat: true,
                                showTwoGlows: true,
                                repeatPauseDuration:
                                    const Duration(milliseconds: 1000),
                                child: Material(
                                  // Replace this child with your own
                                  elevation: 8.0,
                                  shape: const CircleBorder(),
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
                                        backgroundColor:
                                            Theme.of(context).canvasColor,
                                        radius: 15,
                                        child: Icon(
                                          FontAwesomeIcons.pencil,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                          size: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Text(
                                "${PeriferianceState.getName()}",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),

                              // This the place where the point and and ranking starts
                              RankandPointDashbord(
                                size: size,
                              )
                            ],
                          ),
                        ),
                      ),
                      SliverAnimatedList(
                        itemBuilder: (context, index, animation) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              bottom: 8.0,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).colorScheme.background,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Theme.of(context).canvasColor,
                                      blurRadius: 2,
                                      offset: Offset(2, 2),
                                      blurStyle: BlurStyle.normal,
                                      spreadRadius: 2,
                                    )
                                  ]),
                              child: ListTile(
                                leading: SizedBox(
                                  width: size.width * 0.2,
                                  height: double.infinity,
                                  child: CachedNetworkImage(
                                    imageUrl: categories[index].imageUrl,
                                    fit: BoxFit.cover,
                                    progressIndicatorBuilder: (context, url,
                                            downloadProgress) =>
                                        CircularProgressIndicator(
                                            value: downloadProgress.progress),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                ),
                                title: Text(
                                  categories[index].name,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                subtitle: LinearPercentIndicator(
                                  barRadius: const Radius.circular(10),
                                  backgroundColor:
                                      Theme.of(context).canvasColor,
                                  percent: 0.5,
                                  // fillColor: Theme.of(context).colorScheme.primary,
                                  trailing: const Text("100"),
                                  lineHeight: size.height * 0.015,
                                  progressColor: Theme.of(context)
                                      .colorScheme
                                      .onSecondaryContainer,
                                ),
                              ),
                            ),
                          );
                        },
                        initialItemCount:
                            categories.length, // Number of list items
                      ),
                    ],
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ),
      ),
    );
  }
}
