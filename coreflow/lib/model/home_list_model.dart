import 'package:coreflow/constant/text_constant.dart';

class HomeListModel {
  int id;
  String name;
  int inCart;

  HomeListModel({required this.id, required this.name, this.inCart = 0});

  String get tableName => strTblHomeItem;

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'inCart': inCart};
  }

  factory HomeListModel.fromMap(Map<String, dynamic> map) {
    return HomeListModel(
      id: map['id'],
      name: map['name'],
      inCart: map['inCart'],
    );
  }
}
