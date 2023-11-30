import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d_mans/screens/order/final_page.dart';
import 'package:d_mans/utils/colors.dart';
import 'package:d_mans/web_module/shoping/web_final_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class WebWebProceedPage extends StatefulWidget {
  int quantity;
  int totalPrice;
  String productID;
  String productName;
  String productCategory;
  String productSubCategory;
  String productDescription;
  String address;
  String city;
  String state;
  String photo;
  String phone;
  WebWebProceedPage(
      {super.key,
      required this.quantity,
      required this.totalPrice,
      required this.productCategory,
      required this.productDescription,
      required this.productName,
      required this.address,
      required this.photo,
      required this.city,
      required this.state,
      required this.productSubCategory,
      required this.phone,
      required this.productID});

  @override
  State<WebWebProceedPage> createState() => _WebWebProceedPageState();
}

class _WebWebProceedPageState extends State<WebWebProceedPage> {
  var uuid = Uuid().v4();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: colorBlack),
        title: Text(
          "Payment",
          style: TextStyle(color: Colors.grey, fontSize: 24),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("users")
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .snapshots(),
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return new CircularProgressIndicator();
              }
              var document = snapshot.data;
              return Column(
                children: [
                  SingleChildScrollView(
                    child: Align(
                      alignment: AlignmentDirectional.center,
                      child: Container(
                        color: mainColor,
                        margin: EdgeInsets.only(top: 20),
                        width: 500,
                        child: Card(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Bill ID: ",
                                      style: TextStyle(color: colorBlack),
                                    ),
                                    Text("  ${widget.productID}")
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Name: ",
                                      style: TextStyle(color: colorBlack),
                                    ),
                                    Text("  ${document['name']}")
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Email: ",
                                      style: TextStyle(color: colorBlack),
                                    ),
                                    Text("  ${document['email']}")
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Reference: ",
                                      style: TextStyle(color: colorBlack),
                                    ),
                                    Text("  ${document['uid']}")
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Invoice: ",
                                      style: TextStyle(color: colorBlack),
                                    ),
                                    Text("  ${widget.productID}")
                                  ],
                                ),
                                Divider(),
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Total",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        Text(
                                          "RM ${widget.totalPrice}".toString(),
                                          style: TextStyle(
                                              color: colorBlack,
                                              fontSize: 22,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Divider(),
                                Text(
                                  "Pay With",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                ElevatedButton(
                                  onPressed: () async {
                                    await FirebaseFirestore.instance
                                        .collection("orders")
                                        .doc(uuid)
                                        .set({
                                      "uuid": uuid,
                                      "quantity": widget.quantity,
                                      "price": widget.totalPrice,
                                      "productId": widget.productID,
                                      "state": widget.state,
                                      "status": "pending",
                                      "productImage": widget.photo,
                                      "productDescription":
                                          widget.productDescription,
                                      "userName": document['name'],
                                      "city": widget.city,
                                      "address": widget.address,
                                      "phone": widget.phone,
                                      "productCategory": widget.productCategory,
                                      "productName": widget.productName,
                                      "productSubCategory":
                                          widget.productSubCategory,
                                      "userId": FirebaseAuth
                                          .instance.currentUser!.uid,
                                    });
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (builder) => WebFinalPage(
                                                  photo: widget.photo,
                                                  address: widget.address,
                                                )));
                                  },
                                  child: isLoading
                                      ? Center(
                                          child: CircularProgressIndicator(),
                                        )
                                      : Text(
                                          "Pay Via Bank",
                                          style: TextStyle(color: colorBlack),
                                        ),
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: Size(300, 0),
                                    backgroundColor: colorwhite,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
