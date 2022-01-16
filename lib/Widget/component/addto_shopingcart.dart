import 'package:flutter/material.dart';
import 'package:gagarian_mobile/Store/badge_incrementer.dart';
import 'package:provider/src/provider.dart';

Widget customAddButtom(BuildContext context) =>InkWell(
  onTap: (){
    print("item is added");
    context.read<BadgeIncrementer>().badgeIncrementer();
  },
  child: SizedBox(
    height: 60,
    child: Card(
      color: Colors.orange,
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(
          width: 1,
          color: Colors.grey,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [

          Image.asset('lib/assets/cart.png'),
          const SizedBox(
            width: 15,
          ),
          const Text(
            "Add to Shoping Cart",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
    ),
  ),
);
