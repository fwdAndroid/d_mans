import 'package:d_mans/screens/dashboard/account_page.dart';
import 'package:d_mans/screens/dashboard/category_page.dart';
import 'package:d_mans/screens/dashboard/search_page.dart';
import 'package:d_mans/screens/dashboard/shop_page.dart';
import 'package:d_mans/web_module/pages/web_account_page.dart';
import 'package:d_mans/web_module/pages/web_category_page.dart';
import 'package:d_mans/web_module/pages/web_shop_page.dart';
import 'package:d_mans/web_module/web_home_page.dart';
import 'package:flutter/material.dart';

class WebTabBar extends StatefulWidget {
  const WebTabBar({super.key});

  @override
  State<WebTabBar> createState() => _WebTabBarState();
}

class _WebTabBarState extends State<WebTabBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          bottom: const TabBar(
            tabs: [
              Tab(text: "Home"),
              Tab(text: "Category"),
              Tab(text: "Shop"),
              Tab(text: "Search"),
              Tab(text: "Account"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            WebHomePage(),
            WebCategoryPage(),
            WebShopPage(),
            SearchPage(),
            WebAccountPage()
          ],
        ),
      ),
    );
  }
}
