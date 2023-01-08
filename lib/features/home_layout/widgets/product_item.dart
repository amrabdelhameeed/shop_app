import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../data/models/home_models.dart';
import '../../../utils/app_colors.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
    required this.product,
    required this.toggleFavFun,
    required this.toggleCartFun,
    required this.onTap,
  }) : super(key: key);
  final Product product;
  final VoidCallback toggleFavFun;
  final VoidCallback toggleCartFun;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Hero(
              tag: product.description,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                        image: NetworkImage(product.image),
                        fit: BoxFit.contain)),
                height: double.infinity,
                width: double.infinity,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: const EdgeInsets.only(top: 10, left: 5),
                    decoration: BoxDecoration(
                        color: Colors.red.shade400,
                        borderRadius: BorderRadius.circular(10)),
                    child: product.discount != 0
                        ? Container(
                            padding: const EdgeInsets.all(5),
                            child: AutoSizeText(
                              'Discount',
                              maxFontSize: 15,
                              minFontSize: 10,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.white),
                            ))
                        : const SizedBox.shrink(),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    product.name,
                    maxLines: 2,
                    softWrap: true,
                    maxFontSize: 25,
                    minFontSize: 15,
                    wrapWords: true,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const AutoSizeText(
                            "EGP ",
                            softWrap: true,
                            maxFontSize: 25,
                            minFontSize: 15,
                            wrapWords: true,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          AutoSizeText(
                            product.price.toStringAsFixed(1),
                            softWrap: true,
                            maxFontSize: 30,
                            minFontSize: 16,
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
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                                onPressed: toggleFavFun,
                                color: Colors.red,
                                icon: Icon(!product.inFavorites
                                    ? Icons.favorite_outline
                                    : Icons.favorite)),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                                onPressed: toggleCartFun,
                                color: AppColors.primary,
                                icon: Icon(product.inCart
                                    ? Icons.shopping_cart
                                    : Icons.shopping_cart_outlined)),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
/*
SizedBox(
      height: 250,
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                          image: NetworkImage(product.image),
                          fit: BoxFit.fitHeight)),
                  height: 200,
                  width: double.infinity,
                ),
              ),
              Text(product.name),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(product.price.toString()),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        product.oldPrice.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(decoration: TextDecoration.lineThrough),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                        onPressed: toggleCartFun,
                        icon: Icon(product.inCart
                            ? Icons.shopping_cart
                            : Icons.shopping_cart_outlined)),
                  )
                ],
              )
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                  onPressed: toggleFavFun,
                  icon: Icon(!product.inFavorites
                      ? Icons.favorite_outline
                      : Icons.favorite)),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: const EdgeInsets.only(top: 10, left: 5),
              decoration: BoxDecoration(
                  color: Colors.red.shade400,
                  borderRadius: BorderRadius.circular(10)),
              child: product.discount != 0
                  ? Container(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        'Discount',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontSize: 15, color: Colors.white),
                      ))
                  : const SizedBox.shrink(),
            ),
          )
        ],
      ),
    )
 */