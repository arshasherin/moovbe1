import 'dart:developer';

import 'package:droppp_flutter/cart.dart';
import 'package:droppp_flutter/cart.dart';
import 'package:droppp_flutter/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import 'cart.dart';
import 'cart.dart';
import 'cart.dart';
import 'cart.dart';
import 'cart.dart';
import 'cart.dart';
import 'cart.dart';
import 'modelw.dart';

class wishlist extends StatefulWidget {
  const wishlist({Key? key}) : super(key: key);

  @override
  State<wishlist> createState() => _wishlistState();
}

class _wishlistState extends State<wishlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("wishlist "),
        actions: [
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                // context.read<Cart>().clearCart();
                showDeleteDialog(context);
              })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 60),
        child: Consumer<Wishlist>(
          builder: (context, wishlist, child) {
            return ListView.builder(
              itemCount: wishlist.count,
              itemBuilder: (BuildContext context, int index) {
                // final cart = Cart.Addtocart[index];
                final product = wishlist.getItems[index];
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    // height: 100,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 12, left: 9),
                                child: Row(
                                  children: [
                                    Text(
                                      product.name,
                                      style: TextStyle(
                                          fontSize: 23,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Consumer<Cart>(
                                        builder: (context, cart, child) {
                                      return IconButton(
                                        icon: Icon(Icons.shopping_cart),
                                        onPressed: () {
                                          if (cart.isItemExist(product.proId)) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    duration: Duration(
                                                        milliseconds: 30),
                                                    behavior: SnackBarBehavior
                                                        .floating,
                                                    backgroundColor:
                                                        Color.fromARGB(
                                                            255, 174, 166, 166),
                                                    content: Text(
                                                      'ITEM ALREADY IN CART',
                                                      textAlign:
                                                          TextAlign.center,
                                                    )));

                                            log("item already in cart");
                                          } else {
                                            context.read<Cart>().addItem(
                                                product.name,
                                                product.price,
                                                1,
                                                product.imagesUrl,
                                                product.proId);
                                          }
                                        },
                                      );
                                    }),
                                    IconButton(
                                      icon: Icon(Icons.cancel),
                                      onPressed: () {
                                        // context
                                        //     .read<Cart>()
                                        //     .removeItem(product);

                                        showDeleteDialog(context);
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
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
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
                  context.read<Wishlist>().clearCart();
                  Navigator.of(context).pop(true);
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
