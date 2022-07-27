import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../models/order_product.dart';
import '../widgets/products_grid_view.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key, required this.products}) : super(key: key);
  final List<OrderProduct> products;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Order Product'),
      ),
      body: OrderProductsGridView(products: products),
    );
  }
}
