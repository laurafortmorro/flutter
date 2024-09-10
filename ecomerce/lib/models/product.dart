
import 'package:ecomerce/models/category.dart';
import 'package:ecomerce/models/location.dart';

class Product {
  late int id;
  late Category category;
  late String name;
  late String description;
  late double price;
  late String imgUrl;
  late Location location;

  Product({
    required this.id,
    required this.category,
    required this.name,
    required this.description,
    required this.price,
    required this.imgUrl,
    required this.location
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    print("Product.fromJson category: ${json['category']}");

    return Product(
      id: json['id'],
      category: Category.fromJson(json['category']),
      location: Location.fromJson(json['location']),
      name: json['name'],
      description: json['description'],
      price: json['price'].toDouble(),
      imgUrl: json['img_url'],
    );
  }
}

class CartProduct extends Product{
  late int quantity;

  CartProduct({required this.quantity, required super.id, required super.name, required super.imgUrl, required super.price, required super.description, required super.category, required super.location});
}