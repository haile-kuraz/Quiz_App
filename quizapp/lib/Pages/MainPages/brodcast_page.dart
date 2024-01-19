import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:bubble/bubble.dart';
import 'package:provider/provider.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:lottie/lottie.dart';

import '../../Controllers/broadcastQuestions_controller.dart';
import '../../Controllers/student_controller.dart';
import '../../Controllers/score_controller.dart';
import '../../Models/BroadcastQuestionsModel.dart';

import '../../Provider/PeriferanceProvider.dart';
import '../../Util/Shimmer_loading.dart';
import '../../Widgets/CountDownTimer.dart';
import '../../Widgets/RankDialog.dart';
import 'brodcast_section/History_of_best.dart';

class Brodcast extends StatefulWidget {
  const Brodcast({super.key});

  @override
  State<Brodcast> createState() => _BrodcastState();
}

class _BrodcastState extends State<Brodcast> {
  PageController pageviewController = PageController(initialPage: 0);

  String _current_Date = " ";
  String _current_Time = " ";
  var PeriferianceState;
  var PeriferianceUpdate;

  // These  are some data filds to checked latter

  late bool isclicked;
  late int selectedIndex;
  late int correctChoices;
  late int wrongChoices;

  // _____________________________________________________

  @override

  // ------------------This is where streaming Added---------------
  late StreamController<BroadcastQuestionsModel>
      _broadcastQuestionStreamController;
  late Stream<BroadcastQuestionsModel> _broadcastQuestionStream;
  late Timer _fetchDataTimer;

  @override
  void initState() {
    isclicked = false;
    correctChoices = 0;
    wrongChoices = 0;
    super.initState();

    // Initialize the StreamController and Stream
    _broadcastQuestionStreamController =
        StreamController<BroadcastQuestionsModel>();
    _broadcastQuestionStream = _broadcastQuestionStreamController.stream;

    // Start fetching data periodically
    _fetchDataTimer = Timer.periodic(const Duration(seconds: 2), (Timer t) {
      _fetchData();
      setState(() {
        _current_Date = DateFormat("yyyy-MM-dd").format(DateTime.now());
        _current_Time = DateFormat("HH:mm:ss").format(DateTime.now());
      });
    });
  }

  @override
  void dispose() {
    // Dispose of the StreamController and cancel the timer when the widget is disposed
    _broadcastQuestionStreamController.close();
    _fetchDataTimer.cancel(); // Add this line
    super.dispose();
  }

  Future<void> _fetchData() async {
    try {
      // Fetch data using your score_controller
      BroadcastQuestionsModel Data =
          await BroadcastQuestion_controller.gettingAllQuestions();

      // Add the fetched data to the stream
      _broadcastQuestionStreamController.add(Data);
    } catch (error) {
      // Handle errors
      print('Error fetching dataaaaaa: $error');
    }
  }
  // ------------------This is where streaming Ended---------------

  @override
  Widget build(BuildContext context) {
    // var PeriferianceState = Provider.of<Periferance>(context);
    PeriferianceUpdate = Provider.of<Periferance>(context, listen: false);
    PeriferianceState = Provider.of<Periferance>(context);
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: StreamBuilder<BroadcastQuestionsModel>(
          stream: _broadcastQuestionStream,
          builder: (context, snapshot) {
            print(_current_Date);
            print(_current_Time);
            if (snapshot.hasData) {
              List<Data> Questions = snapshot.data!.data;
              var DateofLive = Questions[0].dateofLive;
              String startingTime = Questions[0].startTime;
              var endingTime = Questions[0].endTime;

              print("here is from data base $startingTime");
              print("here is from data base $endingTime");

              if (DateofLive == _current_Date) {
                PeriferianceUpdate.setQuizStartingTime(startingTime);
                PeriferianceUpdate.setisQuizAvalilableToday(true);
                if ((startingTime.compareTo(_current_Time) <= 0) &&
                    (endingTime.compareTo(_current_Time) > 0)) {
                  if (!PeriferianceState.getdowefinishedQuiz()) {
                    PeriferianceUpdate.setIsQuizLive(true);
                    return _BroadcastQuestionsBuilder(Questions, size);
                  } else {
                    return _defaultPageBuilder(size, false);
                  }
                } else {
                  PeriferianceUpdate.setdowefinishedQuiz(false);
                  PeriferianceUpdate.setIsQuizLive(false);
                  PeriferianceUpdate.setbroadcastQuestionNumber(0);
                  return _defaultPageBuilder(size, true);
                }
              } else {
                PeriferianceUpdate.setIsQuizLive(false);

                return _defaultPageBuilder(size, false);
              }
            } else {
              return PeriferianceState.getIsQuizLive() == true
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : _defaultPageBuilder(size, false);
              /*  return const Center(
                child: CircularProgressIndicator(),
              ); */
            }
          },
        ),
      ),
    );
  }

  Widget _defaultPageBuilder(Size size, bool iswaiting) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        // width: size,
        child: Column(
          children: [
            // This is the place where the broud cast timer shown
            Container(
                width: size.width,
                height: size.height * 0.3,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage("Assets/Images/goldenFlower.png"),
                      fit: BoxFit.cover,
                    ),
                    color: Theme.of(context).canvasColor,
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).colorScheme.onBackground,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                        blurStyle: BlurStyle.inner,
                        spreadRadius: 5,
                      )
                    ]),
                child: iswaiting
                    ? const Stack(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Image(
                                image: AssetImage(
                                  "Assets/Images/persone waiting.png",
                                ),
                              ),
                            ],
                          ),
                          CountDownTimmer()
                        ],
                      )
                    : SingleChildScrollView(
                        physics: const NeverScrollableScrollPhysics(),
                        child: Stack(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 25.0, left: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Image(
                                    image: const AssetImage(
                                      "Assets/Images/quiz404.png",
                                    ),
                                    height: size.height * 0.3,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.6,
                              child: Bubble(
                                margin: const BubbleEdges.only(top: 10),
                                nip: BubbleNip.rightBottom,
                                color: const Color.fromRGBO(225, 255, 199, 1.0)
                                    .withOpacity(0.3),
                                child: Text(
                                  "Quiz is not Available for Today",
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "History of best performers",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.onTertiaryContainer,
                    ),
              ),
            ),
            const BestPerformaers()
            // This is the place where the list of best perfromers shown
          ],
        ),
      ),
    );
  }

  Widget _BroadcastQuestionsBuilder(Questions, Size size) {
    List<Data> AllQuestions = Questions;
    int QuestionNumber = PeriferianceState.getbroadcastQuestionNumber();
    // print("here is question bro ${questions[0]["Question"]}");
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("Assets/Images/bggold.png"),
          opacity: 0.3,
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Wellcome!!!",
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontFamily: "wellcome",
                                ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
                          border: Border.all(
                            color: Theme.of(context).canvasColor,
                            width: 2,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 4),
                          child: Text(
                            "${QuestionNumber + 1} of ${AllQuestions.length}",
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: PageView.builder(
                    onPageChanged: (value) {
                      isclicked = false;
                      PeriferianceUpdate.setbroadcastQuestionNumber(value);
                    },
                    physics: const NeverScrollableScrollPhysics(),
                    controller: pageviewController,
                    itemBuilder: (context, pageindex) {
                      return Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 20),
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .background
                                  .withOpacity(0.9),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 10),
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
                                          AllQuestions[QuestionNumber].Question,
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
                                    height: size.height * 0.4,
                                    child: ListView.builder(
                                      itemBuilder: (context, index) {
                                        return Container(
                                          margin:
                                              const EdgeInsets.only(bottom: 10),
                                          width: size.width,
                                          height: size.height * 0.08,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: isclicked
                                                  ? selectedIndex == index
                                                      ? AllQuestions[QuestionNumber]
                                                                  .broadcastOptions[
                                                                      index]
                                                                  .IsCorrect ==
                                                              1
                                                          ? Colors.green
                                                          : Colors.red
                                                      : AllQuestions[QuestionNumber]
                                                                  .broadcastOptions[
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
                                              onTap: isclicked
                                                  ? () {}
                                                  : () async {
                                                      setState(() {
                                                        selectedIndex = index;
                                                        isclicked = true;
                                                      });
                                                      pageviewController
                                                          .nextPage(
                                                        curve: Curves
                                                            .fastOutSlowIn,
                                                        duration:
                                                            const Duration(
                                                                seconds: 1),
                                                      );
                                                      if (AllQuestions[
                                                                  QuestionNumber]
                                                              .broadcastOptions[
                                                                  index]
                                                              .IsCorrect ==
                                                          1) {
                                                        setState(() {
                                                          correctChoices++;
                                                        });
                                                      } else {
                                                        setState(() {
                                                          wrongChoices++;
                                                        });
                                                      }
                                                      if (AllQuestions.length ==
                                                          correctChoices +
                                                              wrongChoices) {
                                                        await score_controller
                                                                .UpdatingBroadcastScore(
                                                                    PeriferianceState
                                                                        .getStudentId(),
                                                                    correctChoices *
                                                                        5.1)
                                                            .then(
                                                          (value) => showDialog(
                                                            context: context,
                                                            builder: (context) {
                                                              return Dialog(
                                                                child: SizedBox(
                                                                  height:
                                                                      size.height *
                                                                          0.5,
                                                                  width:
                                                                      size.width *
                                                                          0.7,
                                                                  child: Column(
                                                                    children: [
                                                                      const Text(
                                                                          "you have completed the quiz Thank you"),
                                                                      TextButton(
                                                                          onPressed:
                                                                              () async {
                                                                            await PeriferianceUpdate.setdowefinishedQuiz(true);
                                                                          },
                                                                          child:
                                                                              const Text("Continue"))
                                                                    ],
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        );
                                                      }
                                                    },
                                              leading: Text(
                                                AllQuestions[QuestionNumber]
                                                    .broadcastOptions[index]
                                                    .code
                                                    .toUpperCase(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineMedium,
                                              ),
                                              title: Text(
                                                  AllQuestions[QuestionNumber]
                                                      .broadcastOptions[index]
                                                      .OptionValue),
                                            ),
                                          ),
                                        );
                                      },
                                      itemCount: AllQuestions[QuestionNumber]
                                          .broadcastOptions
                                          .length,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                    itemCount: AllQuestions.length,
                  ),
                ),
              ],
            ),
            /* _bottomAreaBuilder(size, questions.length) */

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                elevation: 20,
                backgroundColor: Theme.of(context).canvasColor,
                onPressed: () {
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
                          opacity:
                              Tween<double>(begin: 0.5, end: 1).animate(a1),
                          child: const Dialog(child: RankDialog()),
                        ),
                      );
                    },
                  );
                },
                child: Lottie.asset('Assets/lottie/Cup.json'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
