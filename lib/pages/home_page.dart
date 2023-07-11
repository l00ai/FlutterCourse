import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/timer_provider.dart';
import 'details_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeScreen();
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController textEditingController;

  @override
  void initState() {
    textEditingController = TextEditingController();
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  startTimer() {
    final timerProvider = Provider.of<TimerProvider>(context, listen: false);
    // Timer
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timerProvider.count > 0) {
        timerProvider.decrementCount();
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter app"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Center(
              child: Consumer<TimerProvider>(
              builder: (context, value, child) {
                return Text(
                  "${value.count}",
                  style: const TextStyle(fontSize: 32),
                );
              },
            ),),
          ],
        ),
      ),
    );
  }
}


class ListViewBuild extends StatelessWidget {
  const ListViewBuild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey.shade400,
              child: Text("A")
            ),
            title: Text("Title"),
            trailing: Checkbox(
              value: false,
              onChanged: (value){

              },
            ),
          )
        ],
      ),
    );
  }
}
