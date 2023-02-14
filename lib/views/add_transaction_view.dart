import 'package:flutter/material.dart';
import 'package:money_manager_app_sqlite/utils/app_colors.dart';
import 'package:money_manager_app_sqlite/utils/common_functions.dart';
import 'package:money_manager_app_sqlite/view_model/transaction_view_model.dart';
import 'package:money_manager_app_sqlite/views/transactions_history_view.dart';
import  'package:money_manager_app_sqlite/widgets/type_sector.dart';
import 'package:provider/provider.dart';
import '../widgets/input_field.dart';
import '../widgets/insert_photo.dart';

class AddTransactionView extends StatelessWidget {
  const AddTransactionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TransactionViewModel vm = context.watch<TransactionViewModel>();
    vm.getCategories();
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.white,
      //   title:  Center(child: Text('add ${vm.type} ',style: const TextStyle(color: Colors.black),)),
      //   actions: [
      //     IconButton(
      //         onPressed: (){
      //           vm.clearData();
      //         },
      //         splashRadius: 20,
      //         icon: const Icon(Icons.cyclone))
      //   ],
      // ),
      body:SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child:
        // Consumer<TransactionViewModel>(
        //     builder: (context, vm, child) {
        //       return
                Column(
                children: [
                  TypeSelector(
                    onSelect: (val)
                  {
                    vm.type = val;
                    vm.getCategories();
                  },
                    selectedType: vm.type,),

                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent),
                      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child:
                    ExpansionTile(
                      key: Key(vm.category),
                      title: Text(vm.category,style: const TextStyle(color: AppColors.primaryColor),),
                      leading: const Icon(Icons.category),
                      children: vm.categories.map((e) => ListTile(
                        title: Text(e),
                        onTap: (){
                          vm.category = e;
                        },
                      )).toList()
                    ),
                  ),

                  InputFiled(
                    controller: vm.dateController,
                    keyboard: TextInputType.datetime,
                    readOnly: true,
                    labelText: "Transaction Date",
                    hintText: "Select Transaction Date",
                    preIcon:  const Icon(Icons.calendar_today_outlined),
                    suffixIcon: const Icon(Icons.repeat),
                    onTap: ()   {
                      CommonFunctions.showMyDatePicker(
                          context: context,
                          selectedDate: vm.selectedDate,
                          onSelect: (val){
                            vm.selectedDate = val ;
                          }
                      );
                    },
                  ),

                  InputFiled(
                    keyboard: TextInputType.number,
                    controller: vm.amountController,
                    labelText: 'Amount',
                    hintText: "Enter Amount",
                    preIcon:  const Icon(Icons.monetization_on),
                  ),

                  InputFiled(
                    controller: vm.noteController,
                    labelText: 'Note',
                    hintText: "Enter Note",
                    preIcon:  const Icon(Icons.note),
                  ),

                  InputFiled(
                    controller: vm.descController,
                    labelText: 'Description',
                    hintText: "Enter Description",
                    preIcon:  const Icon(Icons.description),
                    suffixIcon: const Icon(Icons.camera_alt_outlined),
                  ),

                  const SizedBox(height: 10,),

                  const Text('Select Photo',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17),),

                  const SizedBox(
                    height: 10,
                  ),

                  InsertPhoto(
                      onSelect: (val)
                      {
                        vm.imagePath = val;
                      }
                  ),

                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        child:ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all((AppColors.primaryColor)),
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))
                              )
                          ),
                          onPressed: () {
                            if (vm.update == true )
                              {
                                vm.updateTransaction(context);
                                vm.clearData();

                                Navigator.pop(context);
                                Navigator.pop(context);
                              } else {
                              vm.saveTransaction(context);
                              vm.clearData();
                            }
                          },
                          child: Text('Save ${vm.type}',style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 17)),
                        )
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        child: OutlinedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))
                            )
                          ),
                          onPressed: () {

                           Navigator.push(context, MaterialPageRoute(builder: (context)=> const TransactionDataTable()));
                          },
                          child: const Text('Show all Transactions',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17)),

                        )
                    ),
                  ),

                  // const TransactionDataTable()


                ],
              )
          // ;
            // }
        ),

      // ),
    );
  }
}
