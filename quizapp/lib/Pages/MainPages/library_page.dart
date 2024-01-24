import 'package:flutter/material.dart';

class Liberary extends StatelessWidget {
  const Liberary({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Orientation orentation = MediaQuery.of(context).orientation;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SizedBox(
            width: size.width,
            height: size.height,
            child: Stack(
              children: [
                Container(
                  width: size.width,
                  height: size.height * 0.32,
                  // color: Colors.amber,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("Assets/Images/book2.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.26,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Books",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(
                                    color: Colors.white,
                                    fontFamily: "wellcome",
                                  ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.black87,
                              Colors.black87,
                              Colors.black.withOpacity(0.7),
                              Theme.of(context).colorScheme.onBackground,
                              Theme.of(context).colorScheme.onBackground,
                              Theme.of(context)
                                  .colorScheme
                                  .onBackground
                                  .withOpacity(0.9),
                              Theme.of(context).colorScheme.background,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          color: Theme.of(context).colorScheme.background,
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(40),
                          ),
                        ),
                        // color: Colors.red,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(top: 30, left: 8, right: 8),
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 0.7,
                              crossAxisSpacing: 9,
                              crossAxisCount: 2,
                            ),
                            itemBuilder: (context, index) {
                              return SizedBox(
                                width: size.width * 0.3,
                                height: size.height * 0.2,
                                child: Card(
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "Assets/Images/bookcov.png"),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }
}
