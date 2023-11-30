import 'package:d_mans/screens/dashboard/account_page.dart';
import 'package:d_mans/screens/dashboard/category_page.dart';
import 'package:d_mans/screens/dashboard/home_page.dart';
import 'package:d_mans/screens/dashboard/search_page.dart';
import 'package:d_mans/screens/dashboard/shop_page.dart';
import 'package:d_mans/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

//
//Example to setup Bubble Bottom Bar with PageView
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController controller = PageController(initialPage: 0);
  var selected = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        children: const [
          HomePage(),
          CategoryPage(),
          ShopPage(),
          SearchPage(),
          AccountPage(),
        ],
      ),
      bottomNavigationBar: StylishBottomBar(
        option: BubbleBarOptions(
          // barStyle: BubbleBarStyle.vertical,
          barStyle: BubbleBarStyle.horizotnal,
          bubbleFillStyle: BubbleFillStyle.fill,
          // bubbleFillStyle: BubbleFillStyle.outlined,
          opacity: 0.3,
        ),
        items: [
          BottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text('Home'),
            backgroundColor: mainColor,

            // selectedColor: Colors.pink,
            selectedIcon: const Icon(Icons.home),
            badge: const Badge(),
            showBadge: true,
          ),
          BottomBarItem(
            icon: const Icon(Icons.dashboard),
            title: const Text('Category'),
            selectedColor: mainColor,
            backgroundColor: mainColor,
          ),
          BottomBarItem(
            icon: const Icon(Icons.shop),
            title: const Text('Shop'),
            selectedColor: mainColor,
            backgroundColor: mainColor,
          ),
          BottomBarItem(
            icon: const Icon(Icons.search),
            title: const Text('Search'),
            selectedColor: mainColor,
            backgroundColor: mainColor,
          ),
          BottomBarItem(
            icon: const Icon(Icons.person),
            title: const Text('Account'),
            backgroundColor: mainColor,
          ),
        ],
        // fabLocation: StylishBarFabLocation.end,
        // hasNotch: true,
        currentIndex: selected,
        onTap: (index) {
          setState(() {
            selected = index;
            controller.jumpToPage(index);
          });
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: const Icon(Icons.emoji_emotions),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
