import 'package:flutter/widgets.dart';

import 'package:jobid/screens/splash/splash_screen.dart';
import 'package:jobid/screens/auth/login/login_screen.dart';
import 'package:jobid/screens/auth/register/register_screen.dart';
import 'package:jobid/screens/home/home_screen.dart';
import 'package:jobid/screens/map/map_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  RegisterScreen.routeName: (context) => RegisterScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  MapScreen.routeName: (context) => MapScreen()
};
