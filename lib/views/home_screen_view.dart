import 'package:flutter/material.dart';
import 'package:money_manager_app_sqlite/view_model/transaction_view_model.dart';
import 'package:money_manager_app_sqlite/widgets/total_card.dart';
import 'package:provider/provider.dart';

import '../widgets/pie_chart.dart';
import '../widgets/transaction_title.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TransactionViewModel vm = context.read<TransactionViewModel>();
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
              const TransactionTitle(title: 'Income ',),
                PieChartWidget(
                  chartData: vm.incomeChartData,
                  total: vm.totalIncome,
                ),

                ListView.builder(
                  itemCount:  vm.incomeChartData.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder:(context, index)
                    {
                      return ListTile(
                        title: Text("${vm.incomeChartData[index].title}"),
                        trailing: Text("${vm.incomeChartData[index].value}"),
                      );
                    }

                ),
                const TransactionTitle(title: 'Expense',),
                PieChartWidget(
                  chartData: vm.expenseChartData,
                  total: vm.totalExpense,
                ),

                ListView.builder(
                    itemCount:  vm.expenseChartData.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder:(context, index)
                    {
                      return ListTile(
                        title: Text("${vm.expenseChartData[index].title}"),
                        trailing: Text("${vm.expenseChartData[index].value}"),
                      );
                    }

                )

              ],
            )
          )

        );

  }
}
