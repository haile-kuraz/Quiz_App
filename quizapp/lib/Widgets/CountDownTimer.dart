import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:provider/provider.dart';

import '../Provider/PeriferanceProvider.dart';

class CountDownTimmer extends StatefulWidget {
  const CountDownTimmer({super.key});

  @override
  State<CountDownTimmer> createState() => _CountDownTimmerState();
}

class _CountDownTimmerState extends State<CountDownTimmer> {
  Duration convertTimeStringtoDateTime() {
    // var PeriferianceState = Provider.of<Periferance>(context);
    var PeriferianceUpdate = Provider.of<Periferance>(context, listen: false);
    DateTime now = DateTime.now();
    List<String> timeComponents =
        PeriferianceUpdate.getQuizStartingTime()!.split(':');
    int currenthours = now.hour;

    int currentminutes = now.minute;
    int currentseconds = now.second;
    int hours = int.parse(timeComponents[0]);
    int minutes = int.parse(timeComponents[1]);
    int seconds = int.parse(timeComponents[2]);
    int milisecond = now.millisecond;

    DateTime convertedDateTime = DateTime(0, 0, 0, hours, minutes, seconds);
    DateTime convertedCurentDateTime =
        DateTime(0, 0, 0, currenthours, currentminutes, currentseconds);

    // Duration difference = convertedCurentDateTime.difference(convertedDateTime);
    Duration difference = convertedDateTime.difference(convertedCurentDateTime);
    return difference;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onBackground,
        borderRadius: const BorderRadius.horizontal(
          right: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TimerCountdown(
          format: CountDownTimerFormat.hoursMinutesSeconds,
          timeTextStyle: Theme.of(context).textTheme.titleLarge,
          endTime: DateTime.now().add(
            Duration(
              hours: convertTimeStringtoDateTime().inHours,
              minutes: convertTimeStringtoDateTime().inMinutes,
              seconds: convertTimeStringtoDateTime().inSeconds,
            ),
          ),
          onEnd: () {
            print("Timer finished");
          },
        ),
      ),
    );
  }
}
