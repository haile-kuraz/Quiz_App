import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Controllers/score_controller.dart';
import '../Models/ScoreModle.dart';
import '../Provider/PeriferanceProvider.dart';

class RankandPointDashbord extends StatefulWidget {
  const RankandPointDashbord({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<RankandPointDashbord> createState() => _RankandPointDashbordState();
}

class _RankandPointDashbordState extends State<RankandPointDashbord> {
  late StreamController<ScoreModel> _scoreStreamController;
  late Stream<ScoreModel> _scoreStream;

  @override
  void initState() {
    super.initState();

    // Initialize the StreamController and Stream
    _scoreStreamController = StreamController<ScoreModel>();
    _scoreStream = _scoreStreamController.stream;

    // Start fetching data periodically
    Timer.periodic(const Duration(seconds: 5), (Timer t) {
      _fetchData();
    });
  }

  Future<void> _fetchData() async {
    var PeriferianceState = Provider.of<Periferance>(context, listen: false);
    try {
      // Fetch data using your score_controller
      ScoreModel score = await score_controller
          .featchingScore(PeriferianceState.getStudentId() ?? 0);

      // Add the fetched data to the stream
      _scoreStreamController.add(score);
    } catch (error) {
      // Handle errors
      print('Error fetching data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ScoreModel>(
      stream: _scoreStream,
      initialData: ScoreModel(
        status: 200,
        score: Score(broadcastScore: 0, points: 0, rank: 0),
      ),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          // Handle error case
          return _buildScoreWidget(0, 0);
        } else if (snapshot.hasData) {
          // Extract data from the snapshot
          var rank = snapshot.data!.score.rank;
          var scorePoint = snapshot.data!.score.points;

          // Build the widget with the extracted data
          return _buildScoreWidget(rank, scorePoint);
        } else {
          // Loading state
          return _buildScoreWidget(0, 0);
        }
      },
    );
  }

  Widget _buildScoreWidget(int brodcastScore, double scorePoint) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: widget.size.width,
      height: widget.size.height * 0.12,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            blurStyle: BlurStyle.outer,
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Image.asset(
                  "Assets/Images/cup_one.png",
                  width: 70,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Ranking",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .tertiaryContainer
                                  .withOpacity(0.7),
                            ),
                      ),
                      Text(
                        "$brodcastScore",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          VerticalDivider(
            color: Theme.of(context).colorScheme.primary,
          ),
          Expanded(
            child: Row(
              children: [
                Image.asset(
                  "Assets/Images/coin.png",
                  width: 70,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Points",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .tertiaryContainer
                                  .withOpacity(0.7),
                            ),
                      ),
                      Text(
                        "$scorePoint",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Dispose of the StreamController when the widget is disposed

    _scoreStreamController.close();
    super.dispose();
  }
}
