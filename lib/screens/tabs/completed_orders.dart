import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CompletedOrders extends StatefulWidget {
  const CompletedOrders({super.key});

  @override
  State<CompletedOrders> createState() => _CompletedOrdersState();
}

class _CompletedOrdersState extends State<CompletedOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("orders")
              .where("userId",
                  isEqualTo: FirebaseAuth.instance.currentUser!.uid)
              .where("status", isEqualTo: "completed")
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
                          .where("status", isEqualTo: "completed")
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
