class Product {
  String name;
  double price;
  int qty = 1;
  // int qntty;
  String imagesUrl;
  String proId;
  // String suppId;
  Product({
    required this.name,
    required this.price,
    required this.qty,
    // required this.qntty,
    required this.imagesUrl,
    required this.proId,
    //  required this.suppId,
  });
  void increase() {
    qty++;
  }

  void decrease() {
    qty--;
  }
}
