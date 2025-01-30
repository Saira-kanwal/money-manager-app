import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/transaction_view_model.dart';
import '../widgets/input_field.dart';
import '../widgets/transaction_title.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TransactionViewModel vm = context.watch<TransactionViewModel>();
    vm.getTransactions();
    vm.getCategories();
    return Scaffold(
        body: Column(
          children:  [
            const TransactionTitle(
              title: 'Search Transactions',),
            InputFiled(
              controller: vm.searchController)
          ],
        ),
    );
  }
}
