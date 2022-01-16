import 'package:flutter/material.dart';
import 'package:gagarian_mobile/Store/fetch_user_provider.dart';
import 'package:gagarian_mobile/Widget/signin_screen.dart';
import 'package:provider/provider.dart';

import 'home_screen.dart';

class AuthenticationWrapper extends StatefulWidget {
   AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  State<AuthenticationWrapper> createState() => _AuthenticationWrapperState();
}

class _AuthenticationWrapperState extends State<AuthenticationWrapper> {

  @override
  void initState() {
    context.read<FetchUser>().loadFromPrefs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    if(context.watch<FetchUser>().notify == false){
        return const SignInScreen();
      }else{
        return const HomeScreen();
     }

  }
}