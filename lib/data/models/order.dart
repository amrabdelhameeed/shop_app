class Order {
  late final int id;
  late final num total;
  late final String date;
  late final String status;

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    total = json['total'];
    date = json['date'];
    status = json['status'];
  }
  Map<String, dynamic> toMap() {
    return {'id': id, 'total': total, 'date': date, 'status': status};
  }
}

class OrderList {
  late final List<Order> orders;
  OrderList.fromJson(Map<String, dynamic> json) {
    orders =
        List.from(json['data']['data']).map((e) => Order.fromJson(e)).toList();
  }
}
