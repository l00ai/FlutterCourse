import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Bottom NavBar',
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}


// Icons.home_filled,
// Icons.home_outlined,
// Icons.work_rounded,
// Icons.work_outline_outlined,
// Icons.widgets_rounded,
// Icons.widgets_outlined,
// Icons.person,
// Icons.person_outline,

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int index = 0;

  List<Widget> pages = [
    const HomeScreen(),
    Container(color: Colors.pink),
    Container(color: Colors.green),
    Container(color: Colors.red),
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bottom nav bar"),
      ),
      bottomNavigationBar: Container(
        height: 52,
        decoration: const BoxDecoration(
          color: Colors.blue
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: (){
                  setState(() {
                    index = 0;
                  });
                },
                icon: Icon(Icons.home_outlined, color: index == 0 ? Colors.white : null),
            ),
            IconButton(
              onPressed: (){
                setState(() {
                  index = 1;
                });
              },
              icon: Icon(Icons.work_outline_outlined, color: index == 1 ? Colors.white : null),
            ),
            IconButton(
              onPressed: (){
                setState(() {
                  index = 2;
                });
              },
              icon: Icon(Icons.widgets_outlined, color: index == 2 ? Colors.white : null),
            ),
            IconButton(
              onPressed: (){
                setState(() {
                  index = 3;
                });
              },
              icon: Icon(Icons.person_outline, color: index == 3 ? Colors.white : null),
            ),
          ],
        ),
      ),
      body: pages[index],
    );
  }
}


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    TextStyle style = const TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontFamily: "Cairo",
      fontWeight: FontWeight.normal
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.green,
          ),
          alignment: Alignment.center,
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.asset(
                height: 200,
                //width: MediaQuery.of(context).size.width,
                //fit: BoxFit.fill,
                "assets/images/flutter_logo.png"),
          ),
        ),
        const SizedBox(height: 10,),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.green,
          ),
          alignment: Alignment.center,
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.network(
                height: 200,
                //width: MediaQuery.of(context).size.width,
                //fit: BoxFit.fill,
                headers: const {
                  "Auth": 'token',
                },
                loadingBuilder: (context, child, loadingProgress) => Text(loadingProgress.toString()),
                errorBuilder: (context, error, stackTrace) => Text(stackTrace.toString()),
                "https://web-strapi.mrmilu.com/uploads/flutter_logo_470e9f7491.png"),
          ),
        ),
        const SizedBox(height: 10,),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.green,
          ),
          alignment: Alignment.center,
          child: Column(
            children: [
              Text("هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.", style: style,),
              const SizedBox(height: 10,),
              Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequa", style: style,)
            ],
          ),
        )
      ],
    );
  }
}


