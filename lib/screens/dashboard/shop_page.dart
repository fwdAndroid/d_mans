import 'package:d_mans/screens/tabs/completed_orders.dart';
import 'package:d_mans/screens/tabs/pending_orders.dart';
import 'package:d_mans/utils/colors.dart';
import 'package:flutter/material.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          iconTheme: IconThemeData(color: colorwhite),
          backgroundColor: Colors.green,
          title: Text(
            "Order",
            style: TextStyle(color: Colors.black),
          ),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: "Pending Orders",
              ),
              Tab(
                text: "Completed Orders",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            PendingOrders(),
            CompletedOrders(),
          ],
        ),
      ),
    );
  }
}
