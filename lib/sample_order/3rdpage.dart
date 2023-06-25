import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class ViewOrderDetails extends StatelessWidget {
  final dynamic productid, order;

  ViewOrderDetails({required this.productid, required this.order});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('products')
            .where('proid', isEqualTo: productid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (snapshot.error != null) {
              return const Center(
                child: Text('An error has occured'),
              );
            } else {
              log("data checking .." + snapshot.data!.docs.length.toString());
              log(snapshot.data!.docs[0].get("proname"));
              log("image ==" + snapshot.data!.docs[0].get("image").toString());

              return Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 15, top: 10),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              //  color: Color(0xFFF5F6F9),
                              color: Colors.grey.shade300,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      //.... snapshot.data!.docs[index]['image'][0] ...
                                      snapshot.data!.docs[0].get("image")),
                                  fit: BoxFit.cover)),
                          constraints:
                              const BoxConstraints(maxHeight: 80, maxWidth: 80),
                          // child: proimage != null
                          //     ? Image.network(proimage)
                          //     : Container(
                          //         color: Colors.amber,
                          //       )
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // productName != null
                          //     ?
                          Text(
                            // 'Pro name',

                            snapshot.data!.docs[0].get("proname"),
                            // (snapshot.data!.docs[index]['name']),
                            //  +
                            //  (order['custname']),
                            style: TextStyle(fontSize: 15, fontFamily: 'muli'),
                          ),
                          // : Text("null"),
                          // proprice != null
                          //     ?
                          Text(
                            // (snapshot.data!.docs[index]['price']
                            //     .toString()),
                            // 'name',
                            snapshot.data!.docs[0].get("price").toString(),
                            //  +
                            //  (order['custname']),
                            style: TextStyle(fontSize: 15, fontFamily: 'muli'),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              );
              // Text("message");
            }
          }
        });
    // .toList());
  }
}
