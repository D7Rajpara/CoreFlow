import 'package:coreflow/common_widget/list_view/provider/app_list_view_provider.dart';
import 'package:coreflow/model/home_list_model.dart';
import 'package:coreflow/ui/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class AppListView extends StatefulWidget {
  final bool showEdit;
  final bool showDelete;
  final List arrData;
  final bool isSwipeEnabled;
  final Function(int index, bool isDelete) onPressedDelete;
  final Function(int index, HomeListModel obj) onPreassedEdit;
  final Function(int index) onPreassedCell;

  const AppListView({
    super.key,
    this.showEdit = true,
    this.showDelete = true,
    required this.arrData,
    required this.onPressedDelete,
    required this.onPreassedEdit,
    required this.onPreassedCell,
    this.isSwipeEnabled = false,
  });

  @override
  State<AppListView> createState() => _AppListViewState();
}

class _AppListViewState extends State<AppListView> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppListItemProvider>(context);
    final homeProvider = Provider.of<HomeProvider>(context);

    return ListView.builder(
      itemCount: widget.arrData.length,
      padding: const EdgeInsets.all(8),
      itemBuilder: (context, index) {
        final item = widget.arrData[index];
        WidgetsBinding.instance.addPostFrameCallback((_) {
          homeProvider.loadOption();
        });
        return Slidable(
          key: ValueKey(item.id),
          endActionPane: ActionPane(
            motion: const DrawerMotion(),
            extentRatio: 0.45,
            children: [
              SlidableAction(
                onPressed: (context) {
                  provider.addEditItemAlert(context, "Edit", "Save", item).then(
                    (_) {
                      widget.onPreassedEdit(index, item);
                    },
                  );
                },

                borderRadius: BorderRadius.circular(10),
                backgroundColor: Colors.blue.shade100,
                foregroundColor: Colors.blue,
                icon: Icons.edit,
                label: 'Edit',
              ),
              SlidableAction(
                onPressed: (context) async {
                  final isDelete = await provider.confirmDelete(context, item);
                  widget.onPressedDelete(index, isDelete);
                },
                borderRadius: BorderRadius.circular(10),
                backgroundColor: Colors.red.shade100,
                foregroundColor: Colors.red,
                icon: Icons.delete,
                label: 'Delete',
              ),
            ],
          ),
          child: GestureDetector(
            child: provider.buildListTile(context, item),
            onTap: () {
              widget.onPreassedCell(index);
            },
          ),
        );
      },
    );
  }
}
