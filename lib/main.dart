import 'package:flutter/material.dart';
import 'package:gagarian_mobile/Store/badge_incrementer.dart';
import 'package:gagarian_mobile/Store/fetch_catagories.dart';
import 'package:gagarian_mobile/Store/fetch_item.dart';
import 'package:gagarian_mobile/Store/fetch_user_provider.dart';
import 'package:gagarian_mobile/Widget/home_screen.dart';
import 'package:gagarian_mobile/Widget/signin_screen.dart';
import 'package:provider/provider.dart';
import 'Store/email_auth_provider.dart';
import 'Widget/splash_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthenticationService()),
        ChangeNotifierProvider(create: (_) => FetchUser()),
        ChangeNotifierProvider(create: (_) => FetchCatagories()),
        ChangeNotifierProvider(create: (_) => FetchItem()),
        ChangeNotifierProvider(create: (_) => BadgeIncrementer()),

      ],
      child: const MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
        routes: {
          'home': (context)=>  HomeScreen(),
          'signin': (context)=>  SignInScreen(),

        },
    );
  }
}
