import 'dart:async';

import 'package:card_record/screens/confirm_winner_cards.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  static const fiftyMinutes = 3000;
  int totalSeconds = fiftyMinutes;
  bool isOnGmae = false;
  late Timer timer;
  String currentTime = '';
  List<String> recodeTexts = [];

  onPlayPressed() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (totalSeconds == 0) {
        setState(() {
          isOnGmae = false;
          totalSeconds = fiftyMinutes;
        });
        timer.cancel();
      } else {
        setState(() {
          totalSeconds--;
          isOnGmae = true;
        });
      }
    });
  }

  onPausePressed() {
    timer.cancel();
    setState(() {
      isOnGmae = false;
    });
  }

  void onResetPressed() {
    timer.cancel();
    setState(() {
      isOnGmae = false;
      totalSeconds = fiftyMinutes;
    });
  }

  void onContinuePressed() async {
    print(timeFormat(totalSeconds));
    await confirmWinnerCards(context);
    setState(() {
      currentTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
      recodeTexts.add("$currentTime 정영수 장땡");
    });
  }

  String timeFormat(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().split(".").first.substring(2);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/mopo.jpeg"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        // backgroundColor: Theme.of(context).backgroundColor,
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Flexible(
              flex: 1,
              child: Container(
                height: double.infinity,
                alignment: Alignment.center,
                // color: Colors.black,
                child: Text(
                  timeFormat(totalSeconds),
                  style: const TextStyle(
                      color: Colors.green,
                      fontSize: 89,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: SizedBox(
                // color: Colors.black,
                height: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      iconSize: 120,
                      color: Colors.green,
                      // onPressed: onPlayPressed,
                      onPressed: isOnGmae ? onContinuePressed : onResetPressed,
                      icon: isOnGmae
                          ? const Icon(Icons.restore_outlined)
                          : const Icon(Icons.stop_circle_outlined),
                    ),
                    IconButton(
                      iconSize: 120,
                      color: Colors.green,
                      // onPressed: onPlayPressed,
                      onPressed: isOnGmae ? onPausePressed : onPlayPressed,
                      icon: isOnGmae
                          ? const Icon(Icons.pause_circle_outline)
                          : const Icon(Icons.play_circle_outline),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Flexible(
              flex: 2,
              child: SizedBox(
                // color: Colors.black,
                height: double.infinity,
                child: Column(
                  // mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: recodeTexts.length,
                        itemBuilder: (context, index) {
                          return Text(recodeTexts[index]);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: null,
      ),
    );
  }
}
