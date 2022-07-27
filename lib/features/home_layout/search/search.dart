import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/blocs/products_cubit/products_cubit.dart';
import '../../../data/models/home_models.dart';
import '../../../utils/app_assets.dart';
import '../widgets/products_grid_view.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController controller = TextEditingController();
  List<Product> searchedProducts = [];
  void _search(String char, List<Product> list) {
    searchedProducts = list
        .where((element) =>
            element.name.toLowerCase().contains(char.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        centerTitle: true,
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
                TextFormField(
                  controller: controller,
                  decoration: const InputDecoration(hintText: 'Search'),
                  onChanged: (str) {
                    _search(str, cubit.getListOfProducts());
                    setState(() {});
                  },
                ),
                searchedProducts.isNotEmpty && controller.text.isNotEmpty
                    ? ProductsGridView(
                        products: searchedProducts,
                      )
                    : Center(
                        child: Image.asset(AppAssets.notFound),
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}
