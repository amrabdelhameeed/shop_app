import 'package:equatable/equatable.dart';

import 'home_models.dart';

class Cart extends Equatable {
  const Cart({this.items = const <Product>[]});
  final List<Product> items;
  Map getQurantity(products) {
    Map quantity = {};
    products.forEach((product) {
      if (!quantity.containsKey(quantity)) {
        quantity[product] = 1;
      } else {
        quantity[product] += 1;
      }
    });
    return quantity;
  }

  double get totalCost => items.fold<double>(
      0, (previousValue, element) => previousValue + element.price.toDouble());
  static List<Product> prod = [
    Product(
        id: 0,
        price: 10,
        oldPrice: 20,
        discount: 20,
        image: '',
        name: '1',
        description: ' description',
        images: const [],
        inFavorites: false,
        inCart: false),
    Product(
        id: 1,
        price: 10,
        oldPrice: 20,
        discount: 20,
        image: '',
        name: '2',
        description: ' description',
        images: const [],
        inFavorites: false,
        inCart: false)
  ];
  @override
  List<Object?> get props => [items];
}
