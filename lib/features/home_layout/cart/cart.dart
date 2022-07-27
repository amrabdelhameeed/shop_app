import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/blocs/products_cubit/products_cubit.dart';
import '../../../utils/size_config.dart';
import '../widgets/products_grid_view.dart';

class CartAndFavouriteScreen extends StatelessWidget {
  const CartAndFavouriteScreen({Key? key, required this.isCart})
      : super(key: key);
  final bool isCart;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(isCart ? 'Cart' : 'Favourites'),
        centerTitle: true,
      ),
      body: BlocConsumer<ProductsCubit, ProductsState>(
        listener: (context, state) {
          if (state is OrderSuccess) {
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          var cubit = ProductsCubit.get(context);
          var products = cubit
              .getListOfProducts()
              .where(
                  (element) => (isCart ? element.inCart : element.inFavorites))
              .toList();
          if (state is ProductsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SizedBox(
            height: double.infinity,
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      ProductsGridView(products: products),
                      isCart
                          ? const SizedBox(
                              height: 70,
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
                isCart && products.isNotEmpty
                    ? Positioned(
                        width: SizeConfig.screenWidth!,
                        bottom: 0,
                        child: Container(
                          color: Colors.black,
                          height: 50,
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 50,
                                  padding: const EdgeInsets.all(10),
                                  child: Center(
                                    child: AutoSizeText(
                                        'Total : ${products.map((e) => e.price).reduce((value, element) => value + element).toStringAsFixed(1)} EGP',
                                        maxFontSize: 23,
                                        minFontSize: 15,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3!
                                            .copyWith(
                                              color: Colors.white,
                                            )),
                                  ),
                                ),
                                TextButton(
                                    onPressed: () {
                                      cubit.makeAnOrder();
                                    },
                                    child: AutoSizeText(
                                      'Order Now',
                                      maxFontSize: 25,
                                      minFontSize: 20,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline3!
                                          .copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              decoration:
                                                  TextDecoration.underline),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      )
                    : const SizedBox.shrink()
              ],
            ),
          );
        },
      ),
    );
  }
}
/*
Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 50,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: AutoSizeText(
                                    'Total : ${products.map((e) => e.price).reduce((value, element) => value + element).toStringAsFixed(1)} EGP',
                                    maxFontSize: 25,
                                    minFontSize: 20,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline3!
                                        .copyWith(color: Colors.black)),
                              ),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  cubit.makeAnOrder();
                                },
                                child: AutoSizeText(
                                  'Order Now',
                                  maxFontSize: 25,
                                  minFontSize: 20,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3!
                                      .copyWith(color: Colors.white),
                                )),
                          ],
                        )
 */