import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../Widgets/ReportAproblemButton.dart';
import '../../Widgets/UnderlinedTextFormfield.dart';
import '../../Widgets/messageTextAreaforReportProblem.dart';

class Help_page extends StatelessWidget {
  Help_page({super.key});
  List<Map<String, String>> FAQData = [
    {
      "Title": "How to Play",
      "Message":
          ''' An expansive underworld of hidden wealth lies beneath the everyday economy.
                       This stealth network of tax havens, secret trusts, and offshore accounts is weakening democratic institutions and fueling our worst enemies.''',
    },
    {
      "Title": "How to start",
      "Message":
          ''' An expansive underworld of hidden wealth lies beneath the everyday economy.
                       This stealth network of tax havens, secret trusts, and offshore accounts is weakening democratic institutions and fueling our worst enemies.''',
    },
    {
      "Title": "How to Play",
      "Message":
          ''' An expansive underworld of hidden wealth lies beneath the everyday economy.
                       This stealth network of tax havens, secret trusts, and offshore accounts is weakening democratic institutions and fueling our worst enemies.''',
    },
    {
      "Title": "How to start",
      "Message":
          ''' An expansive underworld of hidden wealth lies beneath the everyday economy.
                       This stealth network of tax havens, secret trusts, and offshore accounts is weakening democratic institutions and fueling our worst enemies.''',
    },
    {
      "Title": "How to Play",
      "Message":
          ''' An expansive underworld of hidden wealth lies beneath the everyday economy.
                       This stealth network of tax havens, secret trusts, and offshore accounts is weakening democratic institutions and fueling our worst enemies.''',
    },
    {
      "Title": "How to start",
      "Message":
          ''' An expansive underworld of hidden wealth lies beneath the everyday economy.
                       This stealth network of tax havens, secret trusts, and offshore accounts is weakening democratic institutions and fueling our worst enemies.''',
    },
    {
      "Title": "How to Play",
      "Message":
          ''' An expansive underworld of hidden wealth lies beneath the everyday economy.
                       This stealth network of tax havens, secret trusts, and offshore accounts is weakening democratic institutions and fueling our worst enemies.''',
    },
    {
      "Title": "How to start",
      "Message":
          ''' An expansive underworld of hidden wealth lies beneath the everyday economy.
                       This stealth network of tax havens, secret trusts, and offshore accounts is weakening democratic institutions and fueling our worst enemies.''',
    },
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text("FAQ"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 6,
              child: SizedBox(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: ExpansionTile(
                        backgroundColor: Theme.of(context).canvasColor,
                        // collapsedBackgroundColor: Theme.of(context).canvasColor,
                        collapsedBackgroundColor: Theme.of(context)
                            .colorScheme
                            .onPrimaryContainer
                            .withOpacity(0.4),
                        title: Text(
                          "${FAQData[index]["Title"]}",
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onTertiaryContainer,
                                  ),
                        ),
                        children: [
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxHeight: size.height * 0.3,
                              maxWidth: size.width,
                              minHeight: size.height * 0.1,
                              minWidth: size.width,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 18.0, right: 40, bottom: 10),
                              child: Text(
                                "${FAQData[index]["Message"]}",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiaryContainer,
                                    ),
                              ),
                            ),
                          ),
                        ],
                        // textColor: ,
                      ),
                    );
                  },
                  itemCount: FAQData.length,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Container(
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Column(
                          children: [
                            Text(
                              "Haven't found an answer to ",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .tertiaryContainer,
                                  ),
                            ),
                            Text(
                              "your question ?",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .tertiaryContainer,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      ReportAproblemButton(myfunction: () {
                        _bottomSheetBuilder(context);
                      })
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future _bottomSheetBuilder(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: Theme.of(context).colorScheme.background,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "How can we help you ? ",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              /*   const UnderlinedTextFormfield(),
              const UnderlinedTextFormfield(), */
              const messageTextAreaforReportProblem(),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: ReportAproblemButton(myfunction: () {
                  print("haha");
                }),
              ),
            ],
          ),
        );
      },
    );
  }
}
