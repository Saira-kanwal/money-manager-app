
import 'package:flutter/cupertino.dart';
import 'package:money_manager_app_sqlite/models/transaction_model.dart';
import 'package:money_manager_app_sqlite/services/sqlite_service.dart';
import '../models/category_model.dart';

class TransactionViewModel extends ChangeNotifier
{
  final db = SqliteService.instance;
  final dateController = TextEditingController();
  final amountController = TextEditingController();
  final noteController = TextEditingController();
  final descController = TextEditingController();
  String image = 'image path goes here';
  bool update = false;

  List<String> _categories = [];
  String _type = 'Income';
  String _category = 'Select Income Category';
  List<Transaction> _transactions = [];

  List<Transaction> get transactions => _transactions;
  List<String> get categories => _categories;
  String get type => _type;
  String get category => _category;



  set type(String val)
  {
    _type = val;
    notifyListeners();
  }

  set category (String val){
    _category = val;
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
        String query = "Insert into transactions(category, type, amount , note, description, transactionDate , imagePath) values( '$category', '$type','${amountController.text}',  '${noteController.text}', '${descController.text}', '${dateController.text}', '$image')";
        var id = await db.insert(query);
        print('Date Saved $id');
        amountController.clear();
        noteController.clear();
        dateController.clear();
        descController.clear();
        notifyListeners();
      }
  }



  loadData(Transaction trans)
  {

    _category = trans.category .toString();
    _type = trans.type.toString();
    amountController.text = trans.amount.toString();
    noteController.text = trans.note.toString();
    descController.text = trans.description.toString();
    dateController.text = trans.transactionDate.toString();
    image = trans.imagePath.toString();
    update = true;
  notifyListeners();

  }

  void updateTransaction() async {
    if(amountController.text.trim().isNotEmpty )
    {
      String query = "Insert into transactions(category, type, amount , note, description, transactionDate , imagePath) values( '$category', '$type','${amountController.text}',  '${noteController.text}', '${descController.text}', '${dateController.text}', '$image')";
      var id = await db.update(query);
      print('Date Saved $id');
      amountController.clear();
      noteController.clear();
      dateController.clear();
      descController.clear();
      notifyListeners();
    }
  }

  void deleteTransaction (Transaction trans) async{
    String query = "delete from transactions where id = ${trans.id}";
    await db.delete(query);
    notifyListeners();
  }



}