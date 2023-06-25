import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:droppp_flutter/sample_order/3rdpage.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomerOrderModel extends StatefulWidget {
  final dynamic order, orderid;
  CustomerOrderModel({
    Key? key,
    required this.order,
    required this.orderid,
  }) : super(key: key);

  @override
  State<CustomerOrderModel> createState() => _CustomerOrderModelState();
}

class _CustomerOrderModelState extends State<CustomerOrderModel> {
  bool _hasBeenPressed = true;

  var productName;

  var proimage;

  var proprice;

  var proid;

  @override
  Widget build(BuildContext context) {
    // log("order id===" + widget.orderid);
    // log("productsid -===----" + widget.productsid);
    // Timestamp t = widget.order['orderdate'];
    // DateTime d = t.toDate();
    // print(d.toString());
    // var query = FirebaseFirestore.instance
    //     .collection('orderdetails')
    //     .where('orderid', isEqualTo: widget.orderid)
    //     .limit(1);
    // Stream<QuerySnapshot> snapshot1 = query.snapshots();
    // log("message-----");
    // // log("proid=====" + proid.toString());
    // snapshot1.forEach((field) {
    //   field.docs.asMap().forEach((index, data) async {
    //     proid = field.docs[index]["proid"];
    //     log(" iiiiiiiiiiiiiiiiiiiiiiiiiii ===" + proid);
    //     // setState(() {
    //     //   productName = field.docs[index]["name"];
    //     //   proimage = field.docs[index]['image'][0];
    //     //   proprice = field.docs[index]['price'];
    //     //   print("Customer ID =" + field.docs[index].id);

    //     //   print("productName=================" + productName);
    //     // });

    //     //IF I PRINT HERE, IT SHOWS THE PRODUCTS.

    //     //.............................................
    //     //  setState(() {
    //     //           _hasBeenPressed = !_hasBeenPressed;
    //     //         })
    //     //.....................................................
    //   });
    // });
    print("rrrrrrrrrrrrrrrrrrrrrr");
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Color(0xFFFF7643).withOpacity(0.50)),
            borderRadius: BorderRadius.circular(15)),
        child: ExpansionTile(
          title: Container(
            constraints: const BoxConstraints(maxHeight: 90),
            width: double.infinity,
            child: Row(
              children: [
                // Padding(
                //   padding: const EdgeInsets.only(right: 15),
                //   child: Container(
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(10),
                //       color: Colors.amber,
                //       // image: DecorationImage(
                //       //     image: NetworkImage(order['orderimage']),
                //       //     fit: BoxFit.cover)
                //     ),
                //     constraints:
                //         const BoxConstraints(maxHeight: 80, maxWidth: 80),
                //     // child: Image.network(order['orderimage']),
                //   ),
                // ),

                Flexible(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(
                    //   d.toString(),
                    //   overflow: TextOverflow.ellipsis,
                    //   maxLines: 2,
                    //   style: TextStyle(
                    //       fontSize: 16,
                    //       fontFamily: 'muli',
                    //       color: Colors.grey.shade600,
                    //       fontWeight: FontWeight.w700),
                    // ),
                    Text(widget.order['name'].toString()),
                    Text(widget.order['totalamount'].toString()),
                    Text(widget.order['orderdate'].toString()),
                    Text(widget.order['paymentstatus'].toString()),
                    // Row(
                    //   children: [
                    //     const Text(
                    //       ('Payment Status: '),
                    //       style: TextStyle(fontSize: 15, fontFamily: 'muli'),
                    //     ),
                    //     Text(
                    //       (widget.order['paymentstatus']),
                    //       style: const TextStyle(
                    //           fontFamily: 'muli',
                    //           fontSize: 15,
                    //           color: Colors.grey),
                    //     ),
                    //   ],
                    // ),
                    // Row(
                    //   children: [
                    //     const Text(
                    //       ('Delivery status: '),
                    //       style: TextStyle(fontSize: 15, fontFamily: 'muli'),
                    //     ),
                    //     Text(
                    //       (widget.order['deliverystatus']),
                    //       style: const TextStyle(
                    //           fontFamily: 'muli',
                    //           fontSize: 15,
                    //           color: Colors.green),
                    //     ),
                    //   ],
                    // ),

                    // Text(order['granttotal'].toString()),
                    // Text(order['granttotal'].toString())
                  ],
                ))
              ],
            ),
          ),
          //   subtitle: _hasBeenPressed
          // ? Text(
          //     "Seen More ...",
          //     style: TextStyle(fontFamily: 'muli'),
          //   )
          // : Text(
          //     'See less ..',
          //     style: TextStyle(fontFamily: 'muli'),
          //   ),
          //  const Text(
          //   // 'See More ..',
          //   //  _hasBeenPressed ? 'See More ...' :'',
          //   style: TextStyle(fontFamily: 'muli'),
          // ),

          children: [
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('order details')
                    .where('order id', isEqualTo: widget.orderid)
                    // .limit(1)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  // var productId = snapshot.data!.docs.length;
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // log("productid inside listview -" + proid);
                    log("sssbbsss");
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  log("ssssss");
                  if (snapshot.hasError) {
                    return const Text('Something went wrong');
                  }

                  log("snapshot length in order model =====${snapshot.data!.docs.length}");

                  if (snapshot.data!.docs.isEmpty) {
                    log("sssswwss");

                    return Text("EMPTY");
                  }

                  return Container(
                      height: 230,
                      width: double.infinity,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.builder(
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                log("message ===" +
                                    snapshot.data!.docs.length.toString());

                                var proid =
                                    snapshot.data!.docs[index]['product id'];
                                log("productid ====" + proid);
                                return
                                    // Text("data");
                                    ViewOrderDetails(
                                  productid: proid,
                                  order: widget.order,
                                );
                              })));
                }),
          ],
        ),
      ),
    );
  }
}
