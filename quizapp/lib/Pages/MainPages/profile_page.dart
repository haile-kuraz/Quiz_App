import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                pinned: true,
                floating: true,
                backgroundColor: Theme.of(context).colorScheme.background,
                expandedHeight: 0,
                centerTitle: true,
                actions: [
                  IconButton(
                    onPressed: () {
                      print("this is the setting Icon ");
                    },
                    icon: Icon(
                      FontAwesomeIcons.gear,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      size: 30,
                    ),
                  )
                ],
                title: Text(
                  "Profile",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color:
                            Theme.of(context).colorScheme.onTertiaryContainer,
                      ),
                ),
                snap: true,
                flexibleSpace: FlexibleSpaceBar(
                    // Flexible space content...
                    ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  // Collapsible/Expandable container properties...
                  // height: 300, // Initial height of the container
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
                          glowColor: Theme.of(context).colorScheme.primary,
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
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Text("Medina Nasure"),

                        // This the place where the point and and ranking starts
                        Container(
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
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground)
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Ranking",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall
                                              ?.copyWith(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .tertiaryContainer
                                                      .withOpacity(0.7)),
                                        ),
                                        Text(
                                          "214",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall
                                              ?.copyWith(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary),
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
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Points",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall
                                                ?.copyWith(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .tertiaryContainer
                                                        .withOpacity(0.7)),
                                          ),
                                          Text(
                                            "214",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall
                                                ?.copyWith(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .primary),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverAnimatedList(
                itemBuilder: (context, index, animation) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: ListTile(
                      leading: Image.asset("Assets/Images/ch.png"),
                      title: Text(
                        'Item $index',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      subtitle: LinearPercentIndicator(
                        barRadius: Radius.circular(10),
                        backgroundColor: Theme.of(context).canvasColor,
                        percent: 0.5,
                        // fillColor: Theme.of(context).colorScheme.primary,
                        trailing: Text("100"),
                        lineHeight: size.height * 0.015,
                        progressColor:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                      ),
                    ),
                  );
                },
                initialItemCount: 100, // Number of list items
              ),
            ],
          ),
        ),
      ),
    );
  }
}
