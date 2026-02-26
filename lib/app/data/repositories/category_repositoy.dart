import 'package:get/get.dart';
import 'package:mobile/app/data/providers/category_provider.dart';

class CategoryRepositoy {
  final CategoryProvider _categoryProvider;

  CategoryRepositoy(this._categoryProvider);


  Future<Response> fetchCategories() async {
    return await _categoryProvider.getCategories();
  }
}