import 'package:flutter/material.dart';

import '../common/cat_app_bar.dart';


class CatDetailsScreen extends StatelessWidget {
  const CatDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: catAppBar("Details Screen"),
    );
  }
}
