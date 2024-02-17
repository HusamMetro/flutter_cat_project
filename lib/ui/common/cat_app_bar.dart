import 'package:flutter/material.dart';

AppBar catAppBar(
  String title,
  bool includeActions,
  bool isFavorite,
  void Function() onFavoriteClicked,
) {
  if (includeActions) {
    return AppBar(
      backgroundColor: Colors.greenAccent,
      title: Text(title),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: onFavoriteClicked,
          icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
          color: Colors.red,
        )
      ],
    );
  } else {
    return AppBar(
      backgroundColor: Colors.greenAccent,
      title: Text(title),
    );
  }
}
