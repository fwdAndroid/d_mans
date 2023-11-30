import 'package:d_mans/screens/tabs/completed_orders.dart';
import 'package:d_mans/screens/tabs/pending_orders.dart';
import 'package:flutter/material.dart';

class WebShopPage extends StatefulWidget {
  const WebShopPage({super.key});

  @override
  State<WebShopPage> createState() => _WebShopPageState();
}

class _WebShopPageState extends State<WebShopPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
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
