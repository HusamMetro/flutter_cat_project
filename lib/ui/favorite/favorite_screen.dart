import 'package:cat_project/data/cat_model.dart';
import 'package:cat_project/session.dart';
import 'package:flutter/material.dart';

import '../common/cat_app_bar.dart';
import '../details/cat_details_screen.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: catAppBar("Favorite Cats", false, false, () {}),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: SessionManger().catList.length,
        itemBuilder: (context, index) {
          CatModel catModel = SessionManger().catList[index];
          return catItem(context, catModel);
        },
      ),
    );
  }

  Padding catItem(BuildContext context, CatModel catModel) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        clipBehavior: Clip.hardEdge,
        color: Colors.black,
        elevation: 4,
        child: InkWell(
          splashColor: Colors.greenAccent,
          onTap: () {
            onCatItemTaped(context, catModel);
          },
          child: Row(
            children: [
              Image.network(
                catModel.imageLink,
                height: 125,
                width: 125,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  catModel.name,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void onCatItemTaped(BuildContext context, CatModel catModel) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => CatDetailsScreen(catModel: catModel),
    ));
  }
}
