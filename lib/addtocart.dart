import 'dart:developer';

import 'package:droppp_flutter/placeorder.dart';
import 'package:droppp_flutter/img.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'cart.dart';

class addtocart extends StatefulWidget {
  const addtocart({Key? key}) : super(key: key);

  @override
  State<addtocart> createState() => _addtocartState();
}

class _addtocartState extends State<addtocart> {
  // int _counter = 0;
  Cart? cart;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "Cart ",
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.black,
                ),
                onPressed: () {
                  // context.read<Cart>().clearCart();
                  final shouldDelete = showDeleteDialog(context);
                })
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 60),
          child: Consumer<Cart>(
            builder: (context, cart, child) {
              return ListView.builder(
                itemCount: cart.count,
                itemBuilder: (BuildContext context, int index) {
                  // final cart = Cart.Addtocart[index];
                  final product = cart.getItems[index];
                  return Padding(
                    padding: const EdgeInsets.all(15),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      elevation: 3,

                      // height: 100,
                      // width: MediaQuery.of(context).size.width,
                      // decoration: BoxDecoration(
                      //   color: Colors.white,
                      //   // color: Colors.blue[100],
                      //   borderRadius: BorderRadius.all(Radius.circular(10)),
                      // ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color(0xFFF5F6F9),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    image: DecorationImage(
                                        image: NetworkImage(product.imagesUrl),
                                        fit: BoxFit.cover)),
                                height: 80,
                                width: 80,
                              ),
                            ),
                            Container(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(top: 12, left: 5),
                                    child: Row(
                                      children: [
                                        Text(
                                          product.name,
                                          style: TextStyle(
                                              fontSize: 23,
                                              fontStyle: FontStyle.italic),
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.cancel),
                                          onPressed: () {
                                            log("message===" + product.proId);

                                            // context
                                            //     .read<Cart>()
                                            //     .removeItem(product);

                                            showcancelDialog(
                                                context, product.proId);
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      right: 80,
                                    ),
                                    child: Text(product.price.toString()
                                        // cart.price.toString()
                                        ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15, right: 50, bottom: 30),
                                    child: Container(
                                      child: new Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          InkWell(
                                            onTap: () {
                                              // minus();
                                              setState(() {
                                                if (product.qty != 1) {
                                                  cart.reduceByOne(product);
                                                }
                                                // product.qty;
                                              });
                                              // product.qty == product.qntty
                                              //     ? null
                                              //     : cart.reduceByOne(product);
                                            },
                                            child: Container(
                                              height: 25,
                                              width: 25,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(100)),
                                                  color: Colors.grey.shade300),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Icon(
                                                  FontAwesomeIcons.minus,
                                                  size: 18,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                          // new FloatingActionButton(
                                          //   onPressed: add,
                                          //   child: new Icon(
                                          //     Icons.add,
                                          //     color: Colors.black,
                                          //   ),
                                          //   backgroundColor: Colors.white,
                                          // ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(product.qty.toString(),
                                              style: new TextStyle(
                                                  fontSize: 20.0)),
                                          SizedBox(
                                            width: 8,
                                          ),

                                          InkWell(
                                            onTap: () {
                                              // add();

                                              cart.increment(product);
                                            },
                                            child: Container(
                                                height: 25,
                                                width: 25,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                100)),
                                                    color:
                                                        // Color.fromARGB(255, 30, 114, 106)
                                                        Colors.grey.shade300),
                                                child: new Icon(Icons.add)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
        bottomSheet: Consumer<Cart>(builder: (context, cart, child) {
          //  padding: const EdgeInsets.all(8.0),

          // height: 80,
          //child: Consumer<Cart>(builder: (context, cart, child) {

          // child: Consumer<Cart>(builder: (context, cart, child) {
          return Container(
            color: Colors.grey.shade200,
            height: 100,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Text(
                          "Total:",
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                        Text(
                          //"100",
                          cart.totalPrice.toString(),
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 150,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blueGrey,
                            side: BorderSide(width: 3, color: Colors.brown),
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        onPressed: () {
                          log("message size===" + cart.count.toString());
                          if (cart.count.toString() == "0") {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                duration: Duration(milliseconds: 30),
                                behavior: SnackBarBehavior.floating,
                                backgroundColor:
                                    Color.fromARGB(255, 174, 166, 166),
                                content: Text(
                                  'ADD ITEM IN CART',
                                  textAlign: TextAlign.center,
                                )));
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => checkout()));
                          }
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => checkout()),
                          // );
                        },
                        child: Text(
                          "checkout",
                          style: TextStyle(
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                              color: Colors.black),
                        )),
                  ),
                  //Padding(padding: EdgeInsets.all(8))
                ],
              ),
            ),
          );
        }));
  }

  Future<bool> showDeleteDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('ARE U SURE? '),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                  // context.read<Cart>().clearCart();
                },
                child: const Text("CANCEL"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                  context.read<Cart>().clearCart();
                },
                child: const Text("DELETE"),
              ),
            ],
          );
        }).then((value) {
      if (value is bool) {
        return value;
      } else {
        return false;
      }
    });
  }

  Future<bool> showcancelDialog(BuildContext context, String proid) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('ARE U SURE? '),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                  // context.read<Cart>().clearCart();
                },
                child: const Text("CANCEL"),
              ),
              TextButton(
                onPressed: () {
                  log(proid);

                  ///
                  Navigator.of(context).pop(true);
                  context.read<Cart>().removeIte22m(proid);
                },
                child: const Text("DELETE"),
              ),
            ],
          );
        }).then((value) {
      if (value is bool) {
        return value;
      } else {
        return false;
      }
    });
  }
}
