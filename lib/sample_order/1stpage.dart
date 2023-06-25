import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:droppp_flutter/sample_order/2ndpage.dart';

import 'package:flutter/material.dart';

class CustomerOrders extends StatefulWidget {
  CustomerOrders({Key? key}) : super(key: key);

  @override
  State<CustomerOrders> createState() => _CustomerOrdersState();
}

class _CustomerOrdersState extends State<CustomerOrders> {
//   Future<List<DocumentSnapshot>> getProduceID() async {
//     var data = await FirebaseFirestore.instance
//         .collection('customers')
//         .doc(FirebaseAuth.instance.currentUser!.uid)
//         .collection('orders')
//         .get();
//     var productId = data.docs;
//     log('product info ====' + productId.toString());

// //     var products;
// //   getProduceID().then((data){
// //   for(int i = 0; i < s.length; i++) {
// //     products = Firestore.instance.collection('products')
// //         .document(data[i]['productID'])
// //         .snapshots();
// //     if (products != null) {
// //       products.forEach((product) {
// //         print(product.data.values);
// //       });
// //     }
// //   }
// // });
//     return productId;
//   }

// Future<List<DocumentSnapshot>> getSeedID() async{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          //  const AppBarBackButton(),
          title: Text(
            "Orders",
            style: TextStyle(
                fontSize: 22, color: Colors.black, fontFamily: 'muli'),
          )
          // const AppBarTitle(
          //   title: 'Orders',
          // ),
          ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('orders')
            // .where('cid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          // var productId = snapshot.data;

          // log('=====' + productId.toString());

          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            // log("length" + snapshot.data!.docs.length.toString());
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.data!.docs.isEmpty) {
            //      var query =   FirebaseFirestore.instance
            //         .collection('orders').where('', isEqualTo:  ).limit(1);
            // Stream<QuerySnapshot> snapshot =  query.snapshots();
            //       snapshot.forEach((field) {
            //   field.docs.asMap().forEach((index, data) async {
            //     var productName = field.docs[index]["email"];

            //     print("Customer ID =" + field.docs[index].id);

            //   });
            // });
            return const Center(
                child: Text(
              'You Have not \n\n Active Orders !',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 26,
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'muli',
                  letterSpacing: 1.5),
            ));
          }
          // log("length" + snapshot.data!.docs.length.toString());
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var order = snapshot.data?.docs[index];
                // log(order!['name']);
                var orderid = order!.id;

                // var query = FirebaseFirestore.instance
                //     .collection('orderdetails')
                //     .where('orderid', isEqualTo: order.id)
                //     .limit(1);
                // Stream<QuerySnapshot> snapshot1 = query.snapshots();
                // log("message-----");
                // // log("proid=====" + proid.toString());
                // snapshot1.forEach((field) {
                //   field.docs.asMap().forEach((index, data) async {
                //     productsid = field.docs[index]["proid"];
                //     log(" inside query ===" + productsid.toString());

                //     //IF I PRINT HERE, IT SHOWS THE PRODUCTS.

                //     //.............................................

                //     //  setState(() {
                //     //           _hasBeenPressed = !_hasBeenPressed;
                //     //         })

                //     //.....................................................
                //   });
                // });
                // log("product id ------" + productsid);
                return CustomerOrderModel(
                  // log("length" + snapshot.data!.docs.length.toString());
                  order: snapshot.data!.docs[index],
                  orderid: orderid,
                  // productsid: productsid,
                );
              });
        },
      ),
    );
  }
}
