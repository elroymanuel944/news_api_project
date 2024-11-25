import 'package:flutter/material.dart';
import 'package:news_api_project/controller/new_api_controller.dart';
import 'package:news_api_project/model/new_category_model.dart';
import 'package:news_api_project/view/news_details/news_details.dart';

class SelectedCategoryNews extends StatefulWidget {
  String category;
  SelectedCategoryNews({super.key, required this.category});

  @override
  State<SelectedCategoryNews> createState() => _SelectedCategoryNewsState();
}

class _SelectedCategoryNewsState extends State<SelectedCategoryNews> {
  List<NewsModel> articles = [];
  bool isLoading = true;
  getNews() async {
    categorySection news = categorySection();
    await news.getNews(widget.category);
    articles = news.dataStore;
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.category,
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25),
        ),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: ListView.builder(
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
              ),
            ),
    );
  }
}
