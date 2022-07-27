class OrderProduct {
  late final String name;
  late final num price;
  late final String image;
  OrderProduct.fromJson(Map<String, dynamic> map) {
    name = map['name'];
    price = map['price'];
    image = map['image'];
  }
}

class OrderProductList {
  late final List<OrderProduct> orders;
  OrderProductList.fromJson(Map<String, dynamic> map) {
    orders = List.from(map['data']['products'])
        .map((e) => OrderProduct.fromJson(e))
        .toList();
  }
}
