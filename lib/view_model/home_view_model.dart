import 'package:flutter/cupertino.dart';
import 'package:money_manager_app_sqlite/views/category_manager_view.dart';
import 'package:money_manager_app_sqlite/views/add_transaction_view.dart';
import 'package:money_manager_app_sqlite/views/transactions_history_view.dart';

class Home extends ChangeNotifier
{
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  set currentIndex(int val)
  {
    _currentIndex = val;
    notifyListeners();
  }

  List pages = <Widget>[
    const AddTransactionView(),
    const CategoryManagerView(),
    const TransactionDataTable(),
  ];



}