import 'package:flutter/material.dart';
import 'package:my_applecation/theme/my_theme.dart';

import 'my_shared_perf.dart';


main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await MySharedPref().init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.getThemeData(isLight: true),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);


  MaterialBanner getMaterialBanner(BuildContext context) {
    return MaterialBanner(
      leading: const CircleAvatar(
        //backgroundColor: kPrimaryColor,
        child: Icon(
          Icons.subscriptions,
        ),
      ),
      content: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('WEEKLY RUNDOWN:'),
            Padding(
              padding: EdgeInsets.only(top: 4.0),
              child: Text(
                '''The case for a six-hour workday, An office model that suits everyone?, and other top news for you''',
              ),
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          child: const Text('DISMISS', style: TextStyle(fontSize: 12),),
          onPressed: () {
            ScaffoldMessenger.of(context).clearMaterialBanners();
          },
        ),
        ElevatedButton(
          child: const Text('VIEW', style: TextStyle(fontSize: 12),),
          onPressed: () {},
        ),
      ],
    );
  }
  
  // Singleton class
  // Shared Pref

  // SnackBar and MaterialBanner


  // Theme => 
  // AppBar
  // Body
  // ElevatedButton
  // Icon
  // Chip

  @override
  Widget build(BuildContext context) {
    String userName = MySharedPref().getUserName();
    return Scaffold(
      appBar: AppBar(
        title: Text(userName),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.ac_unit))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.ac_unit),
            //Center(child: CircularProgressIndicator()),
            Text("Save username"),
            ElevatedButton(
                onPressed: ()  {
                  // ScaffoldMessenger.of(context).showMaterialBanner(
                  //     getMaterialBanner(context)
                  // );
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //     const SnackBar(
                  //         content: Text("Oh! SnackBar"),
                  //         showCloseIcon: true,
                  //         dismissDirection: DismissDirection.vertical
                  //     )
                  // );
                  //MySharedPref().setUserName("Ahmed");
                },
                child: Text("Save username"),
            ),

          ],
        ),
      ),
    );
  }
}
