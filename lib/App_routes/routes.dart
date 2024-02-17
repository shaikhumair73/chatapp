import 'package:chatapp/Chatscreen.dart';
import 'package:chatapp/ContactPage.dart';
import 'package:chatapp/main.dart';
import 'package:chatapp/onboarding/Sighup_page.dart';
import 'package:chatapp/onboarding/login_page.dart';
import 'package:chatapp/splashPage.dart';
import 'package:flutter/cupertino.dart';

class Approutes {
  static const String Splash_Screen = "/splash_Screen";
  static const String Login_screen = "/login_Screen";
  static const String Sighnup_screen = "/sighnup_Screen";
  static const String Home_screen = "/home_Screen";
  static const String Contact_screen = "/contact_Screen";
  static const String Chat_screen = "/chat_Screen";
  static Map<String, WidgetBuilder> get routes => {
        Splash_Screen: (context) => SplashPage(),
        Login_screen: (context) => LoginPage(),
        Sighnup_screen: (context) => SighnUp.Widgetbuilder(),
        Home_screen: (context) => MyHomePage(),
        Contact_screen: (context) => ContactPage(),
        Chat_screen: (context) => ChatPage(),
      };
}
