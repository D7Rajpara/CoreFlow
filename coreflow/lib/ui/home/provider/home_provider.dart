import 'package:coreflow/database_helper/database_helper.dart';
import 'package:coreflow/model/home_list_model.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  final dbHelper = DatabaseHelper.instance;
  List<HomeListModel> _arrOption = [];

  List<HomeListModel> get arrOptions => _arrOption;

  void itemSetInCart(int index) {
    HomeListModel obj = arrOptions[index];
    editItem(
      obj.id,
      HomeListModel(
        id: obj.id,
        name: obj.name,
        inCart: obj.inCart == 0 ? 1 : 0,
      ),
    );
  }

  /// Load all users from DB
  Future<void> loadOption() async {
    _arrOption = await dbHelper.getOptions();
    notifyListeners();
  }

  /// Add new user
  Future<void> addOption(String name) async {
    await dbHelper.insertOptions(
      HomeListModel(name: name, id: arrOptions.length + 1, inCart: 0),
    );
    await loadOption(); // reload data
  }

  /// Delete user
  Future<void> deleteOption(int id) async {
    await dbHelper.deleteOption(id);
    await loadOption();
  }

  /// Edit user
  Future<void> editItem(int id, HomeListModel objData) async {
    final index = arrOptions.indexWhere((item) => item.id == id);
    if (index != -1) {
      await dbHelper.updateOption(objData);
      await loadOption();
    }
  }
}
