import 'dart:async';

import 'package:chatapp/App_routes/routes.dart';
import 'package:chatapp/firebase_provider.dart';
import 'package:chatapp/main.dart';
import 'package:chatapp/onboarding/login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () async {
      var pref = await SharedPreferences.getInstance();
      var value = pref.getString(FirebaseProvider.Login_pref_key);
      // String NavigateTo = Approutes.Login_screen;

      if (value != null && value.isNotEmpty) {
        //NavigateTo = Approutes.Home_screen;
        Navigator.pushNamed(context, Approutes.Home_screen);
      } else {
        Navigator.pushNamed(context, Approutes.Login_screen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Stack(
          children: [
            Icon(
              Icons.sunny,
              size: 60,
            )
          ],
        ),
      ),
    );
  }
}
