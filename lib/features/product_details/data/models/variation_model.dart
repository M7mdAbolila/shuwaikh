class Size {
  final String name;
  final double price;

  Size({required this.name, required this.price});

  factory Size.fromJson(Map<String, dynamic> json) {
    return Size(
      name: json['name'] as String,
      price: double.parse(json['price'].toString()),
    );
  }
  Map<String, dynamic> toJson() => {
        'name': name,
        'price': price,
      };
}

class Variation {
  final List<Size> sizes;

  Variation({required this.sizes});

  factory Variation.fromJson(Map<String, dynamic> json) {
    final List<dynamic> sizeList =
        json['size'] ?? json['الحجم'] as List<dynamic>;
    final sizes = sizeList.map((size) => Size.fromJson(size)).toList();
    return Variation(sizes: sizes);
  }
}
