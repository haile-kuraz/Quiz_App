import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
// for localization
import 'package:easy_localization/easy_localization.dart';

import '../../Provider/LanguageProvider.dart';
import '../../translate/local_keys.g.dart';

import '../../Provider/PeriferanceProvider.dart';
import '../../Widgets/RankandPoint.dart';
import 'tabviewpages/acadamic_tabview.dart';
import 'tabviewpages/general_tabview.dart';
import 'tabviewpages/missions_tabview.dart';

class MainCategory extends StatefulWidget {
  const MainCategory({Key? key});

  @override
  State<MainCategory> createState() => _MainCategoryState();
}

class _MainCategoryState extends State<MainCategory>
    with TickerProviderStateMixin {
  late TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(
      builder: (currentcontext, languageProvider, child) {
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
                    _buildUserInfo(currentcontext),
                    _buildRankAndPointDashboard(currentcontext),
                    _buildExerciseText(currentcontext),
                    _buildTabView(currentcontext),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildUserInfo(BuildContext context) {
    final PeriferanceState = Provider.of<Periferance>(context);
    final size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${LocaleKeys.hi.tr()},${PeriferanceState.getName()}",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontFamily: "wellcome"),
            ),
            Text(
              LocaleKeys.practice.tr(),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(0.7),
                  ),
            ),
          ],
        ),
        CachedNetworkImage(
          imageUrl: "${PeriferanceState.getImage()}",
          imageBuilder: (context, imageProvider) {
            return CircleAvatar(
              backgroundImage: imageProvider,
              radius: 30,
            );
          },
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ],
    );
  }

  Widget _buildRankAndPointDashboard(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Animate(
      effects: const [
        FlipEffect(
          duration: Duration(seconds: 1),
        ),
        ScaleEffect(
          duration: Duration(milliseconds: 500),
        ),
      ],
      child: RankandPointDashbord(size: size),
    );
  }

  Widget _buildExerciseText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        "Lets Exercise",
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Theme.of(context)
                .colorScheme
                .tertiaryContainer
                .withOpacity(0.7)),
      ),
    );
  }

  Widget _buildTabView(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Expanded(
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Container(
              child: TabBar(
                labelColor: Theme.of(context).colorScheme.primary,
                unselectedLabelColor:
                    Theme.of(context).colorScheme.primary.withOpacity(0.5),
                controller: tabController,
                labelStyle: Theme.of(context).textTheme.labelMedium,
                indicator: UnderlineTabIndicator(
                  insets: const EdgeInsets.symmetric(
                    vertical: 2,
                    horizontal: 15,
                  ),
                  borderSide: BorderSide(
                      width: 3, color: Theme.of(context).colorScheme.primary),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                onTap: (value) {
                  print(value);
                },
                tabs: [
                  Tab(
                    text: LocaleKeys.acadamic.tr(),
                  ),
                  Tab(
                    text: LocaleKeys.general.tr(),
                  ),
                  Tab(
                    text: LocaleKeys.Missions.tr(),
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
    );
  }
}
