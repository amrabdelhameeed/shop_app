class Category {
  late final String name;
  late final String image;
  Category({required this.name, required this.image});
  Category.fromJson(Map<String, dynamic> map) {
    name = map['name'];
    image = map['image'];
  }
}

class Categories {
  late List<Category> categories;
  Categories(this.categories);
  Categories.fromJson(Map<String, dynamic> map) {
    categories =
        List.from(map['data']).map((e) => Category.fromJson(e)).toList();
  }
}
