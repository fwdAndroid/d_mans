import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d_mans/screens/main_screen.dart';
import 'package:d_mans/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PendingOrders extends StatefulWidget {
  const PendingOrders({super.key});

  @override
  State<PendingOrders> createState() => _PendingOrdersState();
}

class _PendingOrdersState extends State<PendingOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("orders")
              .where("userId",
                  isEqualTo: FirebaseAuth.instance.currentUser!.uid)
              .where("status", isEqualTo: "pending")
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
                  "No Orders Found yet",
                  style: TextStyle(color: Colors.white),
                ),
              );
            }
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  return StreamBuilder<Object>(
                      stream: FirebaseFirestore.instance
                          .collection("orders")
                          .where("userId",
                              isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                          .where("status", isEqualTo: "pending")
                          .snapshots(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        final List<DocumentSnapshot> documents =
                            snapshot.data!.docs;
                        final Map<String, dynamic> data =
                            documents[index].data() as Map<String, dynamic>;
                        return Card(
                          child: ListTile(
                            trailing: TextButton(
                              child: Text(
                                "Delete",
                                style: TextStyle(color: colorBlack),
                              ),
                              onPressed: () async {
                                await FirebaseFirestore.instance
                                    .collection("orders")
                                    .doc(data['uuid'])
                                    .delete();

                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (builder) => MainScreen()));
                              },
                            ),
                            leading: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(data['productImage'].toString()),
                            ),
                            title: Text(data['productName']),
                            subtitle: Row(
                              children: [
                                Text('Price: RM${data['price'].toString()}'),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                    'Quantity: ${data['quantity'].toString()}'),
                              ],
                            ),
                          ),
                        );
                      });
                });
          }),
    );
  }
}
