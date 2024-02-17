import 'package:cat_project/data/cat_model.dart';
import 'package:flutter/material.dart';

import '../../session.dart';
import '../common/cat_app_bar.dart';

class CatDetailsScreen extends StatefulWidget {
  final CatModel catModel;

  const CatDetailsScreen({super.key, required this.catModel});

  @override
  State<CatDetailsScreen> createState() => _CatDetailsScreenState();
}

class _CatDetailsScreenState extends State<CatDetailsScreen> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    setState(() {
      isFavorite = SessionManger().findCat(widget.catModel);
    });
    return Scaffold(
      appBar: catAppBar(widget.catModel.name, true, isFavorite, () {
        onFavoriteClicked(widget.catModel, SessionManger());
      }),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Card(
                clipBehavior: Clip.hardEdge,
                elevation: 10,
                child: Image.network(widget.catModel.imageLink),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  widget.catModel.name,
                  style: const TextStyle(
                      fontSize: 32, fontWeight: FontWeight.w800),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            commonDetailsText("Origin", widget.catModel.origin),
            commonDetailsText("Length", widget.catModel.length),
            commonDetailsText(
                "Min Life Expectancy", widget.catModel.minLifeExpectancy),
            commonDetailsText("Max Weight", widget.catModel.maxWeight),
            commonDetailsText("Min Weight", widget.catModel.minWeight),
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

  void onFavoriteClicked(CatModel catModel, SessionManger session) {
    if (session.findCat(catModel)) {
      session.removeCat(catModel);
      setState(() {
        isFavorite = false;
      });
    } else {
      session.addCat(catModel);
      setState(() {
        isFavorite = true;
      });
    }
  }
}
