import 'package:flutter/material.dart';
import 'package:money_manager_app_sqlite/utils/app_colors.dart';
import 'package:money_manager_app_sqlite/view_model/category_viewmodel.dart';
import 'package:money_manager_app_sqlite/view_model/expense_viewmodel.dart';
import 'package:money_manager_app_sqlite/view_model/home_view_model.dart';
import 'package:money_manager_app_sqlite/view_model/transaction_view_model.dart';
import 'package:money_manager_app_sqlite/views/expense_view.dart';
import 'package:money_manager_app_sqlite/views/home_screen_view.dart';
import 'package:money_manager_app_sqlite/views/add_transaction_view.dart';
import 'package:provider/provider.dart';
import 'package:money_manager_app_sqlite/views/category_manager_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CategoryViewModel()),
        ChangeNotifierProvider(create: (_) => ExpenseViewModel()),
        ChangeNotifierProvider(create: (_) => TransactionViewModel()),
        ChangeNotifierProvider(create: (_) => Home())
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Money Manager',
        home: HomeScreen(),

      ),
    );
  }
}


