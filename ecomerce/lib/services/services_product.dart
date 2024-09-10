
import 'dart:convert';
import 'package:ecomerce/models/product.dart';
import 'package:flutter/services.dart';

class ProductService{
  Future<List<Product>> getProducts() async {
    try{
    String productsJson = await rootBundle.loadString('assets/json/products.json');
    List<dynamic> productsList = json.decode(productsJson)['product'];
    List<Product> products= productsList.map((e) => Product.fromJson(e)).toList();

    print('Dades de producte carregades correctament');
    products.forEach((product) {
      print('Producte: ${product.name}');
    });

    return products;
  } catch (e, s) {
    print('Error en carregar les dades de producte: $e');
    print('$s');
    return [];
  }
}
}