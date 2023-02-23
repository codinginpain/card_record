import 'dart:async';

import 'package:flutter/material.dart';

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

  void onContinuePressed() {
    print(timeFormat(totalSeconds));
  }

  String timeFormat(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().split(".").first.substring(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              // color: Colors.black,
              child: Text(
                timeFormat(totalSeconds),
                style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: 89,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    iconSize: 120,
                    color: Theme.of(context).cardColor,
                    // onPressed: onPlayPressed,
                    onPressed: isOnGmae ? onContinuePressed : onResetPressed,
                    icon: isOnGmae
                        ? const Icon(Icons.restore_outlined)
                        : const Icon(Icons.stop_circle_outlined),
                  ),
                  IconButton(
                    iconSize: 120,
                    color: Theme.of(context).cardColor,
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
          Flexible(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    child: Column(
                      children: const [
                        Text("현재시각"),
                      ],
                    ),
                  ))
                ],
              )),
        ],
      ),
    );
  }
}
