import 'dart:ffi';

import 'package:flutter/material.dart';

void main(){

  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}



class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() {
    return  _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int count = 0 ;


  @override
  void initState() {
    super.initState();
    print("initState");
  }


  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }


  bool checkBoxValue = false;

  @override
  Widget build(BuildContext context) {
    print("build");
    // double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    //
    // print("W : $width");
    // print("H : $height");

    return Scaffold(
      appBar: AppBar(
        title: Text("This is app bar"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.add),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: Container(
                color: Colors.green,
              ),
            ),
            ListTile(
              title: Text("Title"),
              subtitle: Text("Sub Title"),
              leading: Icon(Icons.supervised_user_circle),
              trailing: Icon(Icons.more_horiz_rounded),
              onTap: (){},
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(),
          Expanded(
            child: Container(
              color: Colors.green,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Number is : $count",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: checkBoxValue,
                        onChanged: (value) {
                          setState(() {
                            checkBoxValue = value ?? checkBoxValue;
                          });
                        },
                      ),
                      Text("Check box")
                    ],
                  ),
                  SizedBox(height: 10,),
                  MyCustomButton(
                    label: "Plus",
                    onClicked: (){
                      setState(() {
                        count++;
                        print(count);
                      });
                    },
                  ),
                  SizedBox(height: 10,),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        color: Colors.deepOrange,
                      ),
                      Positioned(
                        bottom: -30,
                        left: -30,
                        child: Container(
                          width: 100,
                          height: 100,
                          color: Colors.lightGreenAccent,
                        ),
                      ),
                    ],
                  )

                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.blue,
              alignment: Alignment.center,
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                        color: Colors.purpleAccent,
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: Column(
                          children: [
                            Expanded(
                                flex: 2,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(color: Colors.white),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white.withOpacity(0.5),
                                        blurRadius: 5,
                                        spreadRadius: 5,
                                        offset: Offset(-5, 5)
                                      )
                                    ]
                                  ),
                                ),
                            ),
                            SizedBox(height: 10,),
                            Expanded(
                                flex: 3,
                                child: Container(color: Colors.indigoAccent)
                            ),
                          ],
                        ),
                      ),
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              Container(height: 40, color: Colors.white,),
                              SizedBox(height: 10,),
                              Container(height: 40, color: Colors.white,),
                              SizedBox(height: 10,),
                              Container(height: 40, color: Colors.white,),
                              SizedBox(height: 10,),
                              Container(height: 40, color: Colors.white,),
                              SizedBox(height: 10,),
                              Container(height: 40, color: Colors.white,),
                              SizedBox(height: 10,),
                              Container(height: 40, color: Colors.white,),
                              SizedBox(height: 10,),
                              Container(height: 40, color: Colors.white,),
                              SizedBox(height: 10,),
                              Container(height: 40, color: Colors.white,),
                              SizedBox(height: 10,),
                              Container(height: 40, color: Colors.white,),
                              SizedBox(height: 10,),
                              Container(height: 40, color: Colors.white,),
                              SizedBox(height: 10,),
                            ],
                          ),
                        ),
                      ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



typedef MyFunc = void Function()?;

class MyCustomButton extends StatelessWidget {
  final String label;
  final MyFunc? onClicked;
  const MyCustomButton({Key? key, required this.label, this.onClicked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onClicked,
        child: Ink(
          width: 100,
          height: 50,
          color: Colors.white,
          child: Center(child: Text(label, style: TextStyle(color: Colors.black, fontSize: 18) ,)),
        ),
      ),
    );
  }
}








