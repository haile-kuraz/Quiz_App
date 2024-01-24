import 'package:cached_network_image/cached_network_image.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

import '../../../Models/MainCategryModel.dart';
import '../../../Provider/LanguageProvider.dart';
import '../../../Controllers/mainCategory_controller.dart';
import '../../../Util/Shimmer_loading.dart';

class MissionTabview extends StatelessWidget {
  const MissionTabview({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("Assets/Images/bg1.png"),
            fit: BoxFit.cover,
            opacity: 0.5),
      ),
      child: CustomMaterialIndicator(
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
                  // Check the various states of the Future
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      // Future is not yet started
                      return Text('Press button to start.');
                    case ConnectionState.active:
                    case ConnectionState.waiting:
                      // Future is still running
                      return CircularProgressIndicator();
                    case ConnectionState.done:
                      // Future is completed

                      if (snapshot.hasData) {
                        int status = snapshot.data!.status;
                        // String messsage = snapshot.data!.messsage;

                        List<Categories> categories = snapshot.data!.categories;
                        List<Categories> AcadamicCategories = categories
                            .where((category) =>
                                category.categoryType == 'missions')
                            .toList();

                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 3.0, horizontal: 7),
                          child: AnimationLimiter(
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                return InkWell(
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
                                          Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Card(
                                          child: Container(
                                            width: size.width * 0.7,
                                            height: size.height * 0.2,
                                            child: Stack(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: imageProvider,
                                                      fit: BoxFit.cover,
                                                    ),
                                                    color:
                                                        Theme.of(currentcontext)
                                                            .colorScheme
                                                            .background,
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                      Radius.circular(10),
                                                    ),
                                                  ),
                                                  /*  child: Align(
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
                                                                                        ), */
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 10.0,
                                                          vertical: 5),
                                                      child: Container(
                                                        height: 40,
                                                        decoration:
                                                            const BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(20),
                                                          ),
                                                          color: Colors.black26,
                                                        ),
                                                        child: FittedBox(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Image.asset(
                                                                "Assets/Images/coin.png",
                                                                width: 50,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        8.0),
                                                                child:
                                                                    const Text(
                                                                        "50"),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: size.width,
                                                      height:
                                                          size.height * 0.07,
                                                      decoration: BoxDecoration(
                                                        /*   color: Theme.of(context)
                                                            .colorScheme
                                                            .onBackground, */
                                                        color: Theme.of(context)
                                                            .canvasColor,
                                                        borderRadius:
                                                            const BorderRadius
                                                                .vertical(
                                                          bottom:
                                                              Radius.circular(
                                                                  5),
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal:
                                                                    5.0),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              AcadamicCategories[
                                                                      index]
                                                                  .name,
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .titleLarge!
                                                                  .copyWith(
                                                                      fontFamily:
                                                                          "Poppins"),
                                                            ),
                                                            ElevatedButton.icon(
                                                              onPressed: () {},
                                                              icon: const Icon(Icons
                                                                  .flag_circle),
                                                              label: const Text(
                                                                  "START"),
                                                              style:
                                                                  ButtonStyle(
                                                                backgroundColor:
                                                                    MaterialStatePropertyAll(
                                                                  Theme.of(
                                                                          context)
                                                                      .colorScheme
                                                                      .primary
                                                                      .withOpacity(
                                                                          0.5),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      placeholder: (currentcontext, url) =>
                                          const CircularProgressIndicator(),
                                      errorWidget:
                                          (currentcontext, url, error) =>
                                              const Icon(Icons.error),
                                    ),
                                  ),
                                );
                              },
                              itemCount: AcadamicCategories.length,
                              // itemCount: 5,
                            ),
                          ),
                        );
                      } else {
                        return const Center(
                          child: Text("an error bro "),
                        );
                      }
                  }
                });
          },
        ),
      ),
    );
  }
}
