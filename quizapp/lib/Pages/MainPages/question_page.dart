import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:confetti/confetti.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:provider/provider.dart';
// --------------------------------this package is fortosting -----
import 'package:another_flushbar/flushbar.dart';

// ------------------------------------------------------------

import '../../Controllers/CategoryPoint_controller.dart';
import '../../Controllers/normalQuestions_controller.dart';
import '../../Models/NormalQuestionsModle.dart';
import '../../Provider/PeriferanceProvider.dart';

class Question_page extends StatefulWidget {
  const Question_page({super.key});

  @override
  State<Question_page> createState() => _Question_pageState();
}

class _Question_pageState extends State<Question_page> {
  PageController pageviewController = PageController(initialPage: 0);
  final ConfettiController confettiController = ConfettiController();
  var PeriferianceState;
  var PeriferianceUpdate;
  int pagenumber = 1;
  bool isclicked = false;
  int selectedIndex = -1;
  bool isLocked = true;
  int correctChoices = 0;
  int wrongChoices = 0;
  @override
  void dispose() {
    super.dispose();
    confettiController.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PeriferianceState = Provider.of<Periferance>(context);
    PeriferianceUpdate = Provider.of<Periferance>(context, listen: false);
    final args = ModalRoute.of(context)!.settings.arguments as Map;

    // Access the parameters
    int? categoryId = args['Category_Id'];
    int? subCategoryId = args['SubCategory_Id'];
    String? subCategoryImage = args['SubCategory_Image'];

    // Use the parameters in your widget
    Size size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: normalQuesion_controller.getAllQuestions(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Data> data = snapshot.data!.data;
          List<Data> questions = data
              .where((question) => question.categoryId == categoryId)
              .where((question) => question.subcategoryId == subCategoryId)
              .toList();
          return Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.background,
              elevation: 1,
              title: Text("$pagenumber of ${questions.length}"),
              centerTitle: true,
              actions: [
                PeriferianceState.getisTimershowing()
                    ? Padding(
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
                    : const Text(" ")
              ],
            ),
            body: CachedNetworkImage(
                imageUrl: "$subCategoryImage",
                imageBuilder: (context, imageProvider) {
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          Theme.of(context).colorScheme.background.withOpacity(
                              0.85), // Replace with the desired color
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
                            onPageChanged: (value) {
                              setState(() {
                                pagenumber++;
                              });
                            },
                            physics: const NeverScrollableScrollPhysics(),
                            controller: pageviewController,
                            itemBuilder: (context, pageindex) {
                              return Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 20),
                                    child: Container(
                                      width: size.width,
                                      height: size.height * 0.2,
                                      decoration: BoxDecoration(
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
                                      child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            questions[pageindex].question,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge,
                                          )),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      width: size.width,
                                      height: size.height * 0.5,
                                      child: ListView.builder(
                                        itemBuilder: (context, index) {
                                          return Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 10),
                                            width: size.width,
                                            height: size.height * 0.08,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: isclicked
                                                    ? selectedIndex == index
                                                        ? questions[pageindex]
                                                                    .options[
                                                                        index]
                                                                    .IsCorrect ==
                                                                1
                                                            ? Colors.green
                                                            : Colors.red
                                                        : questions[pageindex]
                                                                    .options[
                                                                        index]
                                                                    .IsCorrect ==
                                                                1
                                                            ? Colors.green
                                                            : Theme.of(context)
                                                                .canvasColor
                                                    : Theme.of(context)
                                                        .canvasColor,
                                                width: 2,
                                              ),
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
                                              color:
                                                  Theme.of(context).canvasColor,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 2.0, bottom: 2),
                                              child: ListTile(
                                                onTap: isLocked
                                                    ? () {
                                                        onclick(
                                                          index,
                                                          questions,
                                                          pageindex,
                                                          size,
                                                          categoryId!.toInt(),
                                                          PeriferianceState
                                                              .getStudentId(),
                                                        );
                                                      }
                                                    : () {},
                                                leading: Text(
                                                  questions[pageindex]
                                                      .options[index]
                                                      .code
                                                      .toUpperCase(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineMedium,
                                                ),
                                                title: Text(questions[pageindex]
                                                    .options[index]
                                                    .OptionValue),
                                                trailing: isclicked
                                                    ? selectedIndex == index
                                                        ? questions[pageindex]
                                                                    .options[
                                                                        index]
                                                                    .IsCorrect ==
                                                                1
                                                            ? const Icon(
                                                                Icons.check)
                                                            : const Icon(
                                                                Icons.close)
                                                        : questions[pageindex]
                                                                    .options[
                                                                        index]
                                                                    .IsCorrect ==
                                                                1
                                                            ? const Icon(
                                                                Icons.check)
                                                            : null
                                                    : null,
                                              ),
                                            ),
                                          );
                                        },
                                        itemCount:
                                            questions[pageindex].options.length,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                            itemCount: questions.length,
                          ),
                          _bottomAreaBuilder(size, questions.length)
                        ],
                      ),
                    ),
                  );
                }),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  void onclick(int index, questions, int pageindex, Size size, int categoryId,
      int studentId) async {
    setState(() {
      isclicked = true;
      isLocked = false;
      selectedIndex = index;
    });
    if (questions[pageindex].options[index].IsCorrect == 1) {
      if (PeriferianceState.getIsthereSound()) {
        AssetsAudioPlayer.newPlayer().open(
          Audio('Assets/Sounds/Quizsounds/correct.mp3'),
          autoStart: true,
        );
      }
      // This the place to add the audio for correct answer
      setState(() {
        correctChoices++;
      });
    } else {
      Flushbar(
        positionOffset: 5.3,
        dismissDirection: FlushbarDismissDirection.HORIZONTAL,
        margin: const EdgeInsets.all(20),
        borderRadius: BorderRadius.circular(8),
        title: "Hint",
        titleColor: Theme.of(context).colorScheme.primaryContainer,
        message: "${questions[pageindex].solutionDescription}",
        flushbarPosition: FlushbarPosition.BOTTOM,
        flushbarStyle: FlushbarStyle.FLOATING,
        reverseAnimationCurve: Curves.decelerate,
        forwardAnimationCurve: Curves.elasticOut,
        backgroundColor: Colors.red,
        boxShadows: [
          BoxShadow(
              color: Theme.of(context).colorScheme.onBackground,
              offset: const Offset(0.0, 2.0),
              blurRadius: 3.0)
        ],
        backgroundGradient:
            const LinearGradient(colors: [Colors.blueGrey, Colors.black]),
        isDismissible: true,
        icon: const Icon(FontAwesomeIcons.exclamation),
      ).show(context);

      /*  DelightToastBar(
        builder: (context) => ToastCard(
          leading: Image.asset(
            "Assets/Images/Hint.png",
          ),
          title: Text(
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
        ),
      ).show(context); */

      if (PeriferianceState.getIsthereSound()) {
        AssetsAudioPlayer.newPlayer().open(
          Audio('Assets/Sounds/Quizsounds/error.mp3'),
          autoStart: true,
        );
      }
      // This is the place to add an audio for wrong choice we made
      wrongChoices++;
    }
    if (questions.length == (correctChoices + wrongChoices)) {
      await Future.delayed(const Duration(seconds: 1));
      _ShowingDialog(size, questions.length);
      // here we will entert the points to data base
      CategoryPoint_controller.AddingPoint(
          studentId, categoryId, correctChoices);
    }
  }

  void _ShowingDialog(Size size, int totlQuestions) async {
    confettiController.play();
    if (PeriferianceState.getIsthereSound()) {
      AssetsAudioPlayer.newPlayer().open(
        Audio('Assets/Sounds/Effects/clap.mp3'),
        autoStart: true,
      );
    }
    showGeneralDialog(
      context: context,
      barrierLabel: "Dismiss",
      barrierDismissible: true,
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Container();
      },
      transitionBuilder: (context, a1, a2, child) {
        return ScaleTransition(
          scale: Tween<double>(begin: 0.5, end: 1).animate(a1),
          child: FadeTransition(
            opacity: Tween<double>(begin: 0.5, end: 1).animate(a1),
            child: Dialog(
              shape: const BeveledRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: SizedBox(
                height: size.height * 0.24,
                child: Stack(
                  alignment: const Alignment(0, -1.7),
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 50.0, bottom: 10),
                          child: Text(
                            "Congratulations!",
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),
                        Text(
                          "You have scored $correctChoices points",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          top: BorderSide(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onBackground,
                                              width: 2),
                                          right: BorderSide(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onBackground,
                                              width: 1))),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    child: Text("Q$totlQuestions \n Total",
                                        textAlign: TextAlign.center),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      top: BorderSide(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onBackground,
                                          width: 2),
                                      right: BorderSide(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onBackground,
                                          width: 1),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    child: Text("Q$wrongChoices \n Wrong",
                                        textAlign: TextAlign.center),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      top: BorderSide(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onBackground,
                                          width: 2),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    child: Text("Q$correctChoices \n Correct",
                                        textAlign: TextAlign.center),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    ConfettiWidget(
                      strokeWidth: 1,
                      maxBlastForce: 20,
                      minBlastForce: 15,
                      // displayTarget: true,
                      blastDirectionality: BlastDirectionality.explosive,
                      confettiController: confettiController,
                      emissionFrequency: 0.2,
                      colors: const [
                        Colors.green,
                        Colors.yellow,
                        Colors.red,
                      ],
                      child: const CircleAvatar(
                        backgroundImage: AssetImage("Assets/Images/win.png"),
                        radius: 40,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      isclicked = false;
    });
  }

  Widget _bottomAreaBuilder(Size size, int numberofQuestions) {
    return Container(
      padding: const EdgeInsets.only(top: 30),
      width: size.width,
      height: size.height * 0.2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: TextButton(
              onPressed: isLocked
                  ? () {}
                  : () {
                      setState(() {
                        isclicked = false;
                        numberofQuestions != pagenumber
                            ? isLocked = true
                            : null;
                        selectedIndex = -1;
                      });

                      pageviewController.nextPage(
                        curve: Curves.fastOutSlowIn,
                        duration: const Duration(seconds: 1),
                      );
                    },
              style: ButtonStyle(
                  elevation: const MaterialStatePropertyAll(5),
                  backgroundColor: MaterialStatePropertyAll(
                    Theme.of(context).colorScheme.primaryContainer,
                  )),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 60.0,
                  vertical: 4,
                ),
                child: Text(
                  "Next",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).colorScheme.secondary),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                _ShowingDialog(size, numberofQuestions);
              },
              child: const CircleAvatar(
                child: Icon(FontAwesomeIcons.chevronUp),
              ),
            ),
          )
        ],
      ),
    );
  }
}
