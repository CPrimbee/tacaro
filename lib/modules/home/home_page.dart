import 'package:flutter/material.dart';
import 'package:tacaro/shared/bottom_navigator/app_bottom_navigator.dart';
import 'package:tacaro/shared/card_product/card_product.dart';
import 'package:tacaro/shared/list_tile/app_list_tile.dart';

import 'package:tacaro/shared/models/user_model.dart';
import 'package:tacaro/shared/theme/app_theme.dart';

class HomePage extends StatefulWidget {
  // final UserModel user;
  const HomePage({
    Key? key,
    // required this.user,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.background,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 126,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => CardProduct(),
                ),
              ),
              const AppListTile(),
              const AppListTile(),
              const AppListTile(),
            ],
          ),
          Positioned(
            bottom: 14,
            left: 26,
            right: 26,
            child: AppBottomNavigator(
              currentIndex: currentIndex,
              onChanged: changeIndex,
            ),
          )
        ],
      ),
    );
  }
}
