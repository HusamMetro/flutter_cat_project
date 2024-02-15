import 'package:cat_project/data/cat_json.dart';
import 'package:cat_project/data/cat_model.dart';
import 'package:flutter/material.dart';

import '../common/cat_app_bar.dart';
import 'cat_card.dart';

var catsList =
    catsJsonList.map((jsonCat) => CatModel.fromJson(jsonCat)).toList();

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: catAppBar("Home Screen"),
        body: GridView.builder(
          itemCount: catsList.length,
          padding: EdgeInsets.all(10.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            final CatModel catModel = catsList[index];
            return CatCard(
              catModel: catModel,
            );
          },
        ),
      ),
    );
  }
}
