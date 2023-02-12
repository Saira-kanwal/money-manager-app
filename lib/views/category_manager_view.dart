import 'package:flutter/material.dart';
import 'package:money_manager_app_sqlite/widgets/type_sector.dart';
import 'package:provider/provider.dart';
import '../utils/app_colors.dart';
import '../view_model/category_viewmodel.dart';
import '../widgets/input_field.dart';

class CategoryManagerView extends StatelessWidget {
  const CategoryManagerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CategoryViewModel vm = context.watch<CategoryViewModel>();
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Center(child: Text("Category Manage")),
        actions: [
          IconButton(
              onPressed: (){

              },
              icon: const Icon(Icons.cyclone))
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child:
              Column(
              children: [
                TypeSelector(
                  onSelect: (val)
                  {
                    vm.selectedType = val;
                  },
                  selectedType: vm.selectedType,
                ),

                const SizedBox(height: 10),
                InputFiled(
                    controller: vm.nameController,
                  hintText: "Enter Category Name",
                  preIcon:  const Icon(Icons.category),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)))
                      ),
                        onPressed: (){
                          vm.update == true ? vm.updateCategory() : vm.saveCategory();
                        },
                        child: const Text('Save',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17))),
                  ),
                ),

                const SizedBox(height: 10,),
                vm.categories.isEmpty ?
                const Center(child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text("No Categories found",
                      style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 25)))
                ) :
                     SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
            headingRowColor: MaterialStateProperty.all(AppColors.primaryColor),
            headingTextStyle: const TextStyle(color: Colors.white),
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.primaryColor)),
            columns: const <DataColumn>[
            DataColumn(label: Text("Id")),
            DataColumn(label: Text("Type")),
            DataColumn(label: Text("Name")),
            DataColumn(label: Text("Edit")),
            DataColumn(label: Text("Delete")),
            ],
            rows: vm.categories.map((e) {
                return DataRow(
                cells: <DataCell>[
                DataCell(Text("${vm.categories.indexOf(e)+1}")),
                DataCell(Text("${e.type}")),
                DataCell(Text("${e.name}")),
                DataCell(IconButton(
                  onPressed: () {
                    vm.loadData(e);
                  },
                  splashRadius: 20,
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.green,
                  ),
                )),
                DataCell(IconButton(
                  onPressed:() async {
                    showDialog(context: context, builder: (context)
                          {
                            return AlertDialog(
                              icon: const Icon(Icons.delete_forever, size: 50, color: Colors.red, ),
                              title: const Text("Confirm Delete"),
                              content: const Text("Do you want to delete this record?"),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)
                              ),
                              actions: [
                                TextButton(
                                    onPressed: (){
                                      vm.deleteCategory(e);
                                      Navigator.pop(context, true);
                                    }, child: const Text("Yes")
                                ),
                                TextButton(
                                    onPressed: (){
                                      Navigator.pop(context, false);
                                    }, child: const Text("No")
                                ),
                              ],
                            );
                          });},
                    //vm.deleteCategory(e);
                  splashRadius: 20,
                  icon: const Icon(
                    Icons.delete_forever,
                    color: Colors.red,
                  ),
                )
                ),
              ]
              );
            }).toList()
            ),
            )
              ],

        ),


    )
    );

  }

}


