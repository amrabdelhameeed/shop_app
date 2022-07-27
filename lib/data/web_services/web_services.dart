import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';

import '../../constants/app_strings.dart';
import '../../utils/dio_helper.dart';
import '../models/home_models.dart';
import '../models/location_helper.dart';
import '../models/location_response.dart';

class WebServices {
  Future<Response> addOrRemoveItemFromCartOrFavourite(
      Product product, bool isCart) async {
    return await DioHelper.postData(
        url: isCart ? ApiStrings.cart : ApiStrings.favorites,
        data: {'product_id': product.id});
  }

  Future<Response> makeAnOrder() async {
    return await DioHelper.postData(url: ApiStrings.order, data: {
      'address_id': AppStrings.locationId,
      'payment_method': 1,
      'use_points': false
    });
  }

  Future<LocationResponse> _getLocationInfoResponse() async {
    LocationResponse? locationResponse;
    await _getAddressInfo(position: LocationHelper.position!).then((value) {
      print(value);
      locationResponse = LocationResponse.fromJson(value.data);
    });
    return locationResponse!;
  }

  Future<Response> addAddress() async {
    Response? response;
    if (LocationHelper.position == null) {
      await LocationHelper.init();
    }
    await _getLocationInfoResponse().then((value) async {
      final address = value.addresses.first.address;
      return response =
          await DioHelper.postData(url: ApiStrings.address, data: {
        'name': 'home',
        'city': address.countrySubdivision,
        'region': address.municipality,
        'details': address.freeformAddress,
        'latitude': LocationHelper.position!.latitude,
        'longitude': LocationHelper.position!.longitude
      });
    });
    return response!;
  }

  Future<Response> _getAddressInfo({required Position position}) async {
    const apiKey = 'bsxnzMsYrbEDa686zw1116ZBGHGA6FAN';
    return await DioHelper.getData2(
        url:
            'search/2/reverseGeocode/${position.latitude},${position.longitude}.{json}?key=$apiKey');
  }

  Future<Response> getAddress() async {
    return await DioHelper.getData(url: ApiStrings.address);
  }

  Future<Response> getOrders() async {
    return await DioHelper.getData(url: ApiStrings.order);
  }

  Future<Response> getProductsOfOrder(int id) async {
    return await DioHelper.getData(url: '${ApiStrings.order}/$id');
  }

  Future<Response> cancleOrder(int id) async {
    return await DioHelper.getData(url: '${ApiStrings.order}/$id/cancel');
  }
}
