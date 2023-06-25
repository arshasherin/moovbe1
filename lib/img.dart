import 'dart:developer';

import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:droppp_flutter/addtocart.dart';
import 'package:droppp_flutter/cart.dart';
import 'package:droppp_flutter/modelw.dart';
import 'package:droppp_flutter/wishlist.dart';
import 'package:droppp_flutter/wishlist.dart';
import 'package:droppp_flutter/wishlist.dart';
import 'package:droppp_flutter/wishlist.dart';
import 'package:droppp_flutter/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import 'wishlist.dart';

class image extends StatefulWidget {
  String proname, image1, description, proId;
  double price;
  image({
    required this.proname,
    required this.price,
    required this.image1,
    required this.description,
    required this.proId,
  });

  @override
  State<image> createState() => _imageState();
}

class _imageState extends State<image> {
  var selected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Container(
              height: 250,
              color: Colors.blueGrey,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 220),
              child: Container(
                height: 500,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 70, left: 30),
                child: Text(
                  widget.proname,
                  // 'Frock',
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                )),
            Padding(
                padding: EdgeInsets.only(left: 30, top: 120),
                child: Text(
                  // {widget.price},
                  '₹${widget.price}',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                )),
            Consumer<Wishlist>(builder: (context, wishlist, child) {
              return Padding(
                padding: const EdgeInsets.only(left: 30, top: 250),
                child: IconButton(
                    onPressed: (() {
                      if (wishlist.isItemExist(widget.proId)) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            duration: Duration(milliseconds: 30),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Color.fromARGB(255, 174, 166, 166),
                            content: Text(
                              'ITEM ALREADY IN WISHLIST',
                              textAlign: TextAlign.center,
                            )));

                        log("item already in WISHLIST");
                      } else {
                        context.read<Wishlist>().addItem(widget.proname,
                            widget.price, 1, widget.image1, widget.proId);
                      }

                      setState(() {
                        selected = !selected;
                      });
                    }),
                    icon: Icon(
                      selected ? Icons.favorite_border_rounded : Icons.favorite,
                      color: Colors.red,
                    )),
              );
            }),

            Padding(
                padding: EdgeInsets.only(left: 10, top: 340),
                child: Text(
                  widget.description,
                  // 'Party wear frocks&Dresses Girls Long Frock,Size:24-35 and 36-34',
                  style: TextStyle(
                      fontSize: 17,
                      // fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                )),
            // Padding(
            //     padding: EdgeInsets.only(top: 390, left: 10),
            //     child: Text(
            //       '12 pieces available in stock',
            //       style: TextStyle(
            //           fontSize: 17,
            //           // fontWeight: FontWeight.bold,
            //           fontStyle: FontStyle.italic),
            //     )),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Container(
                  height: 200,
                  // color: Colors.brown,
                  child: Image.network(
                    // "https://assets.stickpng.com/thumbs/580b57fbd9996e24bc43bef3.png",

                    widget.image1,
                    height: 220,
                    width: 200,
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomSheet: Consumer<Cart>(builder: (context, cart, child) {
          return Row(
            children: [
              // Badge(
              //   badgeColor: Colors.red,
              //   badgeContent: Text(
              //     "countshopping_cart ",
              //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Container(
                  //padding: const EdgeInsets.only(left: 20),
                  // margin: EdgeInsets.only(right: 50),
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),

                  child: Badge(
                    animationDuration: Duration(microseconds: 300),
                    animationType: BadgeAnimationType.slide,
                    badgeContent: Text(
                      cart.count.toString(),
                      style: TextStyle(color: Colors.black),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.shopping_cart),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => addtocart()),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 60,
                ),
                child: Container(
                  height: 60,
                  width: 180,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blueGrey,
                        side: BorderSide(width: 3, color: Colors.brown),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    onPressed: () {
                      if (cart.isItemExist(widget.proId)) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            duration: Duration(milliseconds: 60),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Color.fromARGB(255, 174, 166, 166),
                            content: Text(
                              'ITEM ALREADY IN CART',
                              textAlign: TextAlign.center,
                            )));

                        log("item already in cart");
                      } else {
                        context.read<Cart>().addItem(widget.proname,
                            widget.price, 1, widget.image1, widget.proId);
                      }
                    },
                    child: Text(
                      "ADD TO CART".toUpperCase(),
                      style: TextStyle(
                        fontSize: 17,
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ],
          );
        }));
  }
}
