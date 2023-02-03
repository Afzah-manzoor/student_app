import 'package:student_app/constants.dart';
import 'package:flutter/material.dart';

import 'package:student_app/routes.dart';

import 'package:student_app/screens/splash/splash_screen.dart';
import 'package:student_app/theme.dart';
import 'package:flutter/services.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: kPrimaryColor));
// Open your boxes. Optional: Give it a type.
  // Directory documentsDirectory = await getApplicationDocumentsDirectory();
  // Hive.init(documentsDirectory.path);
  // box = await Hive.openBox('myBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      // home: HomeScreen(),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
