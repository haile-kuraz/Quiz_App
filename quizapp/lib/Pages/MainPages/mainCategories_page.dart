import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../Widgets/RankandPoint.dart';
import 'tabviewpages/acadamic_tabview.dart';
import 'tabviewpages/general_tabview.dart';
import 'tabviewpages/missions_tabview.dart';

class MainCategory extends StatefulWidget {
  const MainCategory({super.key});

  @override
  State<MainCategory> createState() => _MainCategoryState();
}

class _MainCategoryState extends State<MainCategory>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TabController tabController = TabController(length: 3, vsync: this);
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        color: Theme.of(context).colorScheme.background,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hi,medina",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Text(
                          "practice makes you better!!!",
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground
                                        .withOpacity(0.7),
                                  ),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      backgroundColor:
                          Theme.of(context).colorScheme.onBackground,
                      radius: 30,
                    ),
                  ],
                ),

                // here is code for displying rank and Points board
                Animate(
                  effects: const [
                    FlipEffect(
                      duration: Duration(seconds: 1),
                    ),
                    ScaleEffect(
                      duration: Duration(milliseconds: 500),
                    ),
                  ],
                  child: RankandPointDashbord(size: size),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    "Lets Exercise",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .tertiaryContainer
                            .withOpacity(0.7)),
                  ),
                ),

// this is the code to show all categories is the tapView form

//
                Expanded(
                  child: SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        Container(
                          child: TabBar(
                            labelColor: Theme.of(context).colorScheme.primary,
                            unselectedLabelColor: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.5),
                            controller: tabController,
                            labelStyle: Theme.of(context).textTheme.labelMedium,
                            indicator: UnderlineTabIndicator(
                              insets: const EdgeInsets.symmetric(
                                vertical: 2,
                                horizontal: 15,
                              ),
                              borderSide: BorderSide(
                                  width: 3,
                                  color: Theme.of(context).colorScheme.primary),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            onTap: (value) {
                              print(value);
                            },
                            tabs: const [
                              Tab(
                                text: "Acadamic",
                              ),
                              Tab(
                                text: "General",
                              ),
                              Tab(
                                text: "Missions",
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: Theme.of(context).colorScheme.background,
                          width: size.width,
                          height: size.height * 0.55,
                          child: TabBarView(
                            controller: tabController,
                            children: const [
                              AcadamicTabview(),
                              GeneralTabview(),
                              MissionTabview()
                            ],
                          ),
                        ),
                      ],
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
