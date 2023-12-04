import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../Widgets/RankandPoint.dart';

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
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: Theme.of(context).colorScheme.background,
                expandedHeight: 0,
                // centerTitle: true,
                actions: [
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
                title: Text(
                  "Profile",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color:
                            Theme.of(context).colorScheme.onTertiaryContainer,
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
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Text("Medina Nasure"),

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
                          color: Theme.of(context).colorScheme.background,
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
                        leading: Image.asset("Assets/Images/ch.png"),
                        title: Text(
                          'Item $index',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        subtitle: LinearPercentIndicator(
                          barRadius: const Radius.circular(10),
                          backgroundColor: Theme.of(context).canvasColor,
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
                initialItemCount: 100, // Number of list items
              ),
            ],
          ),
        ),
      ),
    );
  }
}
