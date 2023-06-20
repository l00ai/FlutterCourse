import 'package:flutter/material.dart';
import 'package:my_applecation/profile_screen.dart';

class DetailsScreen extends StatelessWidget {
  final String name;
  const DetailsScreen({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details Screen $name"),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: (){
                bool canBack = Navigator.canPop(context);
                if(canBack){
                  Navigator.pop(context, [
                    {
                      "name" : "Ahmed",
                      "age" : 23,
                    }
                  ]);
                }

                // Navigator.of(context).pop();
                // Navigator.of(context).canPop();
                // Navigator.of(context).push(route);

              },
              icon: const Icon(Icons.arrow_back),
            ),

            TextButton(
              onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> ProfileScreen()));
              },
              child: const Text("Open profile"),
            ),
          ],
        ),
      ),
    );
  }
}
