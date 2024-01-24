import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
// for localization

import '../../../Controllers/mainCategory_controller.dart';
import '../../../Models/MainCategryModel.dart';
import '../../../Provider/LanguageProvider.dart';
import '../../../Util/Shimmer_loading.dart';

class AcadamicTabview extends StatelessWidget {
  const AcadamicTabview({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var LangState = Provider.of<LanguageProvider>(context);
    return CustomMaterialIndicator(
      onRefresh: () async {
        await mainCategory_controller.showAllMainCategories();
      },
      indicatorBuilder: (currentcontext, controller) {
        return const Icon(
          Icons.donut_large,
          size: 30,
        );
      },
      child: Consumer<LanguageProvider>(
        builder: (currentcontext, languageProvider, child) {
          return FutureBuilder(
            future: mainCategory_controller.showAllMainCategories(),
            builder: (currentcontext, snapshot) {
              if (snapshot.hasData) {
                int status = snapshot.data!.status;

                List<Categories> categories = snapshot.data!.categories;
                List<Categories> AcadamicCategories = categories
                    .where((category) => category.categoryType == 'acadamic')
                    .toList();

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.0),
                  child: AnimationLimiter(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: size.width * 0.03,
                        mainAxisSpacing: size.height * 0.02,
                        childAspectRatio: 1.7,
                      ),
                      itemBuilder: (context, index) {
                        return AnimationConfiguration.staggeredGrid(
                          position: index,
                          duration: const Duration(milliseconds: 700),
                          // delay: const Duration(milliseconds: 200),
                          columnCount: 2,
                          child: ScaleAnimation(
                            child: FadeInAnimation(
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    "/Subcategory",
                                    arguments: {
                                      'Category_Id':
                                          AcadamicCategories[index].id,
                                      'Category_Image':
                                          AcadamicCategories[index].imageUrl,
                                      "Category_name":
                                          AcadamicCategories[index].name,
                                      "NumberOfQuestions":
                                          AcadamicCategories[index]
                                              .normalQuestions
                                              .length,
                                      // Add more parameters as needed
                                    },
                                  );
                                },
                                child: Hero(
                                  tag: AcadamicCategories[index].name,
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        AcadamicCategories[index].imageUrl,
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Theme.of(currentcontext)
                                                .colorScheme
                                                .onBackground
                                                .withOpacity(0.9),
                                            blurRadius: 2,
                                            blurStyle: BlurStyle.normal,
                                            offset: const Offset(2, 4),
                                            spreadRadius: 1,
                                          )
                                        ],
                                        color: Theme.of(currentcontext)
                                            .colorScheme
                                            .background,
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                      child: Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Theme.of(currentcontext)
                                                  .canvasColor,
                                              borderRadius:
                                                  const BorderRadius.only(
                                                bottomLeft: Radius.circular(10),
                                                topRight: Radius.circular(25),
                                              )),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 3, horizontal: 10),
                                            child: Text(
                                              AcadamicCategories[index].name,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge
                                                  ?.copyWith(
                                                    color:
                                                        Theme.of(currentcontext)
                                                            .colorScheme
                                                            .onPrimaryContainer,
                                                    fontWeight: FontWeight.w800,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    placeholder: (currentcontext, url) =>
                                        const CircularProgressIndicator(),
                                    errorWidget: (currentcontext, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: AcadamicCategories.length,
                    ),
                  ),
                );
              } else if (snapshot.hashCode == 404) {
                print("there is no data");
                return Container(child: const CircularProgressIndicator());
              } else {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: size.width * 0.03,
                    mainAxisSpacing: size.height * 0.02,
                    childAspectRatio: 1.7,
                  ),
                  itemBuilder: (currentcontext, index) {
                    return AllShimmers.MainCategoriesShimmer(currentcontext);
                  },
                );
              }
            },
          );
        },
      ),
    );
  }
}
