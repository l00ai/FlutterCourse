import 'package:flutter/material.dart';
import 'package:my_applecation/counter.dart';
import 'package:my_applecation/network/api_helper.dart';

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
  @override
  Widget build(BuildContext context) {
    Counter counter = Counter.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter app"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Viewer(),
          const SizedBox(
            height: 25,
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  counter.count++;
                });
              },
              child: Text("+")),
          const SizedBox(
            height: 25,
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetailsPage(),
                ));
              },
              child: Text("Open details page"))
        ],
      ),
    );
  }
}

class Viewer extends StatelessWidget {
  const Viewer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Counter counter = Counter.of(context);
    return Center(
        child: Text(
      "${counter.count}",
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ));
  }
}
