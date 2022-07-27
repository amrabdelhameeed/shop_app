import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/data/models/order.dart';
import '../../../../data/blocs/products_cubit/products_cubit.dart';
import '../../../../data/repositories/home_repo.dart';
import '../../../../data/web_services/web_services.dart';
import 'orders_screen.dart';
import '../widgets/order.dart';

class OrderScreen extends StatelessWidget {
  OrderScreen({Key? key}) : super(key: key);
  List<Order> orders = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductsCubit>(
      create: (context) =>
          ProductsCubit(HomeRepo(), WebServices())..getOrders(),
      child: BlocConsumer<ProductsCubit, ProductsState>(
        listener: (context, state) {
          if (state is GetOrderSuccess) {
            orders = state.orders;
            orders.sort(
              (b, a) => a.status.compareTo(b.status),
            );
          }
          if (state is CancleOrderSuccess) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          var cubit = ProductsCubit.get(context);
          return Scaffold(
            appBar: AppBar(centerTitle: true, title: Text('Orders')),
            body: orders.isNotEmpty
                ? ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return OrderItem(
                          cancleFun: () {
                            cubit.canccleOrder(orders[index].id);
                          },
                          showProducts: () {
                            cubit
                                .getOrderProducts(orders[index].id)
                                .then((value) {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return OrdersScreen(
                                    products: value.orders,
                                  );
                                },
                              ));
                            });
                          },
                          order: orders[index]);
                    },
                    shrinkWrap: true,
                    itemCount: orders.length)
                : SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
