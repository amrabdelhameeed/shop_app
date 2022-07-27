import 'package:shop_app/data/models/order.dart';

import '../../constants/app_strings.dart';
import '../../utils/dio_helper.dart';
import '../models/home_models.dart';

class HomeRepo {
  Future<HomeDataResponse> getHomeData() async {
    final response = await DioHelper.getData(
      url: ApiStrings.homeData,
    );
    return HomeDataResponse.fromJson(response.data);
  }

  // void fun() {
  //   getHomeData().then((value) {
  //     print(value.data.product[3].toString());
  //   });
  // }
  Future addOrRemoveFromCart(Product product) async {
    final response = await DioHelper.postData(
        url: ApiStrings.cart, data: {'product_id': product.id});
  }

  Future<OrderList> getOrders() async {
    final response = await DioHelper.getData(url: ApiStrings.order);
    return OrderList.fromJson(response.data);
  }
}
