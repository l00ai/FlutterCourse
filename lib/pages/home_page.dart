import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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


  Map? data ;
  bool isLoading = false;


  getData() async {
    isLoading = true;
    final result = await ApiHelper().apiRequest(
        url: "posts",
        body: {"username" : "l00ai"},
        type: HttpType.post,
    );
    isLoading = false;

    if(result != null){
      setState(() {
        data = result;
      });
    }else{
      setState(() {
        data = {"msg":"error"};
      });
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter app"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          if(isLoading)
            const CupertinoActivityIndicator()
          else
            Center(child: Text(data.toString())),

          const SizedBox(
            height: 25,
          ),

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

