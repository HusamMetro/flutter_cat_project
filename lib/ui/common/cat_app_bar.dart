import 'package:flutter/material.dart';

AppBar catAppBar(String title) {
  return AppBar(
    backgroundColor: Colors.greenAccent,
    title: Text(title),
    centerTitle: true,
    actions: [
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.favorite_border),
        color: Colors.red,
      )
    ],
  );
}