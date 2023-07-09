import 'package:flutter/material.dart';
import 'package:my_applecation/counter.dart';
import 'package:my_applecation/theme/my_theme.dart';
import 'my_shared_perf.dart';
import 'pages/home_page.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await MySharedPref().init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context);
    final theme = Theme.of(context);

    return Counter(
      count: -1,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: MyTheme.getThemeData(isLight: true),
          home: HomePage(),
        ),
    );
  }
}

