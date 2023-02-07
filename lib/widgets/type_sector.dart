import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class TypeSelector extends StatelessWidget {
  final Function(String) onSelect;
  final String? selectedType;
  const TypeSelector({super.key, required this.onSelect, this.selectedType});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 40,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(25)
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: (){
                onSelect("income");
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.43,
                height: 30,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: selectedType == "income" ? AppColors.primaryColor : Colors.white,
                    borderRadius: BorderRadius.circular(25)
                ),
                child:  Center(child: Text("Income", style: TextStyle(fontWeight:FontWeight.w600, color: selectedType == "income" ? Colors.white : Colors.black),)),
              ),
            ),
            GestureDetector(
              onTap: (){
                onSelect("expense");
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.43,
                height: 30,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: selectedType == "expense" ? AppColors.primaryColor: Colors.white,
                    borderRadius: BorderRadius.circular(25)
                ),
                child: Center(child: Text("Expense", style: TextStyle(fontWeight:FontWeight.w600, color: selectedType == "expense" ? Colors.white : Colors.black ),)),
              ),
            ),
          ],
        ),
      ),
    );

  }
}
