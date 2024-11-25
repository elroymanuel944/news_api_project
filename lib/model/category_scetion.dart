import 'package:news_api_project/model/new_category_model.dart';

List<CategoryModel> getCategories() {
  return [
    CategoryModel(categoryName: "Business"),
    CategoryModel(categoryName: "Entertainment"),
    CategoryModel(categoryName: "Health"),
    CategoryModel(categoryName: "Science"),
    CategoryModel(categoryName: "Sports"),
    CategoryModel(categoryName: "Technology"),
  ];
}