import 'package:flutter/material.dart';

import 'package:money_manager_app_sqlite/models/category_model.dart';
import 'package:money_manager_app_sqlite/services/sqlite_service.dart';

class CategoryViewModel extends ChangeNotifier
{
  final nameController = TextEditingController();
   String _selectedType = "Income";
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

   saveCategory() async{
     if(nameController.text.trim().isNotEmpty)
       {
         String query ="Insert into categories(name, type) values('${nameController.text}', '$selectedType')";

         var id = await db.insert(query);
         //print(id);
         nameController.clear();
         notifyListeners();
       }
   }

   loadData(Category cat)
   {selectedType = cat.type.toString();
     nameController.text = cat.name.toString();
     _id = cat.id.toString();
     update = true;
     notifyListeners();

   }

  void updateCategory() async {
    if(nameController.text.trim().isNotEmpty)
    {
      String query ="Update categories set name = '${nameController.text}', type ='$selectedType' where id = '$_id' ";
      //print(query);
      var id = await db.update(query);
      //print(id);
      nameController.clear();
      notifyListeners();
    }
  }

  void deleteCategory  (Category cat) async{
     String query = "delete from categories where id = ${cat.id}";
     await db.delete(query);
     notifyListeners();
  }


}