part of 'products_cubit.dart';

abstract class ProductsState {
  const ProductsState();
}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class GeneralLoading extends ProductsState {}

class ProductFavouriteToggle extends ProductsState {
  final String message;
  const ProductFavouriteToggle(this.message);
}

class ProductCartToggle extends ProductsState {
  final String message;
  const ProductCartToggle(this.message);
}

class OrderSuccess extends ProductsState {
  final String message;
  const OrderSuccess(this.message);
}

class GetProductsSuccess extends ProductsState {
  // final List<Product> products;
  // const GetProductsSuccess(this.products);

  // @override
  // List<Object> get props => [products];

}

class GetOrderSuccess extends ProductsState {
  final List<Order> orders;
  const GetOrderSuccess(this.orders);

  // @override
  // List<Object> get props => [products];

}

class GetOrderProductsSuccess extends ProductsState {
  final OrderProductList orders;
  const GetOrderProductsSuccess(this.orders);

  // @override
  // List<Object> get props => [products];

}

class CancleOrderSuccess extends ProductsState {
  final String message;
  const CancleOrderSuccess(this.message);

  // @override
  // List<Object> get props => [products];

}

class GetProductsError extends ProductsState {
  final String message;
  const GetProductsError(this.message);

  // @override
  // List<Object> get props => [message];
}

class GetOrdersError extends ProductsState {
  const GetOrdersError();

  // @override
  // List<Object> get props => [message];
}

class GetAddress extends ProductsState {
  final String message;
  const GetAddress(this.message);

  // @override
  // List<Object> get props => [message];
}
