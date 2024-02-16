import 'package:cat_project/data/cat_model.dart';
import 'package:flutter/material.dart';

import '../common/cat_app_bar.dart';

class CatDetailsScreen extends StatelessWidget {
  final CatModel catModel;

  const CatDetailsScreen({super.key, required this.catModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: catAppBar(catModel.name),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Card(
                clipBehavior: Clip.hardEdge,
                elevation: 10,
                child: Image.network(catModel.imageLink),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                catModel.name,
                style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w800),
              ),
            ),
            commonDetailsText("Origin", catModel.origin),
            commonDetailsText("Length", catModel.length),
            commonDetailsText("Min Life Expectancy", catModel.minLifeExpectancy),
            commonDetailsText("Max Weight", catModel.maxWeight),
            commonDetailsText("Min Weight", catModel.minWeight),
          ],
        ),
      ),
    );
  }

  Padding commonDetailsText(String prefix, Object value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(
        "$prefix : $value",
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
