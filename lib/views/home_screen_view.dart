import 'package:flutter/material.dart';
import 'package:money_manager_app_sqlite/view_model/transaction_view_model.dart';
import 'package:money_manager_app_sqlite/widgets/total_card.dart';
import 'package:provider/provider.dart';

import '../widgets/pie_chart.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TransactionViewModel vm = context.watch<TransactionViewModel>();
    vm.getTransactions();
        return Scaffold(
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TotalCard(
                        title: "Income",
                        value: vm.totalIncome.toString()
                    ),
                    TotalCard(
                        title: "Expense",
                        value: vm.totalExpense.toString()
                    ),
                  ],
                ),
                const PieChartWidget()

              ],
            )
          )

        );

  }
}
