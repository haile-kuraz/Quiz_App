import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:quizapp/Provider/AuthProvider.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../Controllers/mainCategory_controller.dart';
import '../../../Models/MainCategryModel.dart';

class AcadamicTabview extends StatelessWidget {
  const AcadamicTabview({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<MainCategoryModel>(
      future: mainCategory_controller.showAllMainCategories(),
      builder: (context, snapshot) {
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
                    duration: const Duration(milliseconds: 1500),
                    columnCount: 2,
                    child: ScaleAnimation(
                      child: FadeInAnimation(
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              "/Subcategory",
                              arguments: {
                                'Category_Id': AcadamicCategories[index].id,
                                'Category_Image':
                                    AcadamicCategories[index].ImageUrl,
                                "Category_name": AcadamicCategories[index].name,
                                // Add more parameters as needed
                              },
                            );
                          },
                          child: CachedNetworkImage(
                            imageUrl: AcadamicCategories[index].ImageUrl,
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground
                                        .withOpacity(0.9),
                                    blurRadius: 2,
                                    blurStyle: BlurStyle.normal,
                                    offset: const Offset(2, 4),
                                    spreadRadius: 1,
                                  )
                                ],
                                color: Theme.of(context).colorScheme.background,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).canvasColor,
                                      borderRadius: const BorderRadius.only(
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
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimaryContainer,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
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
          return Container(child: CircularProgressIndicator());
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
