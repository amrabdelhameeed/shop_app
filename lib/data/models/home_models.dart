import 'package:equatable/equatable.dart';

class HomeDataResponse {
  HomeDataResponse({
    required this.status,
    required this.data,
  });
  late final bool status;
  late final Data data;

  HomeDataResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['data'] = data.toJson();
    return map;
  }
}

class Data {
  Data({
    required this.banners,
    required this.product,
    required this.ad,
  });
  late final List<Banners> banners;
  late final List<Product> product;
  late final String ad;

  Data.fromJson(Map<String, dynamic> json) {
    banners =
        List.from(json['banners']).map((e) => Banners.fromJson(e)).toList();
    product =
        List.from(json['products']).map((e) => Product.fromJson(e)).toList();
    ad = json['ad'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['banners'] = banners.map((e) => e.toJson()).toList();
    data['products'] = product.map((e) => e.toJson()).toList();
    data['ad'] = ad;
    return data;
  }
}

class Banners {
  Banners({
    required this.id,
    required this.image,
  });
  late final int id;
  late final String image;

  Banners.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    return data;
  }
}

class Product extends Equatable {
  Product({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.images,
    required this.inFavorites,
    required this.inCart,
  });
  late final int id;
  late final num price;
  late final num oldPrice;
  late final int discount;
  late final String image;
  late final String name;
  late final String description;
  late final List<String> images;
  late bool inFavorites;
  late bool inCart;

  void toggleCart() {
    inCart = !inCart;
  }

  void toggleFavourite() {
    inFavorites = !inFavorites;
  }

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    images = List.castFrom<dynamic, String>(json['images']);
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['price'] = price;
    data['old_price'] = oldPrice;
    data['discount'] = discount;
    data['image'] = image;
    data['name'] = name;
    data['description'] = description;
    data['images'] = images;
    data['in_favorites'] = inFavorites;
    data['in_cart'] = inCart;
    return data;
  }

  @override
  String toString() {
    return 'id:$id , price:$price , name : $name';
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, name];
}
