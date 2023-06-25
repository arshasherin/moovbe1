import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class paymenthistory extends StatefulWidget {
  // const paymenthistory({Key? key}) : super(key: key);
  @override
  State<paymenthistory> createState() => _paymenthistoryState();
}

class _paymenthistoryState extends State<paymenthistory> {
  final CollectionReference _orders =
      FirebaseFirestore.instance.collection('orders');

  final CollectionReference _orderdetails =
      FirebaseFirestore.instance.collection('orderdetails');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Orderssss ',
          style: TextStyle(color: Colors.black),
        ),
        brightness: Brightness.light,
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('order details')
                // .where("orderid", isEqualTo: orderid)
                // .collection("orders")
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
              if (streamSnapshot.hasData) {
                return ListView.builder(
                    itemCount: streamSnapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      log("length ===" +
                          streamSnapshot.data!.docs.length.toString());
                      final DocumentSnapshot documentSnapshot =
                          streamSnapshot.data!.docs[index];
                      var orderid = documentSnapshot['order id'];
                      var proid = documentSnapshot['product id'];
                      // var doc_id2 =
                      //     documentSnapshot.data.docs[index].reference.id;
                      // final docId = _orders.doc().id;
                      // log("docuiddd=====" + docId);

                      return Container(
                        // color: Colors.amber,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.brown),
                            borderRadius: BorderRadius.circular(6),
                            //color: Colors.amber,
                            color: Color(0xFFFFFFFF)),
                        child: ExpansionTile(
                          title: Padding(
                            padding: EdgeInsets.all(1),
                            child: StreamBuilder(
                                stream: FirebaseFirestore.instance
                                    .collection('orders')
                                    .where("order id", isEqualTo: orderid)
                                    // .collection("orders")
                                    .snapshots(),
                                builder: (context,
                                    AsyncSnapshot<QuerySnapshot>
                                        streamSnapshot3) {
                                  if (streamSnapshot3.hasData) {
                                    return Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            streamSnapshot3.data!.docs[0]
                                                .get("name"),
                                            // '  ${documentSnapshot['name']}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          Text(
                                            streamSnapshot3.data!.docs[0]
                                                .get("totalamount")
                                                .toString(),
                                            // '  ${documentSnapshot['totalamount']}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          Text(
                                            streamSnapshot3.data!.docs[0]
                                                .get("orderdate"),
                                            // '  ${documentSnapshot['orderdate']}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          Text(
                                            streamSnapshot3.data!.docs[0]
                                                .get("paymentstatus"),
                                            // '  ${documentSnapshot['paymentstatus']}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                  return Text("data");
                                }),
                          ),
                          children: <Widget>[
                            StreamBuilder<QuerySnapshot>(
                                stream: FirebaseFirestore.instance
                                    .collection('products')
                                    .where('proid', isEqualTo: proid)
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  } else {
                                    if (snapshot.error != null) {
                                      return const Center(
                                        child: Text('An error has occured'),
                                      );
                                    } else {
                                      log("data checking .." +
                                          snapshot.data!.docs.length
                                              .toString());
                                      log(snapshot.data!.docs[0]
                                          .get("proname"));
                                      log("image ==" +
                                          snapshot.data!.docs[0]
                                              .get("image")[0]
                                              .toString());

                                      return Column(
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 15, top: 10),
                                                child: Container(
                                                  //  color: Colors.red,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: Colors.blue,
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                              //.... snapshot.data!.docs[index]['image'][0] ...
                                                              snapshot
                                                                  .data!.docs[0]
                                                                  .get(
                                                                      "image")),
                                                          fit: BoxFit.cover)),
                                                  constraints:
                                                      const BoxConstraints(
                                                          maxHeight: 80,
                                                          maxWidth: 80),
                                                  // child: proimage != null
                                                  //     ? Image.network(proimage)
                                                  //     : Container(
                                                  //         color: Colors.amber,
                                                  //       )
                                                ),
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  // productName != null
                                                  //     ?
                                                  Text(
                                                    // 'Pro name',

                                                    snapshot.data!.docs[0]
                                                        .get("proname"),
                                                    // (snapshot.data!.docs[index]['name']),
                                                    //  +
                                                    //  (order['custname']),
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontFamily: 'muli'),
                                                  ),
                                                  // : Text("null"),
                                                  // proprice != null
                                                  //     ?
                                                  Text(
                                                    // (snapshot.data!.docs[index]['price']
                                                    //     .toString()),
                                                    // 'name',
                                                    snapshot.data!.docs[0]
                                                        .get("price")
                                                        .toString(),
                                                    //  +
                                                    //  (order['custname']),
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontFamily: 'muli'),
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
                                })
                          ],
                          // title: StreamBuilder<QuerySnapshot>(
                          //     stream: FirebaseFirestore.instance
                          //         .collection('order')
                          //         .where('order id',
                          //             isEqualTo: documentSnapshot['order id'])
                          //         .snapshots(),
                          //     builder: (context, snapshot) {
                          //       if (snapshot.connectionState ==
                          //           ConnectionState.waiting) {
                          //         return const Center(
                          //           child: CircularProgressIndicator(),
                          //         );
                          //       } else {
                          //         if (snapshot.error != null) {
                          //           return const Center(
                          //             child: Text('An error has occured'),
                          //           );
                          //         } else {
                          //           log("data checking .." +
                          //               snapshot.data!.docs.length
                          //                   .toString());
                          //           log(snapshot.data!.docs[0]
                          //               .get("proname"));
                          //           log(snapshot.data!.docs[0].get("image"));
                          //           log(snapshot.data!.docs[0]
                          //               .get("price")
                          //               .toString());

                          //           // log("image ==" +
                          //           //     snapshot.data!.docs[0]
                          //           //         .get("image")[0]
                          //           //         .toString());
                          //           // log(cid);

                          //           // log("message====" + cid);

                          //           return Container(
                          //             constraints:
                          //                 const BoxConstraints(maxHeight: 80),
                          //             width: double.infinity,
                          //             child: Row(
                          //               children: [
                          //                 // Padding(
                          //                 //   padding: const EdgeInsets.only(
                          //                 //       right: 15),
                          //                 //   child: Container(
                          //                 //     color: Colors.amber,
                          //                 //     constraints: const BoxConstraints(
                          //                 //         maxHeight: 80, maxWidth: 80),
                          //                 //     child: Image.network(snapshot
                          //                 //         .data!.docs[0]
                          //                 //         .get("image")),
                          //                 //   ),
                          //                 // ),
                          //                 Flexible(
                          //                     child: Column(
                          //                   mainAxisAlignment:
                          //                       MainAxisAlignment
                          //                           .spaceBetween,
                          //                   children: [
                          //                     Text(
                          //                       //"pname",
                          //                       snapshot.data!.docs[0]
                          //                           .get("name"),
                          //                       overflow:
                          //                           TextOverflow.ellipsis,
                          //                       maxLines: 2,
                          //                       style: TextStyle(
                          //                           fontSize: 12,
                          //                           color:
                          //                               Colors.grey.shade600,
                          //                           fontWeight:
                          //                               FontWeight.w600),
                          //                     ),
                          //                     // Padding(
                          //                     //   padding:
                          //                     //       const EdgeInsets.all(8.0),
                          //                     //   child: Row(
                          //                     //     mainAxisAlignment:
                          //                     //         MainAxisAlignment
                          //                     //             .spaceBetween,
                          //                     //     children: [
                          //                     //       Text(('\$ ') +
                          //                     //               (snapshot
                          //                     //                   .data!.docs[0]
                          //                     //                   .get("price")
                          //                     //                   .toStringAsFixed(
                          //                     //                       2)
                          //                     //                   .toString())
                          //                     //           // (order['orderprice'].toStringAsFixed(2))
                          //                     //           ),
                          //                     //       Text(('x ') +
                          //                     //               (documentSnapshot[
                          //                     //                       'orderqty']
                          //                     //                   .toString())
                          //                     //           // (order['orderqty'].toString())
                          //                     //           )
                          //                     //     ],
                          //                     //   ),
                          //                     // )
                          //                   ],
                          //                 ))
                          //               ],
                          //             ),
                          //           );
                          //         }
                          //       }
                          //     })
                        ),
                      );
                    });
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
      // body: Padding(
      //     padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
      //     child: StreamBuilder(
      //       stream: FirebaseFirestore.instance
      //           .collection('order details')
      //           // .where("orderid", isEqualTo: orderid)
      //           // .collection("orders")
      //           .snapshots(),
      //       builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
      //         if (streamSnapshot.hasData) {
      //           return ListView.builder(
      //             itemCount: streamSnapshot.data!.docs.length,
      //             itemBuilder: (context, index) {
      //               log("length ===" +
      //                   streamSnapshot.data!.docs.length.toString());
      //               final DocumentSnapshot documentSnapshot =
      //                   streamSnapshot.data!.docs[index];
      //               //  orderid = documentSnapshot['order id'];
      //               // var doc_id2 =
      //               //     documentSnapshot.data.docs[index].reference.id;
      //               // final docId = _orders.doc().id;
      //               // log("docuiddd=====" + docId);

      //               return Container(
      //                 decoration: BoxDecoration(
      //                     border: Border.all(width: 1, color: Colors.brown),
      //                     borderRadius: BorderRadius.circular(6),
      //                     color: Color(0xFFFFFFFF)),
      //                 child: ExpansionTile(

      //                   title: StreamBuilder<QuerySnapshot>(
      //                       stream: FirebaseFirestore.instance
      //                           .collection('products')
      //                           .where('proid',
      //                               isEqualTo: documentSnapshot['product id'])
      //                           .snapshots(),
      //                       builder: (context, snapshot) {
      //                         if (snapshot.connectionState ==
      //                             ConnectionState.waiting) {
      //                           return const Center(
      //                             child: CircularProgressIndicator(),
      //                           );
      //                         } else {
      //                           if (snapshot.error != null) {
      //                             return const Center(
      //                               child: Text('An error has occured'),
      //                             );
      //                           } else {
      //                             log("data checking .." +
      //                                 snapshot.data!.docs.length.toString());
      //                             log(snapshot.data!.docs[0].get("proname"));
      //                             log(snapshot.data!.docs[0].get("image"));
      //                             log(snapshot.data!.docs[0]
      //                                 .get("price")
      //                                 .toString());

      //                             // log("image ==" +
      //                             //     snapshot.data!.docs[0]
      //                             //         .get("image")[0]
      //                             //         .toString());
      //                             // log(cid);

      //                             // log("message====" + cid);

      //                             return Container(
      //                               constraints:
      //                                   const BoxConstraints(maxHeight: 80),
      //                               width: double.infinity,
      //                               child: Row(
      //                                 children: [
      //                                   Padding(
      //                                     padding: const EdgeInsets.only(
      //                                         right: 15),
      //                                     child: Container(
      //                                       color: Colors.amber,
      //                                       constraints: const BoxConstraints(
      //                                           maxHeight: 80, maxWidth: 80),
      //                                       child: Image.network(snapshot
      //                                           .data!.docs[0]
      //                                           .get("image")),
      //                                     ),
      //                                   ),
      //                                   Flexible(
      //                                       child: Column(
      //                                     mainAxisAlignment:
      //                                         MainAxisAlignment.spaceBetween,
      //                                     children: [
      //                                       Text(
      //                                         //"pname",
      //                                         snapshot.data!.docs[0]
      //                                             .get("proname"),
      //                                         overflow: TextOverflow.ellipsis,
      //                                         maxLines: 2,
      //                                         style: TextStyle(
      //                                             fontSize: 12,
      //                                             color: Colors.grey.shade600,
      //                                             fontWeight:
      //                                                 FontWeight.w600),
      //                                       ),
      //                                       Padding(
      //                                         padding:
      //                                             const EdgeInsets.all(8.0),
      //                                         child: Row(
      //                                           mainAxisAlignment:
      //                                               MainAxisAlignment
      //                                                   .spaceBetween,
      //                                           children: [
      //                                             Text(('\$ ') +
      //                                                     (snapshot
      //                                                         .data!.docs[0]
      //                                                         .get("price")
      //                                                         .toStringAsFixed(
      //                                                             2)
      //                                                         .toString())
      //                                                 // (order['orderprice'].toStringAsFixed(2))
      //                                                 ),
      //                                             Text(('x ') +
      //                                                     (documentSnapshot[
      //                                                             'orderqty']
      //                                                         .toString())
      //                                                 // (order['orderqty'].toString())
      //                                                 )
      //                                           ],
      //                                         ),
      //                                       )
      //                                     ],
      //                                   ))
      //                                 ],
      //                               ),
      //                             );
      //                           }
      //                         }
      //                       }),
      //                   children: <Widget>[
      //                     Text("ORDER DETAILS"),
      //                     StreamBuilder(
      //                         stream: _orders
      //                             .where("order id",
      //                                 isEqualTo: documentSnapshot['order id'])
      //                             .snapshots(),
      //                         builder: (context,
      //                             AsyncSnapshot<QuerySnapshot>
      //                                 streamSnapshot2) {
      //                           if (streamSnapshot2.hasData) {
      //                             log("message2222==" +
      //                                 streamSnapshot2.data!.docs.length
      //                                     .toString());
      //                             return Container(
      //                               height: 200,
      //                               width: 400,
      //                               decoration: BoxDecoration(
      //                                 borderRadius: BorderRadius.all(
      //                                     Radius.circular(10.0)),
      //                               ),
      //                               child: ListView.builder(
      //                                 itemCount:
      //                                     streamSnapshot2.data!.docs.length,
      //                                 itemBuilder:
      //                                     (BuildContext context, int index) {
      //                                   final DocumentSnapshot
      //                                       documentSnapshot2 =
      //                                       streamSnapshot2.data!.docs[index];
      //                                   return Card(
      //                                     color: Colors.blue.shade50,
      //                                     child: Column(
      //                                       crossAxisAlignment:
      //                                           CrossAxisAlignment.start,
      //                                       children: [
      //                                         SizedBox(
      //                                           height: 7,
      //                                         ),
      //                                         Text(
      //                                           // "",
      //                                           'Name :${documentSnapshot2['name']}',
      //                                           style: TextStyle(
      //                                               fontStyle:
      //                                                   FontStyle.italic,
      //                                               fontSize: 16),
      //                                         ),
      //                                         SizedBox(
      //                                           height: 7,
      //                                         ),
      //                                         Text(
      //                                           // "",
      //                                           'Phone :${documentSnapshot2['phone']}',
      //                                           style: TextStyle(
      //                                               fontStyle:
      //                                                   FontStyle.italic,
      //                                               fontSize: 16),
      //                                         ),
      //                                         SizedBox(
      //                                           height: 7,
      //                                         ),
      //                                         Text(
      //                                           //  "",
      //                                           'Address :${documentSnapshot2['address']}',
      //                                           style: TextStyle(
      //                                               fontStyle:
      //                                                   FontStyle.italic,
      //                                               fontSize: 16),
      //                                         ),
      //                                         SizedBox(
      //                                           height: 7,
      //                                         ),
      //                                         Text(
      //                                           // "",
      //                                           'Paymentstatus :${documentSnapshot2['paymentstatus']}',
      //                                           style: TextStyle(
      //                                             fontStyle: FontStyle.italic,
      //                                             fontSize: 16,
      //                                           ),
      //                                         ),
      //                                         SizedBox(
      //                                           height: 7,
      //                                         ),
      //                                         Text(
      //                                           //  "",
      //                                           'Deliverystatus :${documentSnapshot2['deliverystatus']}',
      //                                           style: TextStyle(
      //                                               fontStyle:
      //                                                   FontStyle.italic,
      //                                               fontSize: 16),
      //                                         ),
      //                                         SizedBox(
      //                                           height: 7,
      //                                         ),
      //                                         Text(
      //                                           // "",
      //                                           'Order Date :${documentSnapshot2['orderdate']}',
      //                                           style: TextStyle(
      //                                               fontStyle:
      //                                                   FontStyle.italic,
      //                                               fontSize: 16),
      //                                         ),
      //                                       ],
      //                                     ),
      //                                   );
      //                                 },
      //                               ),
      //                             );
      //                           }
      //                           return Text("");
      //                         })
      //                   ],
      //                 ),
      //               );
      //             },
      //           );
      //         }

      //         return const Center(
      //           child: CircularProgressIndicator(),
      //         );
      //       },
      //     ))
    );
  }
}
