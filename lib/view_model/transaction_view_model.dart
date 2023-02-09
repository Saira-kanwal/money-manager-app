
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_manager_app_sqlite/models/transaction_model.dart';
import 'package:money_manager_app_sqlite/services/sqlite_service.dart';
import '../models/category_model.dart';

class TransactionViewModel extends ChangeNotifier
{
  final db = SqliteService.instance;
  final dateController = TextEditingController(text: DateFormat("dd-MMM-yyyy").format(DateTime.now()));
  final amountController = TextEditingController();
  final noteController = TextEditingController();
  final descController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _imagePath = '';
  bool update = false;
  String _id = '0';
  List<String> _categories = [];
  String _type = 'Income';
  String _category = 'Select Income Category';
  List<Transaction> _transactions = [];


  List<Transaction> get transactions => _transactions;
  List<String> get categories => _categories;
  String get type => _type;
  String get category => _category;
  DateTime get selectedDate => _selectedDate;


set imagePath(String val)
{
  _imagePath = val;
  notifyListeners();
}

  set type(String val)
  {
    _type = val;
    notifyListeners();
  }

  set category (String val){
    _category = val;
    notifyListeners();
  }
  set selectedDate(DateTime val)
  {
    _selectedDate = val;
    dateController.text = DateFormat("dd-MMM-yyyy").format(val);
    notifyListeners();
  }

  getCategories() async
  {
    var x = await db.getAllRows("select * from categories where type = '$_type'");
    List<Category> temp = [];
    temp = x.map((e) => Category.fromMap(e)).toList();
    _categories = temp.map((e) => e.name.toString()).toList();
    notifyListeners();
  }

  getTransactions() async {
    var data = await db.getAllRows("Select * from transactions");
    _transactions = data.map((e) => Transaction.fromMap(e)).toList();
    notifyListeners();

  }

  saveTransaction() async
  {
    if(amountController.text.trim().isNotEmpty )
      {
        String query = "Insert into transactions(id, category, type, amount , note, description, transactionDate , imagePath) values( $_id, '$category', '$type','${amountController.text}',  '${noteController.text}', '${descController.text}', '$selectedDate', '$_imagePath')";
        var id = await db.insert(query);
        print('Data Saved $id');
        notifyListeners();
      }
  }

// saveTransaction() async
// {
//   var trans = Transaction(
//     type: type,
//     transactionDate:  _selectedDate,
//     category: _category,
//     amount: double.parse(amountController.text),
//     description: descController.text,
//     note: noteController.text,
//     imagePath: '',
//   );
//   String query = "Insert into transactions(category, type, amount , note, description, transactionDate , imagePath) values('$category', '$type','${amountController.text}',  '${noteController.text}', '${descController.text}', '$_selectedDate', '$image')";
//   var id = await db.insert(query);
//   print('Data saved $id');
// }

  loadData(Transaction trans)
  {
    _id = trans.id.toString();
    _category = trans.category .toString();
    _type = trans.type.toString();
    amountController.text = trans.amount.toString();
    noteController.text = trans.note.toString();
    descController.text = trans.description.toString();
    dateController.text = trans.transactionDate.toString();
    imagePath = trans.imagePath.toString();

    update = true;
  notifyListeners();

  }

  void updateTransaction(BuildContext context) async {
    if(amountController.text.trim().isNotEmpty )
    {

      String query = "Update transactions set category = '$category', type = '$type', amount = '${amountController.text}', note = '${noteController.text}', description = '${descController.text}', transactionDate = '${dateController.text}', imagePath = '$_imagePath' where id = '$_id' ";
      var id = await db.update(query);
      print('Date Updated $id');
      Navigator.pop(context);
      Navigator.pop(context);
      notifyListeners();
    }
  }

  void deleteTransaction (Transaction trans) async{
    String query = "delete from transactions where id = ${trans.id}";
    await db.delete(query);
    notifyListeners();
  }

  clearData()
  {
    _category = "Select Income Category";
    type = "Income";
    amountController.clear();
    noteController.clear();
    dateController.clear();
    descController.clear();
    notifyListeners();
  }


}