class Product {
  final String id;
  final String name;
  final double price;
  final String imageUrl;
  final String description;
  final String category;
  final DateTime createdAt;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.description,
    required this.category,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'imageUrl': imageUrl,
      'description': description,
      'category': category,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['name'],
      price: map['price'].toDouble(),
      imageUrl: map['imageUrl'],
      description: map['description'],
      category: map['category'],
      createdAt: DateTime.parse(map['createdAt']),
    );
  }
}
