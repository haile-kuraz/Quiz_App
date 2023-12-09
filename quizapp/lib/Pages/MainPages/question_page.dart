import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Question_page extends StatelessWidget {
  const Question_page({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 1,
        title: Text("2 of 10"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Row(
              children: [
                Image.asset(
                  "Assets/Images/alarm.png",
                ),
                Text(
                  "03:58",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          )
        ],
      ),
      body: CachedNetworkImage(
          imageUrl:
              "https://upload.wikimedia.org/wikipedia/commons/6/67/Apollo_17_Image_Of_Earth_From_Space.jpeg",
          imageBuilder: (context, imageProvider) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context)
                        .colorScheme
                        .background
                        .withOpacity(0.9), // Replace with the desired color
                    BlendMode
                        .srcOver, // Choose a blend mode that suits your needs
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    PageView.builder(
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 20),
                              child: Container(
                                width: size.width,
                                height: size.height * 0.2,
                                decoration: BoxDecoration(
                                  // color: Theme.of(context).colorScheme.background,
                                  color: Theme.of(context).canvasColor,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 5,
                                      blurStyle: BlurStyle.outer,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                      offset: const Offset(-2, -2),
                                      spreadRadius: 2,
                                    ),
                                  ],
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text("This is Box for question"),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: size.width,
                                height: size.height * 0.5,
                                child: ListView.builder(
                                  itemBuilder: (context, index) {
                                    return Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        width: size.width,
                                        height: size.height * 0.09,
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 2,
                                              blurStyle: BlurStyle.outer,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onBackground,
                                              offset: const Offset(2, 2),
                                              spreadRadius: 2,
                                            ),
                                          ],
                                          // color: Theme.of(context).colorScheme.background,
                                          color: Theme.of(context).canvasColor,
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5.0),
                                          child: ListTile(
                                            onTap: () {
                                              print(index);
                                            },
                                            leading: Text(
                                              "A",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineMedium,
                                            ),
                                            title: Text("The an option"),
                                          ),
                                        ));
                                  },
                                  itemCount: 4,
                                ),
                              ),
                            )
                          ],
                        );
                      },
                      itemCount: 3,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 30),
                      width: size.width,
                      height: size.height * 0.2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Center(
                            child: TextButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                  elevation: const MaterialStatePropertyAll(5),
                                  backgroundColor: MaterialStatePropertyAll(
                                    Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
                                  )),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 60.0,
                                  vertical: 4,
                                ),
                                child: Text(
                                  "Next",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary),
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              child: Icon(FontAwesomeIcons.chevronUp),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
