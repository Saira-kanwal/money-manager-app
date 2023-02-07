
import 'package:flutter/material.dart';
import 'package:money_manager_app_sqlite/view_model/category_viewmodel.dart';
import 'package:provider/provider.dart';

class DeleteAlert extends StatelessWidget {

   const DeleteAlert({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CategoryViewModel vm = context.watch<CategoryViewModel>();
    return
      AlertDialog(
      icon: const Icon(Icons.delete_forever, size: 50, color: Colors.red, ),
      title: const Text("Confirm Delete"),
      content: const Text("Do you want to delete this record?"),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
      ),
      actions: [
        TextButton(
            onPressed: (){
              // vm.deleteCategory(e);
              Navigator.pop(context, true);
            },
            child: const Text("Yes")
        ),
        TextButton(
            onPressed: (){
              Navigator.pop(context, false);
            },
            child: const Text("No")
        ),
      ],
    );
  }
}
