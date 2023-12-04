import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Subcategory_Page extends StatelessWidget {
  const Subcategory_Page({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        title: Text(
          "Maths",
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
            CachedNetworkImage(
              imageUrl:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5d7xk5xccg4hiHYEfkKtHN-TaC-isbB7G07Oj5ldzFHkDGkJSiAgkVKtpp6JCVGAlAoo&usqp=CAU",
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Text(
                "1000 questions",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    width: size.width,
                    height: size.height * 0.12,
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).canvasColor,
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(
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
                            imageUrl:
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5d7xk5xccg4hiHYEfkKtHN-TaC-isbB7G07Oj5ldzFHkDGkJSiAgkVKtpp6JCVGAlAoo&usqp=CAU",
                            imageBuilder: (context, imageProvider) => Container(
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Algebra",
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
                                "50 Question",
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
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
