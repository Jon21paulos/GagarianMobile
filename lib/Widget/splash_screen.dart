import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gagarian_mobile/Widget/auth_wrapper.dart';
import 'package:gagarian_mobile/Widget/signin_screen.dart';

import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
               AuthenticationWrapper()
              // HomeScreen()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
          child:Text("Wellcome",style: Theme.of(context).textTheme.subtitle1)
      ),
    );
  }
}