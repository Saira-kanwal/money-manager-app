import 'package:flutter/material.dart';

import 'package:money_manager_app_sqlite/models/category_model.dart';
import 'package:money_manager_app_sqlite/services/sqlite_service.dart';

import '../utils/common_functions.dart';

class CategoryViewModel extends ChangeNotifier
{
  final nameController = TextEditingController();
   String _selectedType = "income";
   String get selectedType => _selectedType;
   bool update = false;
   String _id = '0';


  SqliteService db = SqliteService.instance;
   List<Category> _categories = [];
   List<Category> get categories => _categories;

   set selectedType(String val)
   {
     _selectedType = val;
     notifyListeners();
   }

   getCategories() async {
     var data = await db.getAllRows("Select * from categories");
     _categories = data.map((e) => Category.fromMap(e)).toList();
     notifyListeners();

   }

   saveCategory(BuildContext context) async{
     if(_validate(context))
       {
         String query ="Insert into categories(name, type) values('${nameController.text}', '$selectedType')";
         CommonFunctions.showSnackBar(context: context, message: "$selectedType Successfully Saved");
         clearData();
         var id = await db.insert(query);
         print(id);

         notifyListeners();
       }
   }

   clearData(){
     _selectedType = "income";
     nameController.clear();
   }

   loadData(Category cat)
   {selectedType = cat.type.toString();
     nameController.text = cat.name.toString();
     _id = cat.id.toString();
     update = true;
     notifyListeners();

   }

  void updateCategory(BuildContext context) async
  {
    if(nameController.text.trim().isNotEmpty && _validate(context))
    {
      String query ="Update categories set name = '${nameController.text}', type ='$selectedType' where id = '$_id' ";
      CommonFunctions.showSnackBar(context: context, message: "$selectedType Successfully Updated");
      var id = await db.update(query);
      update = false;
      print('$id updated');
      clearData();
      notifyListeners();
    }
  }

  void deleteCategory  (Category cat,BuildContext context) async
  {
     String query = "delete from categories where id = ${cat.id}";
     CommonFunctions.showSnackBar(context: context, message: "$selectedType Successfully Deleted");
     await db.delete(query);
     notifyListeners();
  }

  bool _validate (BuildContext context)
  {
    bool check = true;

    if(nameController.text.trim().isEmpty)
    {
      check = false;
      CommonFunctions.showSnackBar(context: context, message: "Please Enter $selectedType");
    }

    return check;
  }


}