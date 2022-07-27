import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/blocs/products_cubit/products_cubit.dart';
import '../../utils/app_colors.dart';
import '../../data/models/home_models.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text(product.name)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: product.description,
              child: Center(
                child: Image.network(
                  product.image,
                  height: 400,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    AutoSizeText(
                      'Price : ${product.price.toStringAsFixed(1)} EGP',
                      softWrap: true,
                      maxFontSize: 30,
                      minFontSize: 25,
                      wrapWords: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    product.discount != 0
                        ? AutoSizeText(
                            product.oldPrice.toStringAsFixed(1),
                            softWrap: true,
                            maxFontSize: 15,
                            minFontSize: 10,
                            wrapWords: true,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontWeight: FontWeight.w300,
                                decoration: TextDecoration.lineThrough),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
                BlocBuilder<ProductsCubit, ProductsState>(
                  builder: (context, state) {
                    var cubit = ProductsCubit.get(context);
                    return Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                              onPressed: () {
                                cubit.toggleInFavourite(product);
                              },
                              color: Colors.red,
                              icon: Icon(!product.inFavorites
                                  ? Icons.favorite_outline
                                  : Icons.favorite)),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                              onPressed: () {
                                cubit.toggleInCart(product);
                              },
                              color: AppColors.primary,
                              icon: Icon(product.inCart
                                  ? Icons.shopping_cart
                                  : Icons.shopping_cart_outlined)),
                        ),
                      ],
                    );
                  },
                )
              ],
            ),
            const Divider(
              thickness: 2,
            ),
            Container(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: product.images.length,
                itemBuilder: (context, index) {
                  return Image.network(product.images[index]);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: AutoSizeText(
                product.description,
                maxFontSize: 22,
                minFontSize: 20,
                style: const TextStyle(fontWeight: FontWeight.normal),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
