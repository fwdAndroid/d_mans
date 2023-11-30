import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d_mans/utils/colors.dart';
import 'package:d_mans/utils/textorminputfields.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  bool isSearch = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Search",
          style: TextStyle(
              color: Colors.grey, fontSize: 40, fontWeight: FontWeight.w400),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: TextFormInputField(
              onFieldSubmitted: (_) {
                setState(() {
                  isSearch = true;
                });
              },
              suIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isSearch = true;
                    });
                  },
                  icon: Icon(Icons.search)),
              hintText: "Search",
              controller: searchController,
              textInputType: TextInputType.name,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15),
            child: TextFormField(
              maxLines: 10,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: filledColor)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: filledColor)),
                  contentPadding: EdgeInsets.only(top: 5, left: 6),
                  border: InputBorder.none,
                  fillColor: filledColor,
                  filled: true,
                  hintText: "Recommendation",
                  errorStyle: TextStyle(color: colorBlack),
                  hintStyle: TextStyle(color: colorBlack.withOpacity(.7))),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 670,
              child: isSearch
                  ? StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection("products")
                          .where("productName",
                              isGreaterThanOrEqualTo: searchController.text)
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Text('Loading...');
                        }

                        List<DocumentSnapshot> documents = snapshot.data!.docs;
                        return ListView.builder(
                          itemCount: documents.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              onTap: () {
                                var data = snapshot.data!.docs[index];
                              },
                              title: Text(documents[index]['productName']),
                              subtitle: Text(
                                  documents[index]['productPrice'].toString()),
                            );
                          },
                        );
                      },
                    )
                  : Text(
                      "NO SEARCH RESULT",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ))
        ],
      ),
    );
  }
}
