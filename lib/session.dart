import 'data/cat_model.dart';

class SessionManger {
  static final SessionManger _singleton = SessionManger._internal();

  factory SessionManger() {
    return _singleton;
  }

  SessionManger._internal();

  final List<CatModel> catList = [];

  void addCat(CatModel catModel) {
    catList.add(catModel);
  }

  void removeCat(CatModel catModel) {
    catList.remove(catModel);
  }

  bool findCat(CatModel catModel) {
    return catList.contains(catModel);
  }

  List<CatModel> getAllCats() {
    return catList;
  }
}
