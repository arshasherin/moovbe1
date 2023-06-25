import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:droppp_flutter/addtocart.dart';
import 'package:droppp_flutter/img.dart';
import 'package:droppp_flutter/paymenthistory.dart';
import 'package:droppp_flutter/sample_order/1stpage.dart';
import 'package:droppp_flutter/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'login.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

final List<String> imagelist = [
  'http://www.seclob.in/static/media/add2.88a74fd8d1d473a85d6d.png',
  'http://www.seclob.in/static/media/add3.248c5256a21f71716947.png',
  'http://www.seclob.in/static/media/add1.b0b96cb61b60d1afe1a5.png',
  // 'https://cdn.pixabay.com/photo/2017/04/04/18/07/ice-cream-2202561_1280.jpg',
];

class _MyHomePageState extends State<MyHomePage> {
  late SharedPreferences logindata;
  String? email;
  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      email = logindata.getString('email')!;
    });
  }

  // final List<Widget> _children = [

  //   MyHomePage(),
  //   addtocart(),
  //   payment(),
  //   wishlist(),
  // ];
  // var selected = true;
  var selectedCategory, selectedsubCategory;
  var catid = "";
  var subcatid = "";
  final CollectionReference _productss =
      FirebaseFirestore.instance.collection('products');
  // late bool _isloading;

  // @override
  // initstate() {
  //   _isloading = true;
  //   Future.delayed(const Duration(seconds: 2), () {
  //     setState(() {
  //       _isloading = false;
  //     });

  // switch (snapshot.connectionState) {
  //     case ConnectionState.waiting: return new Text('Loading...');
  //     default:
  //       return new ListView(
//           children: snapshot.data.documents.map((DocumentSnapshot document) {
//             return new ListTile(
//               title: new Text(document['title']),
//               subtitle: new Text(document['author']),
//             );
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final screensize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              // colors: <Color>[Colors.black, Colors.blue]),
              colors: [
                Colors.blue,
                Colors.white,
              ],
            ),
          ),
        ),
        // toolbarHeight: 80,
        // backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Home ",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ),
              onPressed: () {
                // context.read<Cart>().clearCart();
                // final shouldDelete = showDeleteDialog(context);
              })
        ],
      ),
      drawer: Drawer(
        child: ListView(children: [
          Padding(padding: EdgeInsets.only(top: 30)),
          ListTile(
            leading: Icon(
              Icons.favorite,
              color: Colors.deepOrange,
            ),
            title: Text(
              "wishlist",
              style: TextStyle(color: Colors.deepOrange),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => wishlist()),
              );
              // setState(() {
              //   selected = !selected;

              // });
            },
          ),
          ListTile(
            leading: Icon(
              Icons.shopping_cart,
              color: Colors.deepOrange,
            ),
            title: Text(
              "cart",
              style: TextStyle(color: Colors.deepOrange),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => addtocart()),
              );
              // setState(() {
              //   selected = !selected;
              // });
            },
          ),
          ListTile(
            leading: Icon(
              Icons.payment,
              color: Colors.deepOrange,
            ),
            title: Text(
              "Payment history",
              style: TextStyle(color: Colors.deepOrange),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CustomerOrders()),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: Colors.deepOrange,
            ),
            title: Text(
              "Logout",
              style: TextStyle(color: Colors.deepOrange),
            ),
            onTap: () {
              logindata.setBool('login', false);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
        ]),
      ),
      // backgroundColor: Colors.white70,
      body:
          // child: new Expanded(

          ListView(children: [
        Container(
            padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
            height: 160,
            child: CarouselSlider.builder(
              unlimitedMode: true,
              viewportFraction: 1,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              scrollPhysics: const BouncingScrollPhysics(),
              enableAutoSlider: true,
              autoSliderTransitionCurve: Curves.decelerate,
              autoSliderDelay: const Duration(seconds: 5),
              autoSliderTransitionTime: const Duration(milliseconds: 1000),
              itemCount: imagelist.length,
              slideBuilder: (index) {
                final image = imagelist[index];

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        image: DecorationImage(
                            image: NetworkImage(imagelist[index]),
                            fit: BoxFit.cover)),
                  ),
                );
              },
              slideTransform: CubeTransform(),
            )),
        StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection("category").snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                const Text("Loading.....");
              else {
                List<DropdownMenuItem<String>> CategoryItems = [];
                for (int i = 0; i < snapshot.data!.docs.length; i++) {
                  DocumentSnapshot snap = snapshot.data!.docs[i];
                  CategoryItems.add(
                    DropdownMenuItem(
                      child: Text(
                        snap.get("items"),
                        style: TextStyle(color: Colors.brown),
                      ),
                      //selected catogery items
                      value: snap.get("items"),
                    ),
                  );
                }
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    DropdownButton(
                      items: CategoryItems,
                      onChanged: (CategoryValue) {
                        final snackBar = SnackBar(
                          content: Text(
                            'Selected Category value is $CategoryValue',
                            style: TextStyle(color: Colors.grey),
                          ),
                        );
                        //Scaffold.of(context).showSnackBar(snackBar);
                        setState(() {
                          selectedCategory = CategoryValue;
                        });

                        print("category======" + CategoryValue.toString());
                        // final snackBar = SnackBar(
                        //   content: Text(
                        //     'Selected main category is $CategoryValue',
                        //     style: TextStyle(
                        //         color: Colors.white),
                        //   ),
                        // );
                        // Scaffold.of(context).showSnackBar(snackBar);
                        setState(() {
                          //catid = "";
                          selectedCategory = null;
                          selectedCategory = CategoryValue;
                          selectedsubCategory = null;
                          print(
                              "selected main data=================================" +
                                  selectedCategory);
                        });

                        var query = FirebaseFirestore.instance
                            .collection('category')
                            .where('items', isEqualTo: CategoryValue)
                            .limit(1);

                        Stream<QuerySnapshot> snapshot = query.snapshots();

                        snapshot.forEach((field) {
                          field.docs.asMap().forEach((index, data) async {
                            setState(() {
                              catid = field.docs[index].id;
                              print("catid====" + catid);
                            });
                            // print("catid 2===" + catid);
                          });
                          // print("cat id 3===" + catid);
                        });

                        // print(
                        //     "outside forEach catid ===" + catid.toString());
                      },
                      value: selectedCategory,
                      isExpanded: false,
                      hint: new Text(
                        "Choose Category Type",
                        style: TextStyle(color: Colors.brown),
                      ),
                    ),
                  ],
                );
              }

              return Text("");
            }),
        SizedBox(
          height: 20,
        ),
        StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("subcategory")
                .where("catid", isEqualTo: catid)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                const Text("Loading.....");
              else {
                List<DropdownMenuItem<String>> subCategoryItems = [];
                for (int i = 0; i < snapshot.data!.docs.length; i++) {
                  DocumentSnapshot snap = snapshot.data!.docs[i];
                  subCategoryItems.add(
                    DropdownMenuItem(
                      child: Text(
                        snap.get("items"),
                        style: TextStyle(color: Colors.brown),
                      ),
                      value: snap.get("items"),
                    ),
                  );
                }
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    DropdownButton(
                      items: subCategoryItems,
                      onChanged: (subCategoryValue) {
                        final snackBar = SnackBar(
                          content: Text(
                            'Selected subcategory value is $subCategoryValue',
                            style: TextStyle(color: Colors.brown),
                          ),
                        );
                        //  Scaffold.of(context).showSnackBar(snackBar);
                        setState(() {
                          //catid = "";
                          //selectedsubCategory = null;
                          selectedsubCategory = subCategoryValue;
                          // selectedCategory = null;
                        });
                        log("subcat id ===" + subcatid);

                        var query = FirebaseFirestore.instance
                            .collection('subcategory')
                            .where('items', isEqualTo: subCategoryValue)
                            .limit(1);

                        Stream<QuerySnapshot> snapshot = query.snapshots();

                        snapshot.forEach((field) {
                          field.docs.asMap().forEach((index, data) async {
                            setState(() {
                              subcatid = field.docs[index].id;
                              print("subcatid====" + subcatid);
                            });
                            // print("catid 2===" + catid);
                          });
                          // print("cat id 3===" + catid);
                        });
                      },
                      value: selectedsubCategory,
                      isExpanded: false,
                      hint: new Text(
                        "Choose subcategory Type",
                        style: TextStyle(color: Colors.brown),
                      ),
                    ),
                  ],
                );
              }
              return Text("");
            }),
        SizedBox(
          height: 30,
        ),
        StreamBuilder(
          stream: _productss
              .where("category", isEqualTo: catid)
              .where("subcategory", isEqualTo: subcatid)
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            switch (streamSnapshot.connectionState) {
              case ConnectionState.waiting:
                return getShimmerLoading();
              default:
                return Container(
                  height: 400,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemCount: streamSnapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final DocumentSnapshot documentSnapshot =
                          streamSnapshot.data!.docs[index];
                      double price = double.parse(
                        documentSnapshot['price'].toString(),
                      );
                      log(documentSnapshot['proid'].toString());
                      return InkWell(
                        onTap: (() {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => image(
                                proname: documentSnapshot['proname'],
                                price: price,
                                image1: documentSnapshot['image'],
                                description: documentSnapshot['description'],
                                proId: documentSnapshot['proid'],
                              ),
                            ),
                          );
                        }),
                        child: Container(
                          height: 300,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: <Widget>[
                              Image.network(
                                '${documentSnapshot['image']}',
                                height: 120,
                                width: 120,
                              ),

                              Text(documentSnapshot['proname']),
                              //Text(documentSnapshot['proid'].toString()),
                              Text(documentSnapshot['price'].toString()),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ]),
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Shimmer getShimmerLoading() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: 100,
            color: Colors.white,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: 100,
            height: 14.0,
            color: Colors.white,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: 100,
            height: 14.0,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      // height: 80,
      // decoration: BoxDecoration(
      //   color: Theme.of(context).primaryColor,
      //   borderRadius: const BorderRadius.only(
      //     topLeft: Radius.circular(20),
      //     topRight: Radius.circular(20),
      //   ),
      // ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  );
                });
              },
              icon: Icon(
                Icons.home_filled,
                color: Colors.black,
                size: 35,
              )
              // : const Icon(
              //     Icons.home_outlined,
              //     color: Colors.white,
              //     size: 35,
              //   ),
              ),
          IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => wishlist()),
                  );
                });
              },
              icon: Icon(
                Icons.favorite,
                color: Colors.black,
                size: 35,
              )
              // : const Icon(
              //     Icons.person,
              //     color: Colors.white,
              //     size: 35,
              //   ),
              ),
          IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => paymenthistory()),
                  // );
                });
              },
              icon: const Icon(
                Icons.payment,
                color: Colors.black,
                size: 35,
              )
              // : const Icon(
              //     Icons.search,
              //     color: Colors.white,
              //     size: 35,
              //   ),
              ),
          IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => wishlist()),
                  // );
                  // pageIndex = 3;
                });
              },
              icon: Icon(
                Icons.logout,
                color: Colors.black,
                size: 35,
              )
              // : const Icon(
              //     Icons.person_outline,
              //     color: Colors.white,
              //     size: 35,
              //   ),
              ),
        ],
      ),
    );
  }
}
