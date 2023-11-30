import 'package:d_mans/utils/colors.dart';
import 'package:d_mans/web_module/shoping/web_shopping_cart.dart';
import 'package:flutter/material.dart';

class WebDetailedPage extends StatefulWidget {
  String productName;
  String productDescription;
  String productCategory;
  String productSubCategoty;
  String photoUrl;
  String uuid;
  int price;
  WebDetailedPage(
      {super.key,
      required this.photoUrl,
      required this.price,
      required this.productCategory,
      required this.productDescription,
      required this.productName,
      required this.productSubCategoty,
      required this.uuid});

  @override
  State<WebDetailedPage> createState() => _WebDetailedPageState();
}

class _WebDetailedPageState extends State<WebDetailedPage> {
  int _counter = 0;
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: colorwhite),
        backgroundColor: mainColor,
        title: Text(
          "Checkout Page",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(widget.photoUrl),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Product Name",
                style: TextStyle(
                    color: colorBlack,
                    fontSize: 16,
                    fontWeight: FontWeight.w800),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.productName,
                style: TextStyle(
                    color: colorBlack,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Product Description",
                style: TextStyle(
                    color: colorBlack,
                    fontSize: 16,
                    fontWeight: FontWeight.w800),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.productDescription,
                style: TextStyle(
                    color: colorBlack,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => WebShoppingCart(
                                price: widget.price,
                                uuid: widget.uuid,
                                photoUrl: widget.photoUrl,
                                productDescription: widget.productDescription,
                                productCategory: widget.productCategory,
                                productName: widget.productName,
                                productSubCategoty: widget.productSubCategoty,
                              )));
                },
                child: Text(
                  "Proceed",
                  style: TextStyle(color: colorwhite),
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(300, 0),
                  backgroundColor: mainColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
