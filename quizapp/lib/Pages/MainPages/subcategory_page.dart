import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../Controllers/subCategories_controller.dart';
import '../../Models/SubCategoriesModel.dart';

class Subcategory_Page extends StatelessWidget {
  const Subcategory_Page({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // Retrieve the arguments
    final args = ModalRoute.of(context)!.settings.arguments as Map;

    // Access the parameters
    int? Category_Id = args['Category_Id'];
    String? Category_name = args['Category_name'];
    String? Category_Image = args['Category_Image'];
    int? QuestionInCategory = args['NumberOfQuestions'];

    // Use the parameters in your widget

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        title: Text(
          "$Category_name",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.onTertiaryContainer,
                fontWeight: FontWeight.w800,
              ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: "$Category_Image",
              child: CachedNetworkImage(
                imageUrl: "$Category_Image",
                imageBuilder: (context, imageProvider) => Container(
                  width: size.width,
                  height: size.height * 0.23,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(
                      20,
                    )),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 2,
                          blurStyle: BlurStyle.normal,
                          spreadRadius: 2,
                          offset: const Offset(3, 3),
                          color: Theme.of(context).canvasColor)
                    ],
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                      colorFilter:
                          ColorFilter.mode(Colors.black12, BlendMode.darken),
                    ),
                  ),
                ),
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Text(
                "$QuestionInCategory questions",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Expanded(
              child: FutureBuilder<SubcategoriesModel>(
                future: subCategory_controller.showAllSubCategories(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Subcategory> DATA = snapshot.data!.subcategory;
                    List<Subcategory> SubCategories = DATA
                        .where((category) => category.categoryId == Category_Id)
                        .toList();
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              "/Question",
                              arguments: {
                                'Category_Id': Category_Id,
                                'SubCategory_Id': SubCategories[index].id,
                                'SubCategory_Image':
                                    SubCategories[index].imageUrl,

                                // Add more parameters as needed
                              },
                            );
                          },
                          child: Container(
                            width: size.width,
                            height: size.height * 0.12,
                            margin: const EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Theme.of(context).canvasColor,
                                width: 1,
                                style: BorderStyle.solid,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(
                                10,
                              )),
                              color: Theme.of(context)
                                  .colorScheme
                                  .background
                                  .withOpacity(0.5),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 2,
                                  blurStyle: BlurStyle.normal,
                                  spreadRadius: 1,
                                  offset: const Offset(0, 3),
                                  color: Theme.of(context).canvasColor,
                                )
                              ],
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: CachedNetworkImage(
                                    imageUrl: SubCategories[index].imageUrl,
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                    ),
                                    placeholder: (context, url) => const Center(
                                        child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        SubCategories[index].name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge
                                            ?.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .tertiaryContainer,
                                            ),
                                      ),
                                      Text(
                                        "${SubCategories[index].normalQuestions.length} Questions",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .tertiary,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: SubCategories.length,
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
