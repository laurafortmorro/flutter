
import 'dart:convert';
import 'package:ecomerce/models/category.dart';
import 'package:flutter/services.dart';

class CategoryService {
  Future<List<Category>> getCategories() async {
    try {
      String categoriesJson = await rootBundle.loadString('assets/json/categories.json');
      List<dynamic> categoriesList = json.decode(categoriesJson)['data'];
      List<Category> categories = categoriesList.map((e) => Category.fromJson(e)).toList();

      // Mostra les dades carregades a la consola
      print('Dades de categories carregades correctament:');
      categories.forEach((category) {
        print('Categoria: ${category.name}');
      });

      return categories;
    } catch (e, s) {
      // En cas d'error, mostra'l a la consola
      print('Error en carregar les dades de categories: $e');
      print(s);
      return [];
    }
  }
}