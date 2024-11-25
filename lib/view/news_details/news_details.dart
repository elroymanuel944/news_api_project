import 'package:flutter/material.dart';
import 'package:news_api_project/model/new_category_model.dart';

class NewsDetails extends StatelessWidget {
  final NewsModel newsModel;
  const NewsDetails({super.key, required this.newsModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Text(
              newsModel.title!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Row(
              children: [
                Expanded(
                    child: SizedBox(
                  height: 30,
                )),
                Expanded(
                    child: Text(
                  " - ${newsModel.author!}",
                  maxLines: 1,
                ))
              ],
            ),
            SizedBox(height: 10),
            Image.network(newsModel.urlToImage!),
            SizedBox(height: 10),
            Text(
              newsModel.content!,
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(height: 20),
            Text(newsModel.description!, style: TextStyle(fontSize: 15)),
          ],
        ),
      ),
    );
  }
}
