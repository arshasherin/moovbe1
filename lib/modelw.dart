import 'package:droppp_flutter/product.dart';
import 'package:flutter/cupertino.dart';

class Wishlist extends ChangeNotifier {
  final List<Product> _wishlist = [];
  List<Product> get getItems {
    return _wishlist;
  }

  Map<int, Product> _items = {};
  Map<int, Product> get items {
    return {..._items};
  }

  int? get count {
    return _wishlist.length;
  }

  bool isItemExist(var ProductId) {
    for (int i = 0; i < _wishlist.length; i++) {
      if (_wishlist[i].proId == ProductId) {
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
    _wishlist.add(
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

  void removeItem(Product product) {
    _wishlist.remove(product);
    notifyListeners();
  }

  void clearCart() {
    _wishlist.clear();
    notifyListeners();
  }
}
