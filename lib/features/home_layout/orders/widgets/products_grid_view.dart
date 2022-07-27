import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/blocs/products_cubit/products_cubit.dart';
import '../../../../utils/app_assets.dart';
import '../models/order_product.dart';
import 'order_item.dart';

class OrderProductsGridView extends StatelessWidget {
  const OrderProductsGridView({
    Key? key,
    required this.products,
  }) : super(key: key);
  final List<OrderProduct> products;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsState>(
      listener: (context, state) {
        const Duration duration = Duration(seconds: 1, milliseconds: 500);
        if (state is ProductFavouriteToggle) {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.message),
            duration: duration,
          ));
        } else if (state is ProductCartToggle) {
          ScaffoldMessenger.of(context).clearSnackBars();

          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.message),
            duration: duration,
          ));
        } else if (state is GeneralLoading) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Loading'),
            duration: Duration(seconds: 30),
          ));
        }
      },
      builder: (context, state) {
        var cubit = ProductsCubit.get(context);
        if (state is ProductsLoading) {
          return Container(
            padding: const EdgeInsets.only(top: 50),
            child: const CircularProgressIndicator(),
          );
        }
        return products.isNotEmpty
            ? GridView.builder(
                itemCount: products.length,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    crossAxisSpacing: 1,
                    childAspectRatio: 2.5,
                    mainAxisSpacing: 9),
                itemBuilder: (context, index) {
                  var product = products[index];
                  return OrderItem(
                    product: product,
                  );
                })
            : Center(
                child: Image.asset(AppAssets.notFound),
              );
      },
    );
  }
}
