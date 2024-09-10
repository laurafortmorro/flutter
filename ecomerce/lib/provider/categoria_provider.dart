import 'package:ecomerce/models/category.dart';
import 'package:ecomerce/services/services_category.dart';
import 'package:flutter/material.dart';

class AppProvider with ChangeNotifier {
  List<Category> categories = [];
  CategoryService _categoryService = CategoryService();


  AppProvider() {
    fetchCategories();
  }

  Future fetchCategories() async {
    categories = await _categoryService.getCategories();

    print("CATEGORIAS OK");
    notifyListeners();
  }


  @override
  notifyListeners();
}
