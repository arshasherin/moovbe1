import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:droppp_flutter/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import 'cart.dart';

class payment extends StatefulWidget {
  late String shipping;
  late String Name, phone, address;
  payment({
    required this.shipping,
    required this.Name,
    required this.address,
    required this.phone,

    //  required this.suppId,
  });

//  payment({Key? key, required String shipping}) : super(key: key);

  @override
  State<payment> createState() => _paymentState();
}

enum OS { mac, windows, linux }

CollectionReference _orders =
    FirebaseFirestore.instance.collection('order details');

class _paymentState extends State<payment> {
  // final TextEditingController name = TextEditingController();
  // final TextEditingController phoneController = TextEditingController();
  // final TextEditingController Address = TextEditingController();
  OS? _os = OS.mac;
  double total = 0;
  //razorpay
  String selectedmethod = "";
  late Razorpay _razorpay;
  String PAYMENT_STATUS = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print("Payment Process On response success ${response.paymentId}");

    log("navigate");

    setState(() {
      PAYMENT_STATUS =
          "Payment Success.\n\nYour Payment Id is: ${response.paymentId}";
    });
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print("Payment Process On response Error ${response.message}");
    setState(() {
      PAYMENT_STATUS = "Payment Failed.  ${response.message}";
    });
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print("Payment Process On response Waller ${response.walletName}");

    log("here");

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyHomePage()),
    );
    setState(() {
      PAYMENT_STATUS =
          "Payment Done with wallet information .  ${response.walletName}";
    });
  }

  void createOrder(double total) async {
    CollectionReference orderRef =
        FirebaseFirestore.instance.collection('orders');

    final docId = orderRef.doc().id;
    var date = DateTime.now();
    var formattedDate = "${date.day}-${date.month}-${date.year}";
    print("docId =" + docId);

    await orderRef.doc(docId).set({
      'order id': docId,
      'name': widget.Name,
      'address': widget.address,
      'phone': widget.phone,
      'username': 'arsha',
      'deliverystatus': 'preparing',
      'orderdate': formattedDate,
      'paymentstatus': 'online payment',
      'totalamount': total,
    });
    for (var item in context.read<Cart>().getItems) {
      CollectionReference orderRef =
          FirebaseFirestore.instance.collection('order details');

      // final productId = orderRef.doc().id;
      final order_detailsid = orderRef.doc().id;
      //  print("docId =" + productId);
      // String idd = docId;

      await orderRef.doc().set({
        'orderdetails id': order_detailsid,
        'product id': item.proId,
        'order id': docId,
        // 'itemname': item.name,
        'orderqty': item.qty,
        'orderprice': item.qty * item.price,
        //'deliverystatus': 'preparing',
        'orderdate': formattedDate,
      }).whenComplete(() async {});
    }

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(milliseconds: 800),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Color.fromARGB(255, 174, 166, 166),
        content: Text(
          'PAYMENT SUCCESSFULL',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black),
        )));

    var options = {
      'key': 'YOUR_API_KEY',
      'amount': total * 100,
      'name': 'RRTutors',
      'description': 'Flutter-EBook',
      'prefill': {'contact': '9879879879', 'email': 'test_987@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  @override
  Widget build(BuildContext context) {
    var date = DateTime.now();
    var formattedDate = "${date.day}-${date.month}-${date.year}";

    log(formattedDate);
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            'Payment ',
            style: TextStyle(color: Colors.black),
          ),
          brightness: Brightness.light,
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
            child: Consumer<Cart>(builder: (context, cart, child) {
              total = cart.totalPrice + int.parse(widget.shipping);
              log("total=========" + total.toString());
              return ListView(
                scrollDirection: Axis.vertical,
                physics: AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  Card(
                    color: Colors.blueGrey.shade200,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    elevation: 10,
                    child: Container(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Total price :  ${cart.totalPrice.toString()}",
                            style: TextStyle(
                                fontSize: 16, fontStyle: FontStyle.italic),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "shipping :" + widget.shipping,
                            style: TextStyle(
                                fontSize: 16, fontStyle: FontStyle.italic),
                          ),
                          SizedBox(height: 15),
                          Divider(
                            // height: 50,
                            thickness: 5,
                            // color: Colors.black,
                          ),
                          Text(
                            "Total  :  $total",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.red,
                                fontStyle: FontStyle.italic),
                          ),
                        ],
                      ),
                      height: 150,
                      width: 200,
                      //color: Color(0xFFF5F6F9),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    child: Card(
                      color: Colors.blueGrey.shade200,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      elevation: 10,
                      child: Column(children: [
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          'Payment Types',
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Divider(
                          thickness: 3,
                        ),
                        ListTile(
                            title: const Text('cash on delivery'),
                            leading: Radio<OS>(
                              value: OS.mac,
                              groupValue: _os,
                              onChanged: (OS? value) {
                                setState(() {
                                  selectedmethod = "cashondelivery";
                                  _os = value;
                                });
                              },
                            )),
                        ListTile(
                            title: const Text('pay now'),
                            leading: Radio<OS>(
                              value: OS.windows,
                              groupValue: _os,
                              onChanged: (OS? value) {
                                setState(() {
                                  selectedmethod = "online";
                                  _os = value;
                                });
                              },
                            )),
                        // IconButton(
                        //     onPressed: (() {}),
                        //     icon: Icon(
                        //       Icons.payment,
                        //       color: Colors.orange,
                        //     )),
                      ]),
                    ),
                  )
                ],
              );
            })),
        bottomSheet: Consumer<Cart>(builder: (context, cart, child) {
          return Container(
            color: Colors.grey.shade200,
            height: 100,
            child: Padding(
              padding: EdgeInsets.only(left: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 60,
                    width: 285,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blueGrey,
                            side: BorderSide(width: 3, color: Colors.brown),
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        onPressed: () async {
                          if (selectedmethod == "online") {
                            log("razorpay");
                            createOrder(total);
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyHomePage()),
                            );
                            CollectionReference orderRef =
                                FirebaseFirestore.instance.collection('orders');

                            final docId = orderRef.doc().id;

                            print("docId =" + docId);

                            await orderRef.doc(docId).set({
                              'order id': docId,
                              'name': widget.Name,
                              'address': widget.address,
                              'phone': widget.phone,
                              'username': 'arsha',
                              'deliverystatus': 'preparing',
                              'orderdate': formattedDate,
                              'paymentstatus': 'cash on delivery',
                              'totalamount': total,
                            });
                            for (var item in context.read<Cart>().getItems) {
                              CollectionReference orderRef = FirebaseFirestore
                                  .instance
                                  .collection('order details');

                              // final productId = orderRef.doc().id;
                              final order_detailsid = orderRef.doc().id;
                              //  print("docId =" + productId);
                              // String idd = docId;

                              await orderRef.doc().set({
                                'orderdetails id': order_detailsid,
                                'product id': item.proId,
                                'order id': docId,
                                // 'itemname': item.name,
                                'orderqty': item.qty,
                                'orderprice': item.qty * item.price,
                                //'deliverystatus': 'preparing',
                                'orderdate': formattedDate,
                              }).whenComplete(() async {});
                            }

                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                duration: Duration(milliseconds: 800),
                                behavior: SnackBarBehavior.floating,
                                backgroundColor:
                                    Color.fromARGB(255, 174, 166, 166),
                                content: Text(
                                  'PAYMENT SUCCESSFULL',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.black),
                                )));

                            log("item already in cart");
                            // } else {
                            //   //context.read<Cart>();
                            // }
                          }
                        },
                        child: Text(
                          "Confirm  $total",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        )),
                  ),
                  //Padding(padding: EdgeInsets.all(8))
                ],
              ),
            ),
          );
        }));
  }
}
