import 'package:flutter_ecom/models/category_model.dart';

abstract class BaseCategoryRepository{
  Stream<List<Category>> getAllCategories();
}