import 'package:d_mans/screens/main_screen.dart';
import 'package:d_mans/utils/colors.dart';
import 'package:d_mans/web_module/web_tabbar.dart';
import 'package:flutter/material.dart';

class WebFinalPage extends StatefulWidget {
  String address;
  String photo;
  WebFinalPage({super.key, required this.address, required this.photo});

  @override
  State<WebFinalPage> createState() => _WebFinalPageState();
}

class _WebFinalPageState extends State<WebFinalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: colorBlack),
        title: Text(
          "Payment Recipt",
          style: TextStyle(color: Colors.grey, fontSize: 24),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "assets/r.png",
              height: 500,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                            backgroundColor: mainColor.withOpacity(.7),
                            content: Container(
                              height: 300,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Payment Successful'),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  Text(
                                    "Shipping Address",
                                    textAlign: TextAlign.start,
                                  ),
                                  Container(
                                    width: 290,
                                    height: 100,
                                    decoration:
                                        BoxDecoration(color: Colors.grey),
                                    child: Center(
                                        child: Text(
                                      widget.address,
                                      textAlign: TextAlign.center,
                                    )),
                                  )
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (builder) => WebTabBar()));
                                },
                                child: const Text('Close'),
                              ),
                            ]));
              },
              child: Text("Close"))
        ],
      ),
    );
  }
}
