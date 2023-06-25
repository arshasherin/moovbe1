import 'dart:developer';

import 'package:droppp_flutter/payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'cart.dart';

class checkout extends StatefulWidget {
  const checkout({Key? key}) : super(key: key);

  @override
  State<checkout> createState() => _checkoutState();
}

class _checkoutState extends State<checkout> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // Color.fromARGB(255, 174, 166, 166)
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "Place Order ",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
          child: ListView(
            scrollDirection: Axis.vertical,
            physics: AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              Container(
                child: Column(
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(labelText: 'Name'),
                    ),
                    TextFormField(
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      controller: phoneController,
                      decoration: const InputDecoration(
                        labelText: 'phone',
                      ),
                    ),
                    TextField(
                      // keyboardType:
                      //     const TextInputType.numberWithOptions(decimal: true),
                      controller: addressController,
                      decoration: const InputDecoration(
                        labelText: 'address',
                      ),
                    ),
                  ],
                ),
                height: 200,
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(25),
                //   color: Color.fromARGB(255, 238, 230, 230),

                // ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                child: Container(
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(30),
                  //   color: Color.fromARGB(255, 238, 230, 230),

                  // ),
                  padding: EdgeInsets.all(1),
                  child: Consumer<Cart>(
                    builder: (context, cart, child) {
                      return Container(
                        height: 300,
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            physics: AlwaysScrollableScrollPhysics(),
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 8.0),
                            shrinkWrap: true,
                            itemCount: cart.count,
                            itemBuilder: (context, index) {
                              final product = cart.getItems[index];

                              return Card(
                                color: Color(0xFFF5F6F9),
                                elevation: 5.0,
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Image(
                                        height: 80,
                                        width: 80,
                                        image: NetworkImage(product.imagesUrl

                                            //  'https://5.imimg.com/data5/YJ/BO/MY-10973479/mens-designer-casual-shirt-500x500.jpg'
                                            ),
                                      ),
                                      SizedBox(
                                        width: 130,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 5.0,
                                            ),
                                            RichText(
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              text: TextSpan(
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16.0),
                                                  children: [
                                                    TextSpan(
                                                        text: '${product.name}',
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20)),
                                                  ]),
                                            ),
                                            RichText(
                                              maxLines: 1,
                                              text: TextSpan(
                                                  text: '' r"$",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 18),
                                                  children: [
                                                    TextSpan(
                                                        text: (product.price
                                                            .toString()),
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ]),
                                            ),
                                          ],
                                        ),
                                      ),
                                      // SizedBox(
                                      //   width: 50,
                                      // ),
                                      RichText(
                                        maxLines: 1,
                                        text: TextSpan(
                                            text: '' r"x ",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16.0),
                                            children: [
                                              TextSpan(
                                                  text:
                                                      (product.qty.toString()),
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ]),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomSheet: Consumer<Cart>(builder: (context, cart, child) {
          return Container(
            color: Colors.grey.shade200,
            height: 100,
            //  width: 400,
            child: Padding(
              padding: EdgeInsets.only(left: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    //height: 50,
                    width: 285,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blueGrey, //background color of button
                          side: BorderSide(
                              width: 3,
                              color: Colors.brown), //border width and color
                          elevation: 3, //elevation of button
                          shape: RoundedRectangleBorder(
                              //to set border radius to button
                              borderRadius: BorderRadius.circular(30)),
                          padding: EdgeInsets.all(
                              20), //content padding inside button
                        ),
                        onPressed: () {
                          if (phoneController.text == "" &&
                              nameController.text == "" &&
                              addressController.text == "") {
                            var date = DateTime.now();
                            var formattedDate =
                                "${date.day}-${date.month}-${date.year}";

                            log(formattedDate);
                            log("var myFormat = DateFormat('d-MM-yyyy');");
                          } else {
                            if (phoneController.text.length == 10) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => payment(
                                          shipping: "10",
                                          address: addressController.text,
                                          Name: nameController.text,
                                          phone: phoneController.text,
                                        )),
                              );
                            } else {
                              log("fill 10 digits");
                            }
                          }
                        },
                        child: Text(
                          "Confirm  ${cart.totalPrice.toString()}",
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
