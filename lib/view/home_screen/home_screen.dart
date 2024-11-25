import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_api_project/controller/new_api_controller.dart';
import 'package:news_api_project/model/category_scetion.dart';
import 'package:news_api_project/model/new_category_model.dart';
import 'package:news_api_project/view/category_news/category_news.dart';
import 'package:news_api_project/view/news_details/news_details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<NewsModel> articles = [];
  List<CategoryModel> categoires = [];
  bool isLoading = true;
  getNews() async {
    NewApiController newsApiModel = NewApiController();
    await newsApiModel.getNews();
    articles = newsApiModel.dataStore;
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    categoires = getCategories();
    print("Categoried loded: ${categoires.length}");
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "TODAY WORLD",
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 55,
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: ListView.builder(
                      itemCount: categoires.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final Category = categoires[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SelectedCategoryNews(
                                    category: Category.categoryName!,
                                  ),
                                ));
                          },
                          child: Padding(
                            padding: EdgeInsets.only(right: 15),
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color: Colors.red,
                              ),
                              child: Center(
                                child: Text(
                                  Category.categoryName!,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  // home screen

                  ListView.builder(
                    itemCount: articles.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      final article = articles[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    NewsDetails(newsModel: article),
                              ));
                        },
                        child: Container(
                          margin: EdgeInsets.all(15),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  article.urlToImage!,
                                  height: 250,
                                  width: 400,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                article.title!,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              Divider(thickness: 2)
                            ],
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
    );
  }
}
