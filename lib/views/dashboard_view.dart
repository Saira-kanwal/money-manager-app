import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:money_manager_app_sqlite/utils/app_colors.dart';
import 'package:money_manager_app_sqlite/view_model/dashboard_view_model.dart';
import 'package:money_manager_app_sqlite/view_model/transaction_view_model.dart';
import 'package:provider/provider.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TransactionViewModel vM = context.read<TransactionViewModel>();
    vM.getTransactions();
    DashBoardViewModel vm = context.watch<DashBoardViewModel>();
    return Scaffold(

      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text("Money Manager"),
      ),


      body: vm.views[vm.index],


      bottomNavigationBar:
      ConvexAppBar(
        backgroundColor: AppColors.primaryColor,
        style: TabStyle.reactCircle,
        items: const [
          TabItem(
              icon: Icon(Icons.home,size: 30,color: Colors.grey,),
              title: ''
          ),
          TabItem(
              icon: Icon(Icons.add_circle,size: 30,color: Colors.grey,),
            title: ''
          ),
          TabItem(
              icon: Icon(Icons.category,size: 30,color: Colors.grey,),
              title: ''
          ),
          TabItem(
              icon: Icon(Icons.history,size: 30,color: Colors.grey,),
              title: ''
          )
        ],
        onTap: (val){
          vm.index = val;
        },
      ),
    );
  }
}
