import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/blocs/products_cubit/products_cubit.dart';
import '../../../data/models/home_models.dart';
import '../widgets/products_grid_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: const Text('Home'),
      ),
      body: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          var cubit = ProductsCubit.get(context);
          if (state is ProductsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                    child: CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 2.2,
                    enlargeCenterPage: true,
                  ),
                  items: _imageSliders(cubit.getListOfBanners()),
                )),
                SizedBox(
                    width: double.infinity,
                    height: 150,
                    child:
                        Image.network(cubit.getAdImage(), fit: BoxFit.cover)),
                ProductsGridView(
                  products: cubit.getListOfProducts(),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

List<Widget> _imageSliders(List<Banners> list) {
  return list
      .map((item) => Container(
            child: Container(
              margin: const EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius:
                      const BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.network(item.image,
                          height: 1000, fit: BoxFit.cover, width: 800.0),
                    ],
                  )),
            ),
          ))
      .toList();
}
