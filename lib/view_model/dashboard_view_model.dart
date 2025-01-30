
import 'package:flutter/cupertino.dart';
import 'package:money_manager_app_sqlite/views/add_transaction_view.dart';
import 'package:money_manager_app_sqlite/views/category_manager_view.dart';
import 'package:money_manager_app_sqlite/views/home_screen_view.dart';
import 'package:money_manager_app_sqlite/views/search_screen_view.dart';

class DashBoardViewModel extends ChangeNotifier
{
  int _index =1;
  int get index => _index;
  set index(int val)
  {
    _index = val;
    notifyListeners();
  }
  final views = const [
    AddTransactionView(),
    HomeScreen(),
    CategoryManagerView(),
    SearchScreen()

  ];
}