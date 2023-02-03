import 'package:student_app/screens/add_user/add_user.dart';
import 'package:student_app/screens/splash/splash_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:student_app/screens/user_details/user_details.dart';

import 'screens/home/home_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  AddUser.routeName: (context) => const AddUser(),
  UserDetails.routeName: (context) => const UserDetails(
      city: '',
      course: '',
      email: '',
      id: '',
      name: '',
      number: '',
      status: ''),
};
