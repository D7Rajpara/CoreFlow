import 'package:coreflow/common_widget/app_snack_helper.dart';
import 'package:coreflow/model/home_list_model.dart';
import 'package:coreflow/ui/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppListItemProvider extends ChangeNotifier {
  Widget buildListTile(BuildContext context, HomeListModel item) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text(item.name, style: _getTextStyle(context, item.inCart)),
      ),
    );
  }

  TextStyle? _getTextStyle(BuildContext context, int inCart) {
    if (inCart == 0) return null;
    return const TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  Future<void> addEditItemAlert(
    BuildContext context,
    String strTitle,
    String btnName,
    HomeListModel? item,
  ) async {
    final controller = TextEditingController();
    if (item != null) {
      controller.text = item.name;
    }
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('$strTitle Item'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(labelText: 'Item Name'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              final auth = context.read<HomeProvider>();
              if (item == null) {
                if (controller.text.isNotEmpty) {
                  auth.addOption(controller.text);
                  Navigator.pop(context);
                } else {
                  AppSnackHelper.showInfo("Please enter item name");
                }
              } else {
                if (controller.text.isNotEmpty) {
                  auth.editItem(
                    item.id,
                    HomeListModel(
                      id: item.id,
                      name: controller.text,
                      inCart: item.inCart,
                    ),
                  );
                  Navigator.pop(context);
                }
              }
            },
            child: Text(btnName),
          ),
        ],
      ),
    );
  }

  Future<bool> confirmDelete(BuildContext context, HomeListModel item) async {
    return await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Delete Item'),
            content: Text('Are you sure you want to delete "${item.name}"?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text(
                  'Delete',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
        ) ??
        false;
  }
}
