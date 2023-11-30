import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d_mans/screens/dashboard/detail_page.dart';
import 'package:d_mans/screens/detail/product_detail.dart';
import 'package:d_mans/screens/order/checkout_page.dart';
import 'package:d_mans/utils/colors.dart';
import 'package:d_mans/web_module/shoping/web_shopping_cart.dart';
import 'package:d_mans/web_module/web_detailed_page.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class WebHomePage extends StatefulWidget {
  const WebHomePage({super.key});

  @override
  State<WebHomePage> createState() => _WebHomePageState();
}

class _WebHomePageState extends State<WebHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/banner.png")),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recommended",
                  style: TextStyle(
                      color: colorBlack,
                      fontWeight: FontWeight.w400,
                      fontSize: 18),
                  textAlign: TextAlign.start,
                ),
                Text(
                  "See All",
                  style: TextStyle(
                      color: mainColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 18),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.7,
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("products")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.data!.docs.isEmpty) {
                    return const Center(
                      child: Text(
                        "No Product Found yet",
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }
                  return LayoutBuilder(builder: (context, constraints) {
                    return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                childAspectRatio: 2 / 3,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20),
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          return StreamBuilder<Object>(
                            stream: FirebaseFirestore.instance
                                .collection("products")
                                .snapshots(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (!snapshot.hasData) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              final List<DocumentSnapshot> documents =
                                  snapshot.data!.docs;
                              final Map<String, dynamic> data = documents[index]
                                  .data() as Map<String, dynamic>;
                              return SizedBox(
                                width: 170,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (builder) =>
                                                WebDetailedPage(
                                                    photoUrl: data["photoURL"]
                                                        .toString(),
                                                    price: data['productPrice'],
                                                    productCategory:
                                                        data['productCategory'],
                                                    productDescription: data[
                                                        'productDescription'],
                                                    productName:
                                                        data['productName'],
                                                    productSubCategoty: data[
                                                        'productSubCategory'],
                                                    uuid: data['uuid'])));
                                  },
                                  child: Card(
                                    elevation: 3,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Image.network(
                                            data["photoURL"].toString(),
                                            height: 105,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Product Name: ",
                                                style: TextStyle(
                                                    color: colorBlack,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                data['productName'],
                                                style: TextStyle(
                                                    color: colorBlack,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Category: ",
                                                style: TextStyle(
                                                    color: colorBlack,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                data['productCategory'],
                                                style: TextStyle(
                                                    color: colorBlack,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(
                                            data['productPrice'].toString() +
                                                "RM",
                                            style: TextStyle(
                                                color: colorBlack,
                                                fontSize: 24,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        });
                  });
                }),
          ),
        ],
      ),
    ));
  }
}
// StreamBuilder(
//           stream: FirebaseFirestore.instance.collection("products").snapshots(),
//           builder: (context, snapshot) {
//             return GridView.builder(

//               itemBuilder: (context, i) => 

//           }),