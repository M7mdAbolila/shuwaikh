class Addon {
  final String name;
  final num price;

  Addon({required this.name, required this.price});

  factory Addon.fromJson(Map<String, dynamic> json) {
    return Addon(
      name: json['name'] as String,
      price: json['price'] as num,
    );
  }
}

class Addons {
  final List<Addon> addons;

  Addons({required this.addons});

  factory Addons.fromJson(List<dynamic> json) {
    final List<dynamic> addonList = json;
    final addons = addonList.map((addon) => Addon.fromJson(addon)).toList();
    return Addons(addons: addons);
  }
}
