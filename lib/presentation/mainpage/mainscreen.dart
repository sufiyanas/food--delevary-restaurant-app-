import 'package:flutter/material.dart';
import 'package:food_delevary_admin/core/consts.dart';
import 'package:food_delevary_admin/presentation/Home/home_screen.dart';
import 'package:food_delevary_admin/presentation/Orderpage/orderpage.dart';
import 'package:food_delevary_admin/presentation/adddish/add_food_screen.dart';
import 'package:food_delevary_admin/presentation/profile/hotal_profile.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

ValueNotifier<int> currentIndexNotifier = ValueNotifier(0);

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List _pages = [
      HomeScreen(),
      AddFoodScreen(),
      OrderPage(),
      HotalProfile(),
    ];
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: currentIndexNotifier,
        builder: (context, int value, _) {
          return _pages[value];
        },
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: GNav(
              onTabChange: (newIndex) {
                currentIndexNotifier.value = newIndex;
              },
              // rippleColor: Colors.green,
              // hoverColor: Colors.green,
              activeColor: kthemeGreen,
              backgroundColor: Colors.grey.shade800,
              tabBackgroundColor: Colors.green.shade300.withOpacity(0.4),
              curve: Curves.easeInCirc, //for animation
              //tabMargin: EdgeInsets.all(5),//
              tabBorderRadius: 20,
              padding: const EdgeInsets.all(20),
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              textStyle: TextStyle(color: Colors.white, fontSize: 15),
              // selectedIndex: ,
              // haptic: true,
              color: kthemeGrey,
              gap: 10,
              tabs: [
                GButton(
                    icon: Icons.home, iconColor: Colors.green, text: "Home"),
                GButton(icon: Icons.add, iconColor: kthemeGreen, text: "Add"),
                GButton(
                    icon: Icons.history, iconColor: kthemeGreen, text: "order"),
                GButton(
                    icon: Icons.person,
                    iconColor: kthemeGreen,
                    text: "profile"),
              ]),
        ),
      ),
    );
  }
}
