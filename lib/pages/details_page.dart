import 'package:flutter/material.dart';
import 'package:my_applecation/counter.dart';

class DetailsPage extends StatelessWidget {

  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final counter = Counter.of(context);

    return Scaffold(
      body: Center(
        child: Text(
          "${counter.count }"
        ),
      ),
    );
  }
}
