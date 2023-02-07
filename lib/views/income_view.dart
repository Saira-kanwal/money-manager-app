import 'package:flutter/material.dart';
import 'package:money_manager_app_sqlite/utils/app_colors.dart';
import 'package:money_manager_app_sqlite/view_model/expense_viewmodel.dart';
import 'package:money_manager_app_sqlite/widgets/type_sector.dart';
import 'package:provider/provider.dart';

import '../widgets/input_field.dart';

class IncomeView extends StatelessWidget {
  const IncomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text('income'),
      ),
      body:SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child:
        Consumer<ExpenseViewModel>(
            builder: (context, vm, child) {
              return Column(
                children: [
                  TypeSelector(onSelect: (val)
                  {
                    vm.selectedType = val;
                  },
                    selectedType: vm.selectedType,),
                  InputFiled(
                    controller: vm.dateController,
                    hintText: "Enter Date",
                    preIcon:  const Icon(Icons.date_range_outlined),
                    suffixIcon: const Icon(Icons.repeat),
                  ),
                  InputFiled(
                    controller: vm.categoryController,
                    hintText: "Enter Category Name",
                    preIcon:  const Icon(Icons.category),
                  ),
                  InputFiled(
                    controller: vm.amountController,
                    hintText: "Enter Amount",
                    preIcon:  const Icon(Icons.attach_money),
                  ),
                  InputFiled(
                    controller: vm.noteController,
                    hintText: "Enter Note",
                    preIcon:  const Icon(Icons.note_add_outlined),
                  ),
                  InputFiled(
                    controller: vm.descriptionController,
                    hintText: "Enter Description",
                    preIcon:  const Icon(Icons.description_outlined),
                    suffixIcon: const Icon(Icons.camera_alt_outlined),
                  ),
                  SizedBox(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      child:ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all((AppColors.primaryColor))
                        ),
                        onPressed: () {  },
                        child: const Text('Save'),
                      )
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      child: OutlinedButton(
                        onPressed: () {  },
                        child: const Text('Continue'),

                      )
                  )
                ],
              );
            }
        ),

      ),
    );
  }
}
