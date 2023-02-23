import 'package:card_record/screens/timer_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        // appBar: AppBar(
        //     // title: const Text('Home Screen'),
        //     ),
        body: const TabBarView(
          children: [
            Center(
              child: Text(''),
            ),
            Center(
              child: Text('Tab 2'),
            ),
            Center(
              child: TimerScreen(),
            ),
            Center(
              child: Text('Tab 4'),
            ),
            Center(
              child: Text('Tab 5'),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          height: 100,
          color: Colors.grey[200],
          child: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.calculate), text: '계산기'),
              Tab(icon: Icon(Icons.emoji_events), text: '순위'),
              Tab(icon: Icon(Icons.timer), text: '타이머'),
              Tab(icon: Icon(Icons.favorite), text: 'Tab 4'),
              Tab(icon: Icon(Icons.person), text: 'Tab 5'),
            ],
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.all(5.0),
            indicatorColor: Colors.blue,
          ),
        ),
      ),
    );
  }
}
