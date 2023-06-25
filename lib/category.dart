// // // import 'dart:developer';

// // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:flutter/src/widgets/container.dart';
// // // import 'package:flutter/src/widgets/framework.dart';

// // // class orderhistory extends StatefulWidget {
// // //   orderhistory({super.key});

// // //   @override
// // //   State<orderhistory> createState() => _orderhistoryState();
// // // }

// // // class _orderhistoryState extends State<orderhistory> {
// // //   final CollectionReference _orderhistory =
// // //       FirebaseFirestore.instance.collection('orders');
// // //   final CollectionReference _order =
// // //       FirebaseFirestore.instance.collection('orderdetails');
// // //   var orderidd = "";

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text("order history "),
// // //         centerTitle: true,
// // //         actions: <Widget>[],
// // //       ),
// // //       body: StreamBuilder(
// // //         stream: _orderhistory.where("orderid", isEqualTo: orderidd).snapshots(),
// // //         builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
// // //           if (streamSnapshot.hasData) {
// // //             return ListView.builder(
// // //               itemCount: streamSnapshot.data!.docs.length,
// // //               itemBuilder: (context, index) {
// // //                 final DocumentSnapshot documentSnapshot =
// // //                     streamSnapshot.data!.docs[index];

// // //                 return Padding(
// // //                   padding: const EdgeInsets.all(8.0),
// // //                   child: Container(
// // //                     decoration: BoxDecoration(
// // //                       borderRadius: BorderRadius.circular(25),
// // //                       color: Color.fromARGB(255, 238, 230, 230),
// // //                     ),
// // //                     child: ExpansionTile(
// // //                       title: Padding(
// // //                         padding: const EdgeInsets.all(8.0),
// // //                         child: Text(
// // //                           'ORDERID  : ${documentSnapshot['orderid']}',
// // //                           style: TextStyle(
// // //                               fontWeight: FontWeight.bold, fontSize: 15),
// // //                         ),
// // //                       ),
// // //                       subtitle: Column(children: [
// // //                         Text(
// // //                           'ORDERDATE : ${documentSnapshot['orderdate']}',
// // //                           style: TextStyle(
// // //                               fontWeight: FontWeight.bold, fontSize: 15),
// // //                         ),
// // //                         Text(
// // //                           'ORDERPrice : ${documentSnapshot['orderprice']}',
// // //                           style: TextStyle(
// // //                               fontWeight: FontWeight.bold, fontSize: 15),
// // //                         ),
// // //                       ]),
// // //                       children: <Widget>[
// // //                         StreamBuilder(
// // //                             stream: _order
// // //                                 .where("orderid", isEqualTo: orderidd)
// // //                                 .snapshots(),
// // //                             builder: (context,
// // //                                 AsyncSnapshot<QuerySnapshot> streamSnapshot) {
// // //                               if (streamSnapshot.hasData) {
// // //                                 log("message==" +
// // //                                     streamSnapshot.data!.docs.length
// // //                                         .toString());
// // //                                 return ListView.builder(
// // //                                     itemCount: streamSnapshot.data!.docs.length,
// // //                                     itemBuilder: (context, index) {
// // //                                       final DocumentSnapshot documentSnapshot =
// // //                                           streamSnapshot.data!.docs[index];
// // //                                       return Card(
// // //                                         //color: Colors.blueGrey.shade100,
// // //                                         elevation: 5.0,
// // //                                         child: Padding(
// // //                                           padding: const EdgeInsets.all(4.0),
// // //                                           child: Row(
// // //                                             mainAxisAlignment:
// // //                                                 MainAxisAlignment.spaceEvenly,
// // //                                             mainAxisSize: MainAxisSize.max,
// // //                                             children: [
// // //                                               Image(
// // //                                                 height: 80,
// // //                                                 width: 80,
// // //                                                 image: NetworkImage(
// // //                                                     ' ${documentSnapshot['itemname1']}'),
// // //                                               ),
// // //                                               SizedBox(
// // //                                                 width: 130,
// // //                                                 child: Column(
// // //                                                   crossAxisAlignment:
// // //                                                       CrossAxisAlignment.start,
// // //                                                   children: [
// // //                                                     const SizedBox(
// // //                                                       height: 5.0,
// // //                                                     ),
// // //                                                     RichText(
// // //                                                       overflow:
// // //                                                           TextOverflow.ellipsis,
// // //                                                       maxLines: 1,
// // //                                                       text: TextSpan(
// // //                                                           style: TextStyle(
// // //                                                               color: Colors
// // //                                                                   .blueGrey
// // //                                                                   .shade800,
// // //                                                               fontSize: 16.0),
// // //                                                           children: [
// // //                                                             TextSpan(
// // //                                                                 text: '${""}',
// // //                                                                 style: const TextStyle(
// // //                                                                     fontWeight:
// // //                                                                         FontWeight
// // //                                                                             .bold)),
// // //                                                           ]),
// // //                                                     ),
// // //                                                     RichText(
// // //                                                       maxLines: 1,
// // //                                                       text: TextSpan(
// // //                                                           text: '' r"$",
// // //                                                           style: TextStyle(
// // //                                                               color: Colors
// // //                                                                   .blueGrey
// // //                                                                   .shade800,
// // //                                                               fontSize: 16.0),
// // //                                                           children: [
// // //                                                             TextSpan(
// // //                                                                 text: (documentSnapshot[
// // //                                                                     'orderprice']),
// // //                                                                 style: const TextStyle(
// // //                                                                     fontWeight:
// // //                                                                         FontWeight
// // //                                                                             .bold)),
// // //                                                           ]),
// // //                                                     ),
// // //                                                   ],
// // //                                                 ),
// // //                                               ),
// // //                                               SizedBox(
// // //                                                 width: 50,
// // //                                               ),
// // //                                               RichText(
// // //                                                 maxLines: 1,
// // //                                                 text: TextSpan(
// // //                                                     text: '' r"x ",
// // //                                                     style: TextStyle(
// // //                                                         color: Colors
// // //                                                             .blueGrey.shade800,
// // //                                                         fontSize: 16.0),
// // //                                                     children: [
// // //                                                       TextSpan(
// // //                                                           text: ("2"),
// // //                                                           style: const TextStyle(
// // //                                                               fontWeight:
// // //                                                                   FontWeight
// // //                                                                       .bold)),
// // //                                                     ]),
// // //                                               ),
// // //                                             ],
// // //                                           ),
// // //                                         ),
// // //                                       );
// // //                                     });
// // //                                 // ListTile(
// // //                                 //     title: Text(
// // //                                 //         'address :${documentSnapshot['address']}')),
// // //                                 // ListTile(
// // //                                 //     title: Text('phone :${documentSnapshot['phone']}')),
// // //                               }
// // //                               return Text("");
// // //                             })
// // //                       ],
// // //                     ),
// // //                   ),
// // //                 );
// // //               },
// // //             );
// // //           }

// // //           return Center(
// // //             child: CircularProgressIndicator(),
// // //           );
// // //         },
// // //       ),
// // //     );
// // //   }
// // // }




// // import 'dart:developer';

// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:ecommerce/constants.dart';
// // import 'package:flutter/material.dart';
// // import 'package:intl/intl.dart';
// // import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

// // class SupplierOrderModel extends StatelessWidget {
// //   final String productid, orderid, orderdetailsid, deliverystatus;
// //   final String qty;
// //   SupplierOrderModel(
// //       {Key? key,
// //       required this.productid,
// //       required this.qty,
// //       required this.orderid,
// //       required this.orderdetailsid,
// //       required this.deliverystatus})
// //       : super(key: key);

// //   var cid;

// //   @override
// //   Widget build(BuildContext context) {
// //     log("proid =====" + productid);
// //     log("order id ==" + orderid);
// //     log("orderdetails id ===" + orderdetailsid);

// //     return StreamBuilder<QuerySnapshot>(
// //         stream: FirebaseFirestore.instance
// //             .collection('orders')
// //             .where('orderid', isEqualTo: orderid)
// //             .snapshots(),
// //         builder: (context, snapshot1) {
// //           if (snapshot1.connectionState == ConnectionState.waiting) {
// //             return const Center(
// //               child: CircularProgressIndicator(),
// //             );
// //           } else {
// //             if (snapshot1.error != null) {
// //               return const Center(
// //                 child: Text('An error has occured'),
// //               );
// //             } else {
// //               log("data checking .." + snapshot1.data!.docs.length.toString());
// //               log(snapshot1.data!.docs[0].get("cid"));
// //               log(snapshot1.data!.docs[0].get("paymentstatus"));

// //               // log("image ==" +
// //               //     snapshot.data!.docs[0].get("image")[0].toString());
// //               // log(cid);

// //               // log("message====" + cid);

// //               return Padding(
// //                 padding: const EdgeInsets.all(8.0),
// //                 child: Container(
// //                   decoration: BoxDecoration(
// //                       border:
// //                           Border.all(color: Color(0xFFFF7643).withOpacity(0.5)),
// //                       borderRadius: BorderRadius.circular(15)),
// //                   child: ExpansionTile(
// //                     title: StreamBuilder<QuerySnapshot>(
// //                         stream: FirebaseFirestore.instance
// //                             .collection('products')
// //                             .where('id', isEqualTo: productid)
// //                             .snapshots(),
// //                         builder: (context, snapshot) {
// //                           if (snapshot.connectionState ==
// //                               ConnectionState.waiting) {
// //                             return const Center(
// //                               child: CircularProgressIndicator(),
// //                             );
// //                           } else {
// //                             if (snapshot.error != null) {
// //                               return const Center(
// //                                 child: Text('An error has occured'),
// //                               );
// //                             } else {
// //                               log("data checking .." +
// //                                   snapshot.data!.docs.length.toString());
// //                               log(snapshot.data!.docs[0].get("name"));
// //                               log("image ==" +
// //                                   snapshot.data!.docs[0]
// //                                       .get("image")[0]
// //                                       .toString());
// //                               // log(cid);

// //                               // log("message====" + cid);

// //                               return Container(
// //                                 constraints:
// //                                     const BoxConstraints(maxHeight: 80),
// //                                 width: double.infinity,
// //                                 child: Row(
// //                                   children: [
// //                                     Padding(
// //                                       padding: const EdgeInsets.only(right: 15),
// //                                       child: Container(
// //                                         color: Colors.amber,
// //                                         constraints: const BoxConstraints(
// //                                             maxHeight: 80, maxWidth: 80),
// //                                         child: Image.network(snapshot
// //                                             .data!.docs[0]
// //                                             .get("image")[0]
// //                                             .toString()),
// //                                       ),
// //                                     ),
// //                                     Flexible(
// //                                         child: Column(
// //                                       mainAxisAlignment:
// //                                           MainAxisAlignment.spaceBetween,
// //                                       children: [
// //                                         Text(
// //                                           //"pname",
// //                                           snapshot.data!.docs[0].get("name"),
// //                                           overflow: TextOverflow.ellipsis,
// //                                           maxLines: 2,
// //                                           style: TextStyle(
// //                                               fontSize: 12,
// //                                               color: Colors.grey.shade600,
// //                                               fontWeight: FontWeight.w600),
// //                                         ),
// //                                         Padding(
// //                                           padding: const EdgeInsets.all(8.0),
// //                                           child: Row(
// //                                             mainAxisAlignment:
// //                                                 MainAxisAlignment.spaceBetween,
// //                                             children: [
// //                                               Text(('\$ ') +
// //                                                       (snapshot.data!.docs[0]
// //                                                           .get("price")
// //                                                           .toStringAsFixed(2))
// //                                                   // (order['orderprice'].toStringAsFixed(2))
// //                                                   ),
// //                                               Text(('x ') + (qty)
// //                                                   // (order['orderqty'].toString())
// //                                                   )
// //                                             ],
// //                                           ),
// //                                         )
// //                                       ],
// //                                     ))
// //                                   ],
// //                                 ),
// //                               );
// //                             }
// //                           }
// //                         }),
// //                     subtitle: Row(
// //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                         children: [
// //                           const Text('See More ..'),
// //                           Text("deliverystatus")
// //                           // Text(order['deliverystatus'])
// //                         ]),
// //                     children: [
// //                       StreamBuilder<QuerySnapshot>(
// //                           stream: FirebaseFirestore.instance
// //                               .collection('customers')
// //                               .where('cid',
// //                                   isEqualTo: snapshot1.data!.docs[0].get("cid"))
// //                               .snapshots(),
// //                           builder: (context, snapshot) {
// //                             if (snapshot.connectionState ==
// //                                 ConnectionState.waiting) {
// //                               return const Center(
// //                                 child: CircularProgressIndicator(),
// //                               );
// //                             } else {
// //                               if (snapshot.error != null) {
// //                                 return const Center(
// //                                   child: Text('An error has occured'),
// //                                 );
// //                               } else {
// //                                 // log("cid====" + cid);
// //                                 // log("m2kzymjQF4QumZawfWeQegTB84r1");
// //                                 log("data checking .." +
// //                                     snapshot.data!.docs.length.toString());
// //                                 log(snapshot.data!.docs[0].get("cid"));
// //                                 log(snapshot.data!.docs[0].get("email"));
// //                                 log(snapshot.data!.docs[0].get("phone"));
// //                                 log(snapshot.data!.docs[0].get("address"));

// //                                 // log("image ==" +
// //                                 //     snapshot.data!.docs[0].get("image")[0].toString());

// //                                 return Container(
// //                                   height: 230,
// //                                   width: double.infinity,
// //                                   decoration: BoxDecoration(
// //                                       color: Colors.yellow.withOpacity(0.2),
// //                                       borderRadius: BorderRadius.circular(15)),
// //                                   child: Padding(
// //                                     padding: const EdgeInsets.all(8.0),
// //                                     child: Column(
// //                                         mainAxisAlignment:
// //                                             MainAxisAlignment.spaceAround,
// //                                         crossAxisAlignment:
// //                                             CrossAxisAlignment.start,
// //                                         children: [
// //                                           Text(
// //                                             ('Name: ') +
// //                                                 (snapshot.data!.docs[0]
// //                                                     .get("name")),
// //                                             // +
// //                                             // (order['custname']),
// //                                             style:
// //                                                 const TextStyle(fontSize: 15),
// //                                           ),
// //                                           Text(
// //                                             ('Phone No.: ') +
// //                                                 (snapshot.data!.docs[0]
// //                                                     .get("phone")),
// //                                             //  + (order['phone']),
// //                                             style:
// //                                                 const TextStyle(fontSize: 15),
// //                                           ),
// //                                           Text(
// //                                             ('Email Address: ') +
// //                                                 (snapshot.data!.docs[0]
// //                                                     .get("email")),
// //                                             //  + (order['email']),
// //                                             style:
// //                                                 const TextStyle(fontSize: 15),
// //                                           ),
// //                                           Text(
// //                                             ('Address: ') +
// //                                                 (snapshot.data!.docs[0]
// //                                                     .get("address")),
// //                                             // + (order['address']),
// //                                             style:
// //                                                 const TextStyle(fontSize: 15),
// //                                           ),
// //                                           Row(
// //                                             children: [
// //                                               Text(
// //                                                 ('Payment Status: '),
// //                                                 style: TextStyle(fontSize: 15),
// //                                               ),
// //                                               Text(
// //                                                 // "pstatus",
// //                                                 snapshot1.data!.docs[0]
// //                                                     .get("paymentstatus")
// //                                                     .toString(),
// //                                                 // snapshot.data!.docs[0]
// //                                                 //     .get("paymentstatus"),
// //                                                 // (order['paymentstatus']),
// //                                                 style: const TextStyle(
// //                                                     fontSize: 15,
// //                                                     color: Colors.purple),
// //                                               ),
// //                                             ],
// //                                           ),
// //                                           Row(
// //                                             children: [
// //                                               const Text(
// //                                                 ('Delivery status: '),
// //                                                 style: TextStyle(fontSize: 15),
// //                                               ),
// //                                               Text(
// //                                                 // "dstatus",
// //                                                 deliverystatus.toString(),
// //                                                 // (order['deliverystatus']),
// //                                                 style: const TextStyle(
// //                                                     fontSize: 15,
// //                                                     color: Colors.green),
// //                                               ),
// //                                             ],
// //                                           ),
// //                                           Row(
// //                                             children: [
// //                                               const Text(
// //                                                 ('Order Date: '),
// //                                                 style: TextStyle(fontSize: 15),
// //                                               ),
// //                                               Text(
// //                                                 // '12,22,333',orderdate
// //                                                 (DateFormat('yyyy-MM-dd')
// //                                                     .format(snapshot1
// //                                                         .data!.docs[0]
// //                                                         .get("orderdate")
// //                                                         .toDate())
// //                                                     .toString()),
// //                                                 style: const TextStyle(
// //                                                     fontSize: 15,
// //                                                     color: Colors.green),
// //                                               ),
// //                                             ],
// //                                           ),
// //                                           deliverystatus == 'delivered'
// //                                               ? const Text(
// //                                                   'This order has been alreay delivered')
// //                                               : Row(
// //                                                   children: [
// //                                                     const Text(
// //                                                       ('Change Delivery Status To: '),
// //                                                       style: TextStyle(
// //                                                           fontSize: 15),
// //                                                     ),
// //                                                     deliverystatus ==
// //                                                             'preparing'
// //                                                         ? TextButton(
// //                                                             onPressed: () {
// //                                                               DatePicker.showDatePicker(
// //                                                                   context,
// //                                                                   minTime:
// //                                                                       DateTime
// //                                                                           .now(),
// //                                                                   maxTime: DateTime
// //                                                                           .now()
// //                                                                       .add(const Duration(
// //                                                                           days:
// //                                                                               365)),
// //                                                                   onConfirm:
// //                                                                       (date) async {
// //                                                                 await FirebaseFirestore
// //                                                                     .instance
// //                                                                     .collection(
// //                                                                         'orderdetails')
// //                                                                     .doc(
// //                                                                         orderdetailsid)
// //                                                                     .update({
// //                                                                   'deliverystatus':
// //                                                                       'shipping',
// //                                                                   'deliverydate':
// //                                                                       date,
// //                                                                 });
// //                                                               });
// //                                                             },
// //                                                             child: const Text(
// //                                                                 'shipping ?'))
// //                                                         : TextButton(
// //                                                             onPressed:
// //                                                                 () async {
// //                                                               await FirebaseFirestore
// //                                                                   .instance
// //                                                                   .collection(
// //                                                                       'orderdetails')
// //                                                                   .doc(
// //                                                                       orderdetailsid)
// //                                                                   .update({
// //                                                                 'deliverystatus':
// //                                                                     'delivered',
// //                                                               });
// //                                                             },
// //                                                             child: const Text(
// //                                                                 'delivered ?'))
// //                                                   ],
// //                                                 ),
// //                                         ]),
// //                                   ),
// //                                 );
// //                               }
// //                             }
// //                           })
// //                     ],
// //                   ),
// //                 ),
// //               );
// //             }
// //           }
// //         });
// //   }
// // }































// // // // // import 'dart:developer';

// // // // // import 'package:ecommerce_app/screens/cartprovider.dart';
// // // // // import 'package:ecommerce_app/screens/placeorder.dart';
// // // // // import 'package:flutter/material.dart';
// // // // // import 'package:provider/provider.dart';

// // // // // import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// // // // // class CartScreen extends StatefulWidget {
// // // // //   const CartScreen({
// // // // //     Key? key,
// // // // //   }) : super(key: key);

// // // // //   @override
// // // // //   State<CartScreen> createState() => _CartItemsState();
// // // // // }

// // // // // class _CartItemsState extends State<CartScreen> {
// // // // //   //Cart cart = Cart();
// // // // //   // int _n = 0;
// // // // //   // void add() {
// // // // //   //   setState(() {
// // // // //   //     _n++;
// // // // //   //   });
// // // // //   // }

// // // // //   // void minus() {
// // // // //   // setState(() {
// // // // //   //   if (_n != 0) _n--;
// // // // //   // });
// // // // //   // }

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     double total = context.watch<Cart>().totalPrice;
// // // // //     // log("length ======" + Cart.Addtocart.length.toString());
// // // // //     return Scaffold(
// // // // //       appBar: AppBar(
// // // // //         backgroundColor: Color.fromARGB(255, 30, 114, 106),
// // // // //         title: Text("Cart"),
// // // // //         automaticallyImplyLeading: false,
// // // // //         actions: [
// // // // //           context.watch<Cart>().getItems.isEmpty
// // // // //               ? const SizedBox()
// // // // //               : IconButton(
// // // // //                   onPressed: () {
// // // // //                     log("clicked ===");
// // // // //                     showDialog(
// // // // //                       context: context,
// // // // //                       builder: (ctx) => AlertDialog(
// // // // //                         title: const Text("Clear Cart"),
// // // // //                         content: const Text("do you want to delete"),
// // // // //                         actions: <Widget>[
// // // // //                           TextButton(
// // // // //                             onPressed: () {
// // // // //                               Navigator.of(ctx).pop();
// // // // //                             },
// // // // //                             child: Container(
// // // // //                               color: Color.fromARGB(31, 80, 77, 77),
// // // // //                               padding: const EdgeInsets.all(10),
// // // // //                               child: const Text(
// // // // //                                 "cancel",
// // // // //                                 style: TextStyle(color: Colors.black),
// // // // //                               ),
// // // // //                             ),
// // // // //                           ),
// // // // //                           TextButton(
// // // // //                             onPressed: () {
// // // // //                               context.read<Cart>().clearCart();
// // // // //                             },
// // // // //                             child: Container(
// // // // //                               color: Color.fromARGB(31, 80, 77, 77),
// // // // //                               padding: const EdgeInsets.all(10),
// // // // //                               child: const Text(
// // // // //                                 "Ok",
// // // // //                                 style: TextStyle(color: Colors.black),
// // // // //                               ),
// // // // //                             ),
// // // // //                           ),
// // // // //                         ],
// // // // //                       ),
// // // // //                     );
// // // // //                   },
// // // // //                   icon: Icon(Icons.delete),
// // // // //                 )
// // // // //         ],
// // // // //       ),
// // // // //       body: Padding(
// // // // //           padding: const EdgeInsets.only(bottom: 60),
// // // // //           child: Consumer<Cart>(builder: (context, cart, child) {
// // // // //             return ListView.builder(
// // // // //               itemCount: cart.count,
// // // // //               itemBuilder: (BuildContext context, int index) {
// // // // //                 // final cart = Cart.Addtocart[index];
// // // // //                 final product = cart.getItems[index];
// // // // //                 return Padding(
// // // // //                   padding: const EdgeInsets.all(20),
// // // // //                   child: Container(
// // // // //                     // height: 100,
// // // // //                     width: MediaQuery.of(context).size.width,
// // // // //                     decoration: BoxDecoration(
// // // // //                       color: Colors.white,
// // // // //                       borderRadius: BorderRadius.all(Radius.circular(10)),
// // // // //                     ),
// // // // //                     child: Row(
// // // // //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// // // // //                       children: [
// // // // //                         Padding(
// // // // //                           padding: const EdgeInsets.all(6.0),
// // // // //                           child: Container(
// // // // //                             decoration: BoxDecoration(
// // // // //                                 color: Colors.red,
// // // // //                                 borderRadius:
// // // // //                                     BorderRadius.all(Radius.circular(15)),
// // // // //                                 image: DecorationImage(
// // // // //                                     image: NetworkImage(product.image),
// // // // //                                     fit: BoxFit.cover)),
// // // // //                             height: 100,
// // // // //                             width: 90,
// // // // //                           ),
// // // // //                         ),
// // // // //                         Container(
// // // // //                           child: Column(
// // // // //                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// // // // //                             children: [
// // // // //                               Padding(
// // // // //                                 padding:
// // // // //                                     const EdgeInsets.only(top: 12, left: 5),
// // // // //                                 child: Row(
// // // // //                                   children: [
// // // // //                                     Text(
// // // // //                                       product.name,
// // // // //                                       // cart.name!,
// // // // //                                       // widget.proname,
// // // // //                                       style: TextStyle(
// // // // //                                           fontSize: 20,
// // // // //                                           fontWeight: FontWeight.bold),
// // // // //                                     ),
// // // // //                                     IconButton(
// // // // //                                       onPressed: () {
// // // // //                                         context
// // // // //                                             .read<Cart>()
// // // // //                                             .removeItem(product);
// // // // //                                       },
// // // // //                                       icon: Icon(Icons.cancel),
// // // // //                                     )
// // // // //                                   ],
// // // // //                                 ),
// // // // //                               ),
// // // // //                               Padding(
// // // // //                                 padding: const EdgeInsets.only(
// // // // //                                   right: 120,
// // // // //                                 ),
// // // // //                                 child: Text(product.price.toString()
// // // // //                                     // cart.price.toString()
// // // // //                                     ),
// // // // //                               ),
// // // // //                               Padding(
// // // // //                                 padding: const EdgeInsets.only(
// // // // //                                     top: 15, right: 100, bottom: 30),
// // // // //                                 child: Container(
// // // // //                                   child: new Row(
// // // // //                                     mainAxisAlignment:
// // // // //                                         MainAxisAlignment.spaceEvenly,
// // // // //                                     children: <Widget>[
// // // // //                                       InkWell(
// // // // //                                         onTap: () {
// // // // //                                           // minus();
// // // // //                                           setState(() {
// // // // //                                             if (product.qty != 1) {
// // // // //                                               cart.reduceByOne(product);
// // // // //                                             }
// // // // //                                             // product.qty;
// // // // //                                           });
// // // // //                                           // product.qty == product.qntty
// // // // //                                           //     ? null
// // // // //                                           //     : cart.reduceByOne(product);
// // // // //                                         },
// // // // //                                         child: Container(
// // // // //                                           height: 25,
// // // // //                                           width: 25,
// // // // //                                           decoration: BoxDecoration(
// // // // //                                               borderRadius: BorderRadius.all(
// // // // //                                                   Radius.circular(100)),
// // // // //                                               color: Colors.grey.shade300),
// // // // //                                           child: Align(
// // // // //                                             alignment: Alignment.center,
// // // // //                                             child: Icon(
// // // // //                                               FontAwesomeIcons.minus,
// // // // //                                               size: 18,
// // // // //                                               color: Colors.black,
// // // // //                                             ),
// // // // //                                           ),
// // // // //                                         ),
// // // // //                                       ),
// // // // //                                       // new FloatingActionButton(
// // // // //                                       //   onPressed: add,
// // // // //                                       //   child: new Icon(
// // // // //                                       //     Icons.add,
// // // // //                                       //     color: Colors.black,
// // // // //                                       //   ),
// // // // //                                       //   backgroundColor: Colors.white,
// // // // //                                       // ),
// // // // //                                       SizedBox(
// // // // //                                         width: 8,
// // // // //                                       ),
// // // // //                                       Text(product.qty.toString(),
// // // // //                                           style: new TextStyle(fontSize: 20.0)),
// // // // //                                       SizedBox(
// // // // //                                         width: 8,
// // // // //                                       ),

// // // // //                                       InkWell(
// // // // //                                         onTap: () {
// // // // //                                           // add();

// // // // //                                           cart.increment(product);
// // // // //                                         },
// // // // //                                         child: Container(
// // // // //                                             height: 25,
// // // // //                                             width: 25,
// // // // //                                             decoration: BoxDecoration(
// // // // //                                                 borderRadius: BorderRadius.all(
// // // // //                                                     Radius.circular(100)),
// // // // //                                                 color:
// // // // //                                                     // Color.fromARGB(255, 30, 114, 106)
// // // // //                                                     Colors.grey.shade300),
// // // // //                                             child: new Icon(Icons.add)),
// // // // //                                       ),
// // // // //                                     ],
// // // // //                                   ),
// // // // //                                 ),
// // // // //                               ),
// // // // //                             ],
// // // // //                           ),
// // // // //                         ),
// // // // //                       ],
// // // // //                     ),
// // // // //                   ),
// // // // //                 );
// // // // //               },
// // // // //             );
// // // // //           })),
// // // // //       bottomSheet: Container(
// // // // //         height: 80,
// // // // //         // color: Colors.amber,
// // // // //         child: Padding(
// // // // //           padding: const EdgeInsets.all(8.0),
// // // // //           child: Row(
// // // // //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // // //             children: [
// // // // //               Container(
// // // // //                 child: Row(
// // // // //                   children: [
// // // // //                     Text("Total:"),
// // // // //                     Text(
// // // // //                       // "1000000000",
// // // // //                       total.toStringAsFixed(2),
// // // // //                       style: const TextStyle(
// // // // //                           fontSize: 15,
// // // // //                           fontFamily: "muli",
// // // // //                           fontWeight: FontWeight.bold,
// // // // //                           color: Colors.red),
// // // // //                     ),
// // // // //                   ],
// // // // //                 ),
// // // // //               ),
// // // // //               ElevatedButton(
// // // // //                   onPressed: () {
// // // // //                     Navigator.push(context,
// // // // //                         MaterialPageRoute(builder: (context) => placeorder()));
// // // // //                   },
// // // // //                   style: ElevatedButton.styleFrom(
// // // // //                     primary: Color.fromARGB(255, 30, 114, 106),
// // // // //                     // padding:
// // // // //                     //     EdgeInsets.symmetric(horizontal: 50, vertical: 20),
// // // // //                     // textStyle:
// // // // //                     //     TextStyle(fontSize: 30, fontWeight: FontWeight.bold)
// // // // //                   ),
// // // // //                   child: Text("checkout"))
// // // // //               //  style:
// // // // //               //         TextStyle(color: Color.fromARGB(255, 30, 114, 106))))
// // // // //             ],
// // // // //           ),
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }


// // // // import 'package:firestore1/shop/screens/payment.dart';
// // // // import 'package:flutter/material.dart';
// // // // import 'package:flutter/src/widgets/container.dart';
// // // // import 'package:flutter/src/widgets/framework.dart';
// // // // import 'package:provider/provider.dart';

// // // // import '../models/cartmodel.dart';

// // // // class placeorder extends StatefulWidget {
// // // //   @override
// // // //   State<placeorder> createState() => _placeorderState();
// // // // }

// // // // class _placeorderState extends State<placeorder> {
// // // //     final TextEditingController nameController = TextEditingController();
// // // //     final TextEditingController phoneController = TextEditingController();
// // // //     final TextEditingController addressController = TextEditingController();

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //         appBar: AppBar(
// // // //           title: Text("PLACE ORDER"),
// // // //           centerTitle: true,
// // // //         ),
// // // //         body: Padding(
// // // //           padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
// // // //           child: ListView(
// // // //             scrollDirection: Axis.vertical,
// // // //             physics: AlwaysScrollableScrollPhysics(),
// // // //             shrinkWrap: true,
// // // //             children: [
// // // //               Container(
// // // //                 child: Column(
// // // //                   children: [
// // // //                      TextField(
// // // //                   controller: nameController,
// // // //                   decoration: const InputDecoration(labelText: 'Name'),
// // // //                 ),
// // // //                 TextField(
// // // //                   keyboardType:
// // // //                       const TextInputType.numberWithOptions(decimal: true),
// // // //                   controller: phoneController,
// // // //                   decoration: const InputDecoration(
// // // //                     labelText: 'phone',
// // // //                   ),
// // // //                 ),
// // // //                 TextField(
// // // //                   // keyboardType:
// // // //                   //     const TextInputType.numberWithOptions(decimal: true),
// // // //                   controller: addressController,
// // // //                   decoration: const InputDecoration(
// // // //                     labelText: 'adress',
// // // //                   ),
// // // //                 ),
// // // //                   ],



// // // //                 ),
// // // //                 height: 200,
// // // //                 // decoration: BoxDecoration(
// // // //                 //   borderRadius: BorderRadius.circular(25),
// // // //                 //   color: Color.fromARGB(255, 238, 230, 230),
              
// // // //                 // ),
// // // //               ),
// // // //               Padding(
// // // //                 padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
// // // //                 child: Container(
// // // //                   // decoration: BoxDecoration(
// // // //                   //   borderRadius: BorderRadius.circular(30),
// // // //                   //   color: Color.fromARGB(255, 238, 230, 230),
                    
// // // //                   // ),
// // // //                   padding: EdgeInsets.all(1),
// // // //                   child: Consumer<Cart>(
// // // //                     builder: (context, cart, child) {
// // // //                       return Container(
// // // //                         height: 500,
// // // //                         child: ListView.builder(
// // // //                             scrollDirection: Axis.vertical,
// // // //                             physics: AlwaysScrollableScrollPhysics(),
// // // //                             padding: EdgeInsets.symmetric(
// // // //                                 vertical: 10.0, horizontal: 8.0),
// // // //                             shrinkWrap: true,
// // // //                             itemCount: cart.count,
// // // //                             itemBuilder: (context, index) {
// // // //                               final product = cart.getItems[index];

// // // //                               return Card(
// // // //                                 color: Colors.blueGrey.shade100,
// // // //                                 elevation: 5.0,
// // // //                                 child: Padding(
// // // //                                   padding: const EdgeInsets.all(4.0),
// // // //                                   child: Row(
// // // //                                     mainAxisAlignment:
// // // //                                         MainAxisAlignment.spaceEvenly,
// // // //                                     mainAxisSize: MainAxisSize.max,
// // // //                                     children: [
// // // //                                       Image(
// // // //                                         height: 80,
// // // //                                         width: 80,
// // // //                                         image: NetworkImage(product.imagesUrl

// // // //                                             //  'https://5.imimg.com/data5/YJ/BO/MY-10973479/mens-designer-casual-shirt-500x500.jpg'
// // // //                                             ),
// // // //                                       ),
// // // //                                       SizedBox(
// // // //                                         width: 130,
// // // //                                         child: Column(
// // // //                                           crossAxisAlignment:
// // // //                                               CrossAxisAlignment.start,
// // // //                                           children: [
// // // //                                             const SizedBox(
// // // //                                               height: 5.0,
// // // //                                             ),
// // // //                                             RichText(
// // // //                                               overflow: TextOverflow.ellipsis,
// // // //                                               maxLines: 1,
// // // //                                               text: TextSpan(
// // // //                                                   style: TextStyle(
// // // //                                                       color: Colors
// // // //                                                           .blueGrey.shade800,
// // // //                                                       fontSize: 16.0),
// // // //                                                   children: [
// // // //                                                     TextSpan(
// // // //                                                         text: '${product.name}',
// // // //                                                         style: const TextStyle(
// // // //                                                             fontWeight:
// // // //                                                                 FontWeight
// // // //                                                                     .bold)),
// // // //                                                   ]),
// // // //                                             ),
// // // //                                             RichText(
// // // //                                               maxLines: 1,
// // // //                                               text: TextSpan(
// // // //                                                   text: '' r"$",
// // // //                                                   style: TextStyle(
// // // //                                                       color: Colors
// // // //                                                           .blueGrey.shade800,
// // // //                                                       fontSize: 16.0),
// // // //                                                   children: [
// // // //                                                     TextSpan(
// // // //                                                         text: (product.price
// // // //                                                             .toString()),
// // // //                                                         style: const TextStyle(
// // // //                                                             fontWeight:
// // // //                                                                 FontWeight
// // // //                                                                     .bold)),
// // // //                                                   ]),
// // // //                                             ),
// // // //                                           ],
// // // //                                         ),
// // // //                                       ),
// // // //                                       SizedBox(
// // // //                                         width: 50,
// // // //                                       ),
// // // //                                       RichText(
// // // //                                         maxLines: 1,
// // // //                                         text: TextSpan(
// // // //                                             text: '' r"x ",
// // // //                                             style: TextStyle(
// // // //                                                 color: Colors.blueGrey.shade800,
// // // //                                                 fontSize: 16.0),
// // // //                                             children: [
// // // //                                               TextSpan(
// // // //                                                   text:
// // // //                                                       (product.qty.toString()),
// // // //                                                   style: const TextStyle(
// // // //                                                       fontWeight:
// // // //                                                           FontWeight.bold)),
// // // //                                             ]),
// // // //                                       ),
// // // //                                     ],
// // // //                                   ),
// // // //                                 ),
// // // //                               );
// // // //                             }),
// // // //                       );
// // // //                     },
// // // //                   ),
// // // //                 ),
// // // //               ),
// // // //             ],
// // // //           ),
// // // //         ),
// // // //         bottomSheet: Consumer<Cart>(builder: (context, cart, child) {
// // // //           return Container(
// // // //               // decoration: BoxDecoration(
// // // //               //   borderRadius: BorderRadius.circular(12),
// // // //               //   color: Color.fromARGB(255, 238, 235, 235),
// // // //               // ),
// // // //               height: 90,
// // // //               width: 400,
// // // //               child:
// // // //                   Row(mainAxisAlignment: MainAxisAlignment.center, children: [
// // // //                 Column(children: [
// // // //                   Padding(padding: EdgeInsets.all(1)),
// // // //                   // Text(
// // // //                   //   'Total:',
// // // //                   //   style: TextStyle(
// // // //                   //       fontSize: 20,
// // // //                   //       fontWeight: FontWeight.bold,
// // // //                   //       fontStyle: FontStyle.italic),
// // // //                   // ),
// // // //                   // Text(
// // // //                   //   '₹${cart.totalPrice}',
// // // //                   //   style: TextStyle(
// // // //                   //       fontSize: 25,
// // // //                   //       fontWeight: FontWeight.bold,
// // // //                   //       fontStyle: FontStyle.normal),
// // // //                   // ),
// // // //                   Padding(
// // // //                     padding: EdgeInsets.all(5.0),
// // // //                   ),
// // // //                 ]),
// // // //                 Padding(
// // // //                   padding: EdgeInsets.all(5),
// // // //                   child: Container(
// // // //                     // color: Colors.red,
// // // //                     height: 50,
// // // //                     width: 350,
// // // //                     child: ElevatedButton(
// // // //                       style: ElevatedButton.styleFrom(),
// // // //                       //color: product.color,
// // // //                       onPressed: () {
// // // //                           Navigator.push(
// // // //                     context,
// // // //                     MaterialPageRoute(builder: (context) => payment())
                    
// // // //                     );
// // // //                       },
// // // //                       child: Text(
// // // //                         'CONFIRM ${cart.totalPrice}',
// // // //                         style: TextStyle(
// // // //                             fontSize: 20,
// // // //                             fontWeight: FontWeight.bold,
// // // //                             fontStyle: FontStyle.italic),
// // // //                       ),
// // // //                     ),
// // // //                   ),
// // // //                 ),
// // // //               ]));
// // // //         }));
// // // //   }
// // // // }






// //  body: Padding(
// //           padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
// //           child: StreamBuilder(
// //             stream: FirebaseFirestore.instance
// //                 .collection('order details')
// //                 // .where("orderid", isEqualTo: orderid)
// //                 // .collection("orders")
// //                 .snapshots(),
// //             builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
// //               if (streamSnapshot.hasData) {
// //                 return ListView.builder(
// //                   itemCount: streamSnapshot.data!.docs.length,
// //                   itemBuilder: (context, index) {
// //                     log("length ===" +
// //                         streamSnapshot.data!.docs.length.toString());
// //                     final DocumentSnapshot documentSnapshot =
// //                         streamSnapshot.data!.docs[index];
// //                     //  orderid = documentSnapshot['order id'];
// //                     // var doc_id2 =
// //                     //     documentSnapshot.data.docs[index].reference.id;
// //                     // final docId = _orders.doc().id;
// //                     // log("docuiddd=====" + docId);

// //                     return Container(
// //                       decoration: BoxDecoration(
// //                           border: Border.all(width: 1, color: Colors.brown),
// //                           borderRadius: BorderRadius.circular(6),
// //                           color: Color(0xFFFFFFFF)),
// //                       child: ExpansionTile(

// //                         title: StreamBuilder<QuerySnapshot>(
// //                             stream: FirebaseFirestore.instance
// //                                 .collection('products')
// //                                 .where('proid',
// //                                     isEqualTo: documentSnapshot['product id'])
// //                                 .snapshots(),
// //                             builder: (context, snapshot) {
// //                               if (snapshot.connectionState ==
// //                                   ConnectionState.waiting) {
// //                                 return const Center(
// //                                   child: CircularProgressIndicator(),
// //                                 );
// //                               } else {
// //                                 if (snapshot.error != null) {
// //                                   return const Center(
// //                                     child: Text('An error has occured'),
// //                                   );
// //                                 } else {
// //                                   log("data checking .." +
// //                                       snapshot.data!.docs.length.toString());
// //                                   log(snapshot.data!.docs[0].get("proname"));
// //                                   log(snapshot.data!.docs[0].get("image"));
// //                                   log(snapshot.data!.docs[0]
// //                                       .get("price")
// //                                       .toString());

// //                                   // log("image ==" +
// //                                   //     snapshot.data!.docs[0]
// //                                   //         .get("image")[0]
// //                                   //         .toString());
// //                                   // log(cid);

// //                                   // log("message====" + cid);

// //                                   return Container(
// //                                     constraints:
// //                                         const BoxConstraints(maxHeight: 80),
// //                                     width: double.infinity,
// //                                     child: Row(
// //                                       children: [
// //                                         Padding(
// //                                           padding: const EdgeInsets.only(
// //                                               right: 15),
// //                                           child: Container(
// //                                             color: Colors.amber,
// //                                             constraints: const BoxConstraints(
// //                                                 maxHeight: 80, maxWidth: 80),
// //                                             child: Image.network(snapshot
// //                                                 .data!.docs[0]
// //                                                 .get("image")),
// //                                           ),
// //                                         ),
// //                                         Flexible(
// //                                             child: Column(
// //                                           mainAxisAlignment:
// //                                               MainAxisAlignment.spaceBetween,
// //                                           children: [
// //                                             Text(
// //                                               //"pname",
// //                                               snapshot.data!.docs[0]
// //                                                   .get("proname"),
// //                                               overflow: TextOverflow.ellipsis,
// //                                               maxLines: 2,
// //                                               style: TextStyle(
// //                                                   fontSize: 12,
// //                                                   color: Colors.grey.shade600,
// //                                                   fontWeight:
// //                                                       FontWeight.w600),
// //                                             ),
// //                                             Padding(
// //                                               padding:
// //                                                   const EdgeInsets.all(8.0),
// //                                               child: Row(
// //                                                 mainAxisAlignment:
// //                                                     MainAxisAlignment
// //                                                         .spaceBetween,
// //                                                 children: [
// //                                                   Text(('\$ ') +
// //                                                           (snapshot
// //                                                               .data!.docs[0]
// //                                                               .get("price")
// //                                                               .toStringAsFixed(
// //                                                                   2)
// //                                                               .toString())
// //                                                       // (order['orderprice'].toStringAsFixed(2))
// //                                                       ),
// //                                                   Text(('x ') +
// //                                                           (documentSnapshot[
// //                                                                   'orderqty']
// //                                                               .toString())
// //                                                       // (order['orderqty'].toString())
// //                                                       )
// //                                                 ],
// //                                               ),
// //                                             )
// //                                           ],
// //                                         ))
// //                                       ],
// //                                     ),
// //                                   );
// //                                 }
// //                               }
// //                             }),
// //                         children: <Widget>[
// //                           Text("ORDER DETAILS"),
// //                           StreamBuilder(
// //                               stream: _orders
// //                                   .where("order id",
// //                                       isEqualTo: documentSnapshot['order id'])
// //                                   .snapshots(),
// //                               builder: (context,
// //                                   AsyncSnapshot<QuerySnapshot>
// //                                       streamSnapshot2) {
// //                                 if (streamSnapshot2.hasData) {
// //                                   log("message2222==" +
// //                                       streamSnapshot2.data!.docs.length
// //                                           .toString());
// //                                   return Container(
// //                                     height: 200,
// //                                     width: 400,
// //                                     decoration: BoxDecoration(
// //                                       borderRadius: BorderRadius.all(
// //                                           Radius.circular(10.0)),
// //                                     ),
// //                                     child: ListView.builder(
// //                                       itemCount:
// //                                           streamSnapshot2.data!.docs.length,
// //                                       itemBuilder:
// //                                           (BuildContext context, int index) {
// //                                         final DocumentSnapshot
// //                                             documentSnapshot2 =
// //                                             streamSnapshot2.data!.docs[index];
// //                                         return Card(
// //                                           color: Colors.blue.shade50,
// //                                           child: Column(
// //                                             crossAxisAlignment:
// //                                                 CrossAxisAlignment.start,
// //                                             children: [
// //                                               SizedBox(
// //                                                 height: 7,
// //                                               ),
// //                                               Text(
// //                                                 // "",
// //                                                 'Name :${documentSnapshot2['name']}',
// //                                                 style: TextStyle(
// //                                                     fontStyle:
// //                                                         FontStyle.italic,
// //                                                     fontSize: 16),
// //                                               ),
// //                                               SizedBox(
// //                                                 height: 7,
// //                                               ),
// //                                               Text(
// //                                                 // "",
// //                                                 'Phone :${documentSnapshot2['phone']}',
// //                                                 style: TextStyle(
// //                                                     fontStyle:
// //                                                         FontStyle.italic,
// //                                                     fontSize: 16),
// //                                               ),
// //                                               SizedBox(
// //                                                 height: 7,
// //                                               ),
// //                                               Text(
// //                                                 //  "",
// //                                                 'Address :${documentSnapshot2['address']}',
// //                                                 style: TextStyle(
// //                                                     fontStyle:
// //                                                         FontStyle.italic,
// //                                                     fontSize: 16),
// //                                               ),
// //                                               SizedBox(
// //                                                 height: 7,
// //                                               ),
// //                                               Text(
// //                                                 // "",
// //                                                 'Paymentstatus :${documentSnapshot2['paymentstatus']}',
// //                                                 style: TextStyle(
// //                                                   fontStyle: FontStyle.italic,
// //                                                   fontSize: 16,
// //                                                 ),
// //                                               ),
// //                                               SizedBox(
// //                                                 height: 7,
// //                                               ),
// //                                               Text(
// //                                                 //  "",
// //                                                 'Deliverystatus :${documentSnapshot2['deliverystatus']}',
// //                                                 style: TextStyle(
// //                                                     fontStyle:
// //                                                         FontStyle.italic,
// //                                                     fontSize: 16),
// //                                               ),
// //                                               SizedBox(
// //                                                 height: 7,
// //                                               ),
// //                                               Text(
// //                                                 // "",
// //                                                 'Order Date :${documentSnapshot2['orderdate']}',
// //                                                 style: TextStyle(
// //                                                     fontStyle:
// //                                                         FontStyle.italic,
// //                                                     fontSize: 16),
// //                                               ),
// //                                             ],
// //                                           ),
// //                                         );
// //                                       },
// //                                     ),
// //                                   );
// //                                 }
// //                                 return Text("");
// //                               })
// //                         ],
// //                       ),
// //                     );
// //                   },
// //                 );
// //               }

// //               return const Center(
// //                 child: CircularProgressIndicator(),
// //               );
// //             },
// //           ))







// Sameena Thasni
// 1:08 PM (2 hours ago)
// to me

// import 'dart:developer';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ecommerce/constants.dart';
// import 'package:ecommerce/models/view_order_product.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class CustomerOrderModel extends StatefulWidget {
//   final dynamic order, orderid;
//   CustomerOrderModel({
//     Key? key,
//     required this.order,
//     required this.orderid,
//   }) : super(key: key);

//   @override
//   State<CustomerOrderModel> createState() => _CustomerOrderModelState();
// }

// class _CustomerOrderModelState extends State<CustomerOrderModel> {
//   bool _hasBeenPressed = true;

//   var productName;

//   var proimage;

//   var proprice;

//   var proid;

//   @override
//   Widget build(BuildContext context) {
//     log("order id===" + widget.orderid);
//     // log("productsid -===----" + widget.productsid);
//     Timestamp t = widget.order['orderdate'];
//     DateTime d = t.toDate();
//     print(d.toString());
//     // var query = FirebaseFirestore.instance
//     //     .collection('orderdetails')
//     //     .where('orderid', isEqualTo: widget.orderid)
//     //     .limit(1);
//     // Stream<QuerySnapshot> snapshot1 = query.snapshots();
//     // log("message-----");
//     // // log("proid=====" + proid.toString());
//     // snapshot1.forEach((field) {
//     //   field.docs.asMap().forEach((index, data) async {
//     //     proid = field.docs[index]["proid"];
//     //     log(" iiiiiiiiiiiiiiiiiiiiiiiiiii ===" + proid);
//     //     // setState(() {
//     //     //   productName = field.docs[index]["name"];
//     //     //   proimage = field.docs[index]['image'][0];
//     //     //   proprice = field.docs[index]['price'];
//     //     //   print("Customer ID =" + field.docs[index].id);

//     //     //   print("productName=================" + productName);
//     //     // });

//     //     //IF I PRINT HERE, IT SHOWS THE PRODUCTS.

//     //     //.............................................
//     //     //  setState(() {
//     //     //           _hasBeenPressed = !_hasBeenPressed;
//     //     //         })
//     //     //.....................................................
//     //   });
//     // });
//     print("rrrrrrrrrrrrrrrrrrrrrr");
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         decoration: BoxDecoration(
//             border: Border.all(color: Color(0xFFFF7643).withOpacity(0.50)),
//             borderRadius: BorderRadius.circular(15)),
//         child: ExpansionTile(
//           title: Container(
//             constraints: const BoxConstraints(maxHeight: 90),
//             width: double.infinity,
//             child: Row(
//               children: [
//                 // Padding(
//                 //   padding: const EdgeInsets.only(right: 15),
//                 //   child: Container(
//                 //     decoration: BoxDecoration(
//                 //       borderRadius: BorderRadius.circular(10),
//                 //       color: Colors.amber,
//                 //       // image: DecorationImage(
//                 //       //     image: NetworkImage(order['orderimage']),
//                 //       //     fit: BoxFit.cover)
//                 //     ),
//                 //     constraints:
//                 //         const BoxConstraints(maxHeight: 80, maxWidth: 80),
//                 //     // child: Image.network(order['orderimage']),
//                 //   ),
//                 // ),

//                 Flexible(
//                     child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       d.toString(),
//                       overflow: TextOverflow.ellipsis,
//                       maxLines: 2,
//                       style: TextStyle(
//                           fontSize: 16,
//                           fontFamily: 'muli',
//                           color: Colors.grey.shade600,
//                           fontWeight: FontWeight.w700),
//                     ),
//                     Text(widget.order['granttotal'].toString()),
//                     Row(
//                       children: [
//                         const Text(
//                           ('Payment Status: '),
//                           style: TextStyle(fontSize: 15, fontFamily: 'muli'),
//                         ),
//                         Text(
//                           (widget.order['paymentstatus']),
//                           style: const TextStyle(
//                               fontFamily: 'muli',
//                               fontSize: 15,
//                               color: Colors.grey),
//                         ),
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         const Text(
//                           ('Delivery status: '),
//                           style: TextStyle(fontSize: 15, fontFamily: 'muli'),
//                         ),
//                         Text(
//                           (widget.order['deliverystatus']),
//                           style: const TextStyle(
//                               fontFamily: 'muli',
//                               fontSize: 15,
//                               color: Colors.green),
//                         ),
//                       ],
//                     ),

//                     // Text(order['granttotal'].toString()),
//                     // Text(order['granttotal'].toString())
//                   ],
//                 ))
//               ],
//             ),
//           ),
//           subtitle: _hasBeenPressed
//               ? Text(
//                   "Seen More ...",
//                   style: TextStyle(fontFamily: 'muli'),
//                 )
//               : Text(
//                   'See less ..',
//                   style: TextStyle(fontFamily: 'muli'),
//                 ),
//           //  const Text(
//           //   // 'See More ..',
//           //   //  _hasBeenPressed ? 'See More ...' :'',
//           //   style: TextStyle(fontFamily: 'muli'),
//           // ),

//           children: [
//             StreamBuilder<QuerySnapshot>(
//                 stream: FirebaseFirestore.instance
//                     .collection('orderdetails')
//                     .where('orderid', isEqualTo: widget.orderid)
//                     // .limit(1)
//                     .snapshots(),
//                 builder: (BuildContext context,
//                     AsyncSnapshot<QuerySnapshot> snapshot) {
//                   // var productId = snapshot.data!.docs.length;
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     // log("productid inside listview -" + proid);
//                     log("sssbbsss");
//                     return const Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   }

//                   log("ssssss");
//                   if (snapshot.hasError) {
//                     return const Text('Something went wrong');
//                   }

//                   log("snapshot length in order model =====${snapshot.data!.docs.length}");

//                   if (snapshot.data!.docs.isEmpty) {
//                     log("sssswwss");

//                     return Text("EMPTY");
//                   }

//                   return Container(
//                       height: 230,
//                       width: double.infinity,
//                       // decoration: BoxDecoration(
//                       //     color: widget.order['deliverystatus'] == 'delivered'
//                       //         ? Colors.brown.withOpacity(0.2)
//                       //         : Colors.yellow.withOpacity(0.2),
//                       //     borderRadius: BorderRadius.circular(15)),
//                       child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: ListView.builder(
//                               itemCount: snapshot.data!.docs.length,
//                               itemBuilder: (context, index) {
//                                 log("message ===" +
//                                     snapshot.data!.docs.length.toString());
//                                 widget.order['deliverystatus'] == 'shipping'
//                                     ? Text(
//                                         ('Estimated Delivey Date: ') +
//                                             (DateFormat('yyyy-MM-dd').format(
//                                                     widget.order['deliverydate']
//                                                         .toDate()))
//                                                 .toString(),
//                                         style: const TextStyle(
//                                             fontFamily: 'muli',
//                                             fontSize: 15,
//                                             color: Colors.blue),
//                                       )
//                                     : const Text('');
//                                 widget.order['deliverystatus'] == 'delivered' &&
//                                         widget.order['orderreview'] == true
//                                     ? Row(
//                                         children: const [
//                                           Icon(
//                                             Icons.check,
//                                             color: Colors.blue,
//                                           ),
//                                           Text(
//                                             'Review Added',
//                                             style: TextStyle(
//                                                 fontFamily: 'muli',
//                                                 color: Colors.blue,
//                                                 fontStyle: FontStyle.italic),
//                                           )
//                                         ],
//                                       )
//                                     : const Text('');
//                                 var proid = snapshot.data!.docs[index]['proid'];
//                                 log("productid ====" + proid);
//                                 return
//                                     // Text("data");
//                                     ViewOrderDetails(
//                                   productid: proid,
//                                   order: widget.order,
//                                 );
//                               })));