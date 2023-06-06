import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp2(),
    ),
  );
}


class MyApp2 extends StatelessWidget {
  const MyApp2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2E466E) ,
      appBar: AppBar(
        title: Text("MUSICLIST"),
        centerTitle: true,
        backgroundColor: Color(0xff2E466E),
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.grid_view_rounded)),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [
              ListItem(),
              ListItem(),
              ListItem(),
              ListItem(),
              ListItem(),
              ListItem(),
              ListItem(),
              ListItem(),

            ],
          )
        ),
      ),
    );
  }
}
class ListItem extends StatefulWidget {
  const ListItem({Key? key}) : super(key: key);

  @override
  State<ListItem> createState() => _ListItemState();
}
class _ListItemState extends State<ListItem> {

  bool _value  = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 100,
            width: double.maxFinite,
            margin: EdgeInsets.only(left: 20),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: Colors.white.withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 3,
                      offset: Offset(-3, 10)
                  )
                ]
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 70),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text("Title", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color:  Color(0xff2E466E)),),
                   Text("body", style: TextStyle(color: Color(0xff2E466E)),),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: -20,
            left: -10,
            child: Container(
              width: 100,
              height:100,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 6,
                        spreadRadius: 6,
                        offset: Offset(0, 10)
                    )
                  ]
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(50),
                ),

              ),
            ),
          ),
          Positioned(
            top: -15,
            left: -25,
            child: Theme(
              data: Theme.of(context).copyWith(
                unselectedWidgetColor: Colors.white,
              ),
              child: Checkbox(
                activeColor: Colors.white,
                checkColor: Colors.black,
                onChanged: (value){
                  setState(() {
                    _value = value ?? false;
                  });
                },
                value: _value,
              ),
            ),
          )
        ],
      ),
    );
  }
}


// BottomSheet
// RoundedRectangleBorder
// DraggableScrollableSheet



// 1- Alert Dialog
// 2- Custom Dialog
// 3- Full-Screen Dialog



class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() {
    return  _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {


  void _settingModalBottomSheet(context){
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        isDismissible: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
        ),
        builder: (BuildContext bc){
          return DraggableScrollableSheet(
              initialChildSize: 0.5,
              minChildSize: 0.4,
              maxChildSize: 0.6,
              expand: false,
            builder: (context, scrollController) {
              return ListView(
                  controller: scrollController,
                  children: <Widget>[
                    ListTile(
                        leading: Icon(Icons.music_note),
                        title: Text('Music'),
                        onTap: () => {}
                    ),
                    ListTile(
                      leading: Icon(Icons.videocam),
                      title: Text('Video'),
                      onTap: () => {},
                    ),
                  ],
              );
            }
          );
        }
    );
  }

  void _settingModalAlertDialog(BuildContext context){
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Alert Dialog"),
                    SizedBox(
                      width: 320.0,
                      child: MaterialButton(
                        onPressed: () {},
                        child: Text(
                          "Save",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: const Color(0xFF1BC0C5),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
    //  showDialog(
    //     context: context,
    //     builder: (BuildContext context){
    //       return AlertDialog(
    //         title: Text("Alert Dialog"),
    //         content: Text("Dialog Content"),
    //         actions:[
    //           MaterialButton(
    //             onPressed: () { Navigator.pop(context); },
    //             child: Text("Close"),
    //             color: Colors.red,
    //           )
    //         ],
    //
    //       );
    //     }
    // );
  }

  void _settingFullAlertDialog(BuildContext context){
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext context, Animation animation, Animation secondaryAnimation) {
          return Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 10,
              height: MediaQuery.of(context).size.height -  80,
              padding: EdgeInsets.all(20),
              color: Colors.white,
              child: Column(
                children: [
                  MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: const Color(0xFF1BC0C5),
                  )
                ],
              ),
            ),
          );
        });
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("This is app bar"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          //_settingModalBottomSheet(context);
          // _settingModalAlertDialog(context);
           _settingFullAlertDialog(context);
        },
        child: Icon(Icons.add),
      ),

      body: Column(
        children: [

        ],
      ),
    );
  }
}





