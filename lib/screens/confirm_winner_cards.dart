import 'package:flutter/material.dart';

confirmWinnerCards(context) {
  Map<String, dynamic> cards = {
    "38gwangttaeng": "assets/images/38gwangttaeng.jpeg",
    "18gwangttaeng": "assets/images/18gwangttaeng.jpeg",
    "13gwangttaeng": "assets/images/13gwangttaeng.png",
    "10ttaeng": "assets/images/10ttaeng.jpeg",
    "9ttaeng": "assets/images/9ttaeng.jpeg",
    "8ttaeng": "assets/images/8ttaeng.jpeg",
    "7ttaeng": "assets/images/7ttaeng.jpeg",
    "6ttaeng": "assets/images/6ttaeng.jpeg",
    "5ttaeng": "assets/images/5ttaeng.jpeg",
    "4ttaeng": "assets/images/4ttaeng.jpeg",
    "3ttaeng": "assets/images/3ttaeng.jpeg",
    "2ttaeng": "assets/images/2ttaeng.jpeg",
    "1ttaeng": "assets/images/1ttaeng.jpeg",
    "ttaeng_killer": "assets/images/ttaeng_killer.jpeg",
    "gwangttaeng_killer": "assets/images/gwangttaeng_killer.jpeg",
  };
  return showDialog(
    context: context,
    builder: ((BuildContext context) {
      return AlertDialog(
        // content: const Text("123"),
        actions: [
          Container(
            color: const Color(0xff515830),
            height: 400,
            width: 300,
            child: ListView.builder(
              itemCount: 15,
              itemBuilder: (BuildContext context, int index) {
                return Image.asset(
                  cards[cards.keys.elementAt(index)],
                  height: 200,
                  width: 150,
                );
              },
            ),
          ),
        ],
      );
    }),
  );
}
