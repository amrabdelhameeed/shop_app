import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/data/models/order.dart';

import '../../../constants/app_strings.dart';
import '../../../features/home_layout/orders/models/order_product.dart';
import '../../../utils/cashe_helper.dart';
import '../../models/home_models.dart';
import '../../repositories/home_repo.dart';
import '../../web_services/web_services.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.homeRepo, this.webServices) : super(ProductsInitial());
  final HomeRepo homeRepo;
  final WebServices webServices;
  static ProductsCubit get(context) => BlocProvider.of(context);
  HomeDataResponse? homeDataResponse;
  void getHomeData() async {
    emit(ProductsLoading());
    homeDataResponse = await homeRepo.getHomeData();
    emit(GetProductsSuccess());
  }

  void getOrders() {
    List<Order> orders = [];
    homeRepo.getOrders().then((value) {
      orders = value.orders;
      emit(GetOrderSuccess(orders));
    });
  }

  Future<OrderProductList> getOrderProducts(int id) async {
    OrderProductList? orders;
    await webServices.getProductsOfOrder(id).then((value) {
      orders = OrderProductList.fromJson(value.data);
      emit(GetOrderProductsSuccess(orders!));
    });
    return orders!;
  }

  void canccleOrder(int id) async {
    await webServices.cancleOrder(id).then((value) {
      final message = value.data['message'];
      emit(CancleOrderSuccess(message));
    });
    getOrders();
  }

  List<Product> getListOfProducts() {
    if (homeDataResponse != null && homeDataResponse!.status) {
      return homeDataResponse!.data.product;
    } else {
      return [];
    }
  }

  List<Banners> getListOfBanners() {
    if (homeDataResponse != null && homeDataResponse!.status) {
      return homeDataResponse!.data.banners;
    } else {
      return [];
    }
  }

  String getAdImage() {
    if (homeDataResponse != null && homeDataResponse!.status) {
      return homeDataResponse!.data.ad;
    } else {
      return '';
    }
  }

  void toggleInFavourite(Product product) {
    emit(GeneralLoading());
    webServices
        .addOrRemoveItemFromCartOrFavourite(product, false)
        .then((value) {
      product.toggleFavourite();
      emit(ProductFavouriteToggle(value.data['message']));
    });
  }

  void toggleInCart(Product product) {
    emit(GeneralLoading());
    webServices.addOrRemoveItemFromCartOrFavourite(product, true).then((value) {
      if (value.data['status'] as bool) {
        product.toggleCart();
      }
      emit(ProductCartToggle(value.data['message']));
    });
  }

  void makeAnOrder() {
    emit(GeneralLoading());
    if (AppStrings.locationId != null && AppStrings.locationId!.isNotEmpty) {
      webServices.makeAnOrder().then((value) {
        if (value.data['status'] as bool) {
          homeDataResponse!.data.product.forEach((element) {
            element.inCart = false;
          });
        }
        emit(OrderSuccess(value.data['message']));

        getOrders();
      });
    } else {
      const OrderSuccess('Please Add Location Premssion');
      addAddress();
    }
  }

  void addAddress() async {
    await webServices.addAddress().then((value) {
      if (value.data['status'] as bool) {
        CasheHelper.setStr(
            key: AppStrings.locationIdKey,
            text: value.data['data']['id'].toString());
        AppStrings.locationId = value.data['data']['id'].toString();
      }
      emit(GetAddress(value.data['message']));
    });
  }

  void getAddress() async {
    if (AppStrings.locationId == null) {
      await webServices.getAddress().then((value) {
        print(value);
        List list = value.data['data']['data'] as List;
        if (list.isNotEmpty) {
          CasheHelper.setStr(
                  key: AppStrings.locationIdKey, text: list[0]['id'].toString())
              .then((value) {
            print('there is a location provided and saved');
          });
        }
      });
    }
  }
}
