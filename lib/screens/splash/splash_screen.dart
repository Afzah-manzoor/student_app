import 'package:student_app/helper/config.dart';
import 'package:student_app/screens/home/home_screen.dart';

import 'package:student_app/size_config.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/splash";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    gotoHome();
  }

  gotoHome() {
    Future.delayed(Duration.zero, () {
      Navigator.pushNamedAndRemoveUntil(
          context, HomeScreen.routeName, (Route route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return const Scaffold(
      body: Body(),
    );
  }
}
