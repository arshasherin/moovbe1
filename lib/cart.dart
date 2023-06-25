//import 'package:ecommerce/providers/product_class.dart';
import 'dart:developer';

import 'package:droppp_flutter/product.dart';
import 'package:flutter/foundation.dart';

class Cart extends ChangeNotifier {
  final List<Product> _list = [];
  List<Product> get getItems {
    return _list;
  }

  Map<int, Product> _items = {};
  Map<int, Product> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalPrice {
    var total = 0.0;

    for (var item in _list) {
      total += item.price * item.qty;
    }
    return total;
  }

  int? get count {
    return _list.length;
  }

  bool isItemExist(var ProductId) {
    for (int i = 0; i < _list.length; i++) {
      if (_list[i].proId == ProductId) {
        return true;
      }
    }
    return false;
  }

  void addItem(
    String name,
    double price,
    int qty,
    // int qntty,
    String imagesUrl,
    var proId,
  ) {
    _list.add(
      Product(
        name: name.toString(),
        price: price,
        qty: qty,
        imagesUrl: imagesUrl,
        proId: proId.toString(),
        // proId: '',
      ),
    );
    notifyListeners();
  }

  void addItem2(
      String name, double price, int qty, String imagesUrl, String productId) {
//double prdid=double.parse(productId);
    log("idd====" + productId);

    if (_list.contains(productId).toString() == productId) {
      log("alredy     ");
    } else {
      final product = Product(
        name: name,
        price: price,
        qty: qty,
        //qntty: qntty,
        imagesUrl: imagesUrl,
        proId: productId,
        //suppId: suppId
      );
      // _list.add(product(
      //   name:name.toString(),
      //   price:price,
      //   qty:qty,
      //   imagesUrl:imagesUrl,
      //   proId:proId.toString(),
      // ));
      _list.add(product);
      log("new element Added");
    }
    // log(_list.length.toString());
    notifyListeners();
  }

  void increment(Product product) {
    product.increase();
    notifyListeners();
  }

  void reduceByOne(Product product) {
    product.decrease();
    notifyListeners();
  }

  void removeItem(Product product) {
    _list.remove(product);
    notifyListeners();
  }

  void removeIte22m(String productid) {
    log("insideee removeeeeeeee =+" + productid);
    _list.removeWhere((item) => item.proId == productid);
    //_list.removeAt(int.parse(productid));
    notifyListeners();
  }

  void clearCart() {
    _list.clear();
    notifyListeners();
  }
}
