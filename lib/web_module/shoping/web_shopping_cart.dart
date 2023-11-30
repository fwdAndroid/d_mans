import 'package:d_mans/screens/order/proceedpage.dart';
import 'package:d_mans/utils/colors.dart';
import 'package:d_mans/utils/textorminputfields.dart';
import 'package:d_mans/web_module/shoping/web_proceed_page.dart';
import 'package:flutter/material.dart';

class WebShoppingCart extends StatefulWidget {
  String productName;
  String productDescription;
  String productCategory;
  String productSubCategoty;
  String photoUrl;
  String uuid;
  int price;
  WebShoppingCart(
      {super.key,
      required this.photoUrl,
      required this.price,
      required this.productCategory,
      required this.productDescription,
      required this.productName,
      required this.productSubCategoty,
      required this.uuid});

  @override
  State<WebShoppingCart> createState() => _WebShoppingCartState();
}

class _WebShoppingCartState extends State<WebShoppingCart> {
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
        backgroundColor: Color(0xff8BC34A),
        title: Text(
          "Checkout Page",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Card(
                color: Color(0xff8BC34A).withOpacity(.6),
                child: SizedBox(
                  width: 319,
                  height: 150,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(
                          widget.photoUrl,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Product Price",
                                style: TextStyle(
                                    color: colorBlack,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                ' RM${widget.price.toString()}',
                                style: TextStyle(
                                    color: colorwhite,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Container(
                            width: 121,
                            height: 48,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  child: Opacity(
                                    opacity: 0.08,
                                    child: Container(
                                      width: 121,
                                      height: 48,
                                      decoration: ShapeDecoration(
                                        color: Color(0xFF4CA771),
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              width: 1,
                                              color: Color(0xFFF6F6F6)),
                                          borderRadius:
                                              BorderRadius.circular(37),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 85,
                                  top: 12,
                                  child: Container(
                                    width: 24,
                                    height: 24,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          left: 0,
                                          top: 0,
                                          child: Container(
                                            width: 24,
                                            height: 24,
                                            decoration: ShapeDecoration(
                                              color: Color(0xFF4CA771),
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                    width: 1,
                                                    color: Color(0xFFF6F6F6)),
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                            ),
                                            child: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  _counter++;
                                                });
                                              },
                                              child: Icon(
                                                Icons.add,
                                                color: colorwhite,
                                                size: 20,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 55,
                                  top: 12,
                                  child: Text(
                                    '$_counter',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Positioned(
                                  left: 12,
                                  top: 12,
                                  child: Container(
                                    width: 24,
                                    height: 24,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          left: 0,
                                          top: 0,
                                          child: Container(
                                            width: 24,
                                            height: 24,
                                            decoration: ShapeDecoration(
                                              color: Color(0xFF4CA771),
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                    width: 1,
                                                    color: Color(0xFFF6F6F6)),
                                                borderRadius:
                                                    BorderRadius.circular(63),
                                              ),
                                            ),
                                            child: GestureDetector(
                                              onTap: () {
                                                if (_counter > 0) {
                                                  setState(() {
                                                    _counter--;
                                                  });
                                                }
                                              },
                                              child: Icon(
                                                Icons.remove,
                                                color: colorwhite,
                                                size: 20,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "Product Price",
                                style: TextStyle(
                                    color: colorBlack,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text('  RM${totalPrice.toStringAsFixed(2)}'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormInputField(
                controller: stateController,
                hintText: "Enter State Name",
                textInputType: TextInputType.text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormInputField(
                controller: cityController,
                hintText: "Enter City Name",
                textInputType: TextInputType.text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormInputField(
                controller: addressController,
                hintText: "Enter Address",
                textInputType: TextInputType.text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormInputField(
                controller: phoneController,
                hintText: "Enter Phone Number",
                textInputType: TextInputType.number,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (stateController.text.isEmpty ||
                    cityController.text.isEmpty ||
                    addressController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("All Fields are required")));
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => WebWebProceedPage(
                                quantity: _counter,
                                totalPrice: totalPrice,
                                productID: widget.uuid,
                                state: stateController.text,
                                photo: widget.photoUrl,
                                productDescription: widget.productDescription,
                                city: cityController.text,
                                address: addressController.text,
                                phone: phoneController.text,
                                productCategory: widget.productCategory,
                                productName: widget.productName,
                                productSubCategory: widget.productSubCategoty,
                              )));
                }
              },
              child: Text(
                "Proceed",
                style: TextStyle(color: colorwhite),
              ),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(300, 0),
                backgroundColor: Color(0xff8BC34A),
              ),
            )
          ],
        ),
      ),
    );
  }

  int get totalPrice => _counter * widget.price;
}
