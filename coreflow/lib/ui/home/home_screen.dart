import 'package:coreflow/common_widget/app_text.dart';
import 'package:coreflow/common_widget/list_view/app_list_view.dart';
import 'package:coreflow/common_widget/list_view/provider/app_list_view_provider.dart';
import 'package:coreflow/common_widget/place_holder_text.dart';
import 'package:coreflow/constant/color_constant.dart';
import 'package:coreflow/ui/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final nameController = TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeProvider>(context, listen: false).loadOption();
    });
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    final appListProvider = Provider.of<AppListItemProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: navigationBarColor,
        title: AppText(
          text: widget.title,
          color: textColor,
          textAlign: TextAlign.center,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              appListProvider.addEditItemAlert(context, "Add", "ADD", null);
            },
            tooltip: 'Add Task',
          ),
        ],
      ),
      body: homeProvider.arrOptions.isEmpty
          ? PlaceHolderText(placeholderText: "Add your Todo list here ...")
          : Padding(
              padding: const EdgeInsets.all(12.0),
              child: AppListView(
                arrData: homeProvider.arrOptions,
                onPressedDelete: (index, isDelete) {
                  if (isDelete) {
                    var obj = homeProvider.arrOptions[index];
                    homeProvider.deleteOption(obj.id);
                  }
                },
                onPreassedEdit: (index, obj) {},
                onPreassedCell: (index) {
                  homeProvider.itemSetInCart(index);
                },
              ),
            ),
    );
  }
}
