class UserResponse {
  UserResponse({
    required this.status,
    required this.data,
  });
  late final bool status;
  late final Data data;

  UserResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final dat = <String, dynamic>{};
    dat['status'] = status;
    dat['data'] = data.toJson();
    return dat;
  }
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    // required this.image,
    // required this.points,
    // required this.credit,
    // required this.token,
  });
  late final int id;
  late final String name;
  late final String email;
  late final String phone;
  // late final String image;
  // late final num points;
  // late final num credit;
  // late final String token;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    // image = json['image'];
    // points = json['points'];
    // credit = json['credit'];
    // token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    // _data['image'] = image;
    // _data['points'] = points;
    // _data['credit'] = credit;
    // _data['token'] = token;
    return data;
  }
}
