import 'package:flutter/material.dart';
import 'package:money_manager_app_sqlite/utils/app_colors.dart';
import 'package:money_manager_app_sqlite/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Home>(
      builder: (context, vm, child)
      {
        return Scaffold(
          body: vm.pages[vm.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 2,
            backgroundColor: AppColors.primaryColor,
            currentIndex: vm.currentIndex,
            onTap: (val){
              vm.currentIndex = val;
            },
            items: [

              BottomNavigationBarItem(
                icon: CircleAvatar(
                  backgroundColor: vm.currentIndex == 0 ? Colors.white : AppColors.primaryColor,
                  radius: 21.5,
                  child: const CircleAvatar(
                    backgroundColor: AppColors.primaryColor,
                    child: Icon(Icons.monetization_on_outlined,color: Colors.white,),
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: CircleAvatar(
                  backgroundColor: vm.currentIndex == 1 ? Colors.white : AppColors.primaryColor,
                  radius: 21.5,
                  child: const CircleAvatar(
                    backgroundColor: AppColors.primaryColor,
                    child: Icon(Icons.category,color: Colors.white,),
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: CircleAvatar(
                  backgroundColor: vm.currentIndex == 2 ? Colors.white : AppColors.primaryColor,
                  radius: 21.5,
                  child: const CircleAvatar(
                    backgroundColor: AppColors.primaryColor,
                    child: Icon(Icons.history,color: Colors.white,),
                  ),
                ),
                label: '',
              ),
            ],
          ),
        );
      }
    );
  }
}
