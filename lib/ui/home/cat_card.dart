import 'package:cat_project/data/cat_model.dart';
import 'package:flutter/material.dart';

import '../details/cat_details_screen.dart';

class CatCard extends StatelessWidget {
  final CatModel catModel;

  const CatCard({super.key, required this.catModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10.0),
      color: Colors.black,
      elevation: 6.0,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: Colors.greenAccent,
        onTap: () {
          onCardTaped(context, catModel);
        },
        child: Column(
          children: [
            Expanded(
              child: Image.network(
                catModel.imageLink,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                catModel.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void onCardTaped(BuildContext context, CatModel catModel) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => CatDetailsScreen(catModel: catModel),
  ));
}
