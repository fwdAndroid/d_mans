import 'package:d_mans/screens/order/checkout_page.dart';
import 'package:d_mans/utils/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProductDetail extends StatefulWidget {
  String productName;
  String productDescription;
  String productCategory;
  String name;
  String productSubCategoty;
  String photoUrl;
  String uuid;
  int price;
  ProductDetail(
      {super.key,
      required this.photoUrl,
      required this.price,
      required this.name,
      required this.productCategory,
      required this.productDescription,
      required this.productName,
      required this.productSubCategoty,
      required this.uuid});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: colorwhite),
        backgroundColor: Colors.green,
        title: Text(
          "Product Details",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Align(
          alignment: AlignmentDirectional.center,
          child: Container(
            margin: EdgeInsets.only(top: 20),
            width: 500,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                        radius: 59,
                        backgroundImage: NetworkImage(widget.photoUrl)),
                    const SizedBox(
                      height: 15,
                    ),
                    Column(
                      children: [
                        Text("Product Name"),
                        Text(widget.productName)
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Column(
                      children: [
                        Text("Product Category"),
                        Text(widget.productCategory)
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Column(
                      children: [
                        Text("Product SubCategory"),
                        Text(widget.productSubCategoty)
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Column(
                      children: [
                        Text("Product Description"),
                        Text(widget.productDescription)
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Column(
                      children: [
                        Text("Product Price"),
                        Text(widget.price.toString())
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (builder) => ShoppingCart(
                                            uuid: widget.uuid,
                                            photoUrl: widget.photoUrl,
                                            price: widget.price,
                                            productCategory:
                                                widget.productCategory,
                                            productDescription:
                                                widget.productDescription,
                                            productName: widget.productName,
                                            productSubCategoty:
                                                widget.productSubCategoty,
                                          )));
                            },
                            child: Text(
                              "Order Now",
                              style:
                                  TextStyle(color: Colors.green, fontSize: 30),
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
