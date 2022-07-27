import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shop_app/data/models/order.dart';
import 'products_grid_view.dart';

class OrderItem extends StatelessWidget {
  const OrderItem(
      {Key? key,
      required this.order,
      required this.showProducts,
      required this.cancleFun})
      : super(key: key);
  final Order order;
  final VoidCallback showProducts;
  final VoidCallback cancleFun;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(3),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(
              width: 1, color: Theme.of(context).textTheme.bodyMedium!.color!),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          AutoSizeText('date : ${order.date}',
              maxFontSize: 35, minFontSize: 25),
          AutoSizeText('cost : ${order.total}',
              maxFontSize: 35, minFontSize: 25),
          AutoSizeText('status : ${order.status}',
              maxFontSize: 35,
              minFontSize: 25,
              style: TextStyle(fontWeight: FontWeight.w400)),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: showProducts,
                child: const Text('show products',
                    style: TextStyle(fontWeight: FontWeight.w400))),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: cancleFun,
                child: const Text('cancle',
                    style: TextStyle(fontWeight: FontWeight.w400))),
          ),
        ],
      ),
    );
  }
}
