import 'package:flutter/material.dart';
import 'package:my_applecation/details_screen.dart';
import 'package:my_applecation/profile_screen.dart';
import 'package:my_applecation/unknown_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.route,
      routes: {
        HomeScreen.route : (context)=> HomeScreen(),
        "/details" : (context)=> DetailsScreen(name: "name",),
        "/profile" : (context) => ProfileScreen(),
        "/unKnown" : (context) => UnknownScreen(),
      },
      onGenerateRoute: (settings) {
        // handel '/'
        if(settings.name == '/'){
          return MaterialPageRoute(builder: (context) => HomeScreen(),);
        }

        // handel => 'profile/:name

        final uri = Uri.parse(settings.name ?? "");

        if(uri.pathSegments.length == 2 && uri.pathSegments.first == "details"){
          String name = uri.pathSegments[1];
          return MaterialPageRoute(builder: (context) => DetailsScreen(name: name),);
        }

        return MaterialPageRoute(builder: (context) => UnknownScreen(),);

      },
      // home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const route = "/";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () async {
                  final result = await Navigator.push<List<Map>>(context, MaterialPageRoute(builder: (context)=> DetailsScreen(name: "Loai")));

                  print(result![0]['name']);
                  },
                child: const Text("Open Details Screen"),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/details/loai');
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfileScreen()));
                  },
                  child: const Text("Open Profile Screen")),
              TextButton(onPressed: () {}, child: const Text("UnKnown Screen"))
            ],
          ),
        ),
      ),
    );
  }
}

//
//
//
// class Nav2App extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       initialRoute: HomeScreen.route,
//       routes: {
//         HomeScreen.route: (context) => const HomeScreen(),
//         DetailScreen.route: (context)=> DetailScreen(id: "-1",),
//         UnknownScreen.route: (context)=> const UnknownScreen(),
//       },
//       onGenerateRoute: (settings) {
//         // Handel => '/'
//         if(settings.name == '/'){
//           return MaterialPageRoute(builder: (context) => const HomeScreen(),);
//         }
//
//         // Handel => '/details/:id'
//         final uri = Uri.parse(settings.name!);
//         if(uri.pathSegments.length == 2 && uri.pathSegments.first == 'details'){
//           final id = uri.pathSegments[1];
//           return MaterialPageRoute(builder: (context) => DetailScreen(id: id),);
//         }
//
//         return MaterialPageRoute(builder: (context) => const UnknownScreen(),);
//
//       },
//     );
//   }
// }
//
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//
//   static const String route = '/';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(),
//           TextButton(
//             child: const Text('View Details'),
//             onPressed: () {
//               Navigator.pushNamed(
//                 context,
//                 '/details/1',
//               );
//             },
//           ),
//           const SizedBox(height: 10,),
//           TextButton(
//             child: const Text('View Unknown Screen'),
//             onPressed: () {
//               Navigator.pushNamed(
//                 context,
//                 '/unknownScreen',
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class DetailScreen extends StatelessWidget {
//   String id;
//   DetailScreen({super.key, required this.id,});
//
//   static const String route = '/unknownScreen';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Viewing details for item $id'),
//             TextButton(
//               child: const Text('Pop!'),
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class UnknownScreen extends StatelessWidget {
//   const UnknownScreen({super.key});
//
//   static const String route = '/unknownScreen';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: const Center(
//         child: Text('404!'),
//       ),
//     );
//   }
// }
