import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:gagarian_mobile/Store/badge_incrementer.dart';
import 'package:gagarian_mobile/Store/fetch_user_provider.dart';
import 'package:gagarian_mobile/Widget/component/custom_catagories.dart';
import 'package:provider/src/provider.dart';

import 'component/custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    print(context.read<FetchUser>().token);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(

        appBar:  AppBar(
            title: Text("Gagarian",style: TextStyle(color: Colors.black),),
            centerTitle: true,
            backgroundColor: Colors.orange,

            actions:[

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child:  context.watch<BadgeIncrementer>().badge == 0?
                    const SizedBox(
                        child: Icon(Icons.shopping_cart,size: 40,color: Colors.black,)
                    ) :
                    Badge(
                      badgeContent: Text(context.watch<BadgeIncrementer>().badge.toString()),
                        badgeColor: Colors.green,
                        padding: EdgeInsets.all(8),
                        child: Icon(Icons.shopping_cart,size: 40,color: Colors.black,)
                    ),
                ),
             ]

          ),
        body:   Center(
          child: CustomCatagories(),
        ),
        drawer:  Theme(
            data: Theme.of(context).copyWith(
                canvasColor: Colors.orange
            ),
            child:  customDrawer(context)
        ),
      ),
    );
  }
}