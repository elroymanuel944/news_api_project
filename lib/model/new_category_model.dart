class CategoryModel {
  String? categoryName;

  CategoryModel({
    this.categoryName,
  });

  // void add(CategoryModel category) {}
}

class NewsModel {
  String? title;
  String? description;

  String? urlToImage;
  String? author;
  String? content;

  NewsModel({
    this.title,
    this.description,
    this.urlToImage,
    this.author,
    this.content,
  });
}
