import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../Models/StudentScoreModel.dart';
import '../Controllers/student_controller.dart';
import '../Util/Shimmer_loading.dart';

class RankDialog extends StatefulWidget {
  const RankDialog({super.key});

  @override
  State<RankDialog> createState() => _RankDialogState();
}

class _RankDialogState extends State<RankDialog> {
  late StreamController<StudentScoreModel> _scoreStreamController;
  late Stream<StudentScoreModel> _scoreStream;
  late Timer _fetchDataTimer;

  @override
  void initState() {
    super.initState();

    // Initialize the StreamController and Stream
    _scoreStreamController = StreamController<StudentScoreModel>();
    _scoreStream = _scoreStreamController.stream;

    // Start fetching data periodically
    _fetchDataTimer = Timer.periodic(const Duration(seconds: 5), (Timer t) {
      _fetchData();
    });
  }

  @override
  void dispose() {
    // Dispose of the StreamController and cancel the timer when the widget is disposed
    _scoreStreamController.close();
    _fetchDataTimer.cancel(); // Add this line
    super.dispose();
  }

  Future<void> _fetchData() async {
    try {
      // Fetch data using your score_controller
      StudentScoreModel rankedStudents =
          await student_controller.getAllStudentsByRank();

      // Add the fetched data to the stream
      _scoreStreamController.add(rankedStudents);
    } catch (error) {
      // Handle errors
      print('Error fetching data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StreamBuilder<StudentScoreModel>(
      stream: _scoreStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Data> originalList = snapshot.data!.data;
          return ReorderableListView.builder(
            itemBuilder: (context, index) {
              return Container(
                height: size.height * 0.7,
                key: Key("${originalList[index].rank}"),
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).canvasColor,
                      offset: const Offset(2, 3),
                    ),
                  ],
                ),
                child: ListTile(
                  leading: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 3.0),
                        child: Text("${originalList[index].rank}"),
                      ),
                      CachedNetworkImage(
                        imageUrl: originalList[index].student.ImageUrl,
                        imageBuilder: (context, imageProvider) {
                          return CircleAvatar(
                            radius: 30,
                            backgroundImage: imageProvider,
                          );
                        },
                      )
                    ],
                  ),
                  title: Text(
                    originalList[index].student.Name,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  trailing: Text(
                    " ${originalList[index].broadcastScore}",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w700,
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                  ),
                ),
              );
            },
            itemCount: originalList.length,
            onReorder: (oldIndex, newIndex) {
              setState(() {
                if (oldIndex > newIndex) {
                  newIndex -= 1;
                }
                final Data tmp = originalList[oldIndex];
                originalList.remove(oldIndex);
                originalList.insert(newIndex, tmp);
              });
            },
          );
        } else {
          return AllShimmers.rankDialogShimmer(size);
        }
      },
    );
  }
}
