import 'package:flutter/material.dart';
import 'package:money_manager_app_sqlite/view_model/category_viewmodel.dart';
import 'package:money_manager_app_sqlite/view_model/dashboard_view_model.dart';
import 'package:money_manager_app_sqlite/view_model/transaction_view_model.dart';
import 'package:provider/provider.dart';
import 'views/dashboard_view.dart';

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
        ChangeNotifierProvider(create: (_) => TransactionViewModel()),
        ChangeNotifierProvider(create: (_) => DashBoardViewModel())
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Money Manager',
        home: DashboardView(),

      ),
    );
  }
}


