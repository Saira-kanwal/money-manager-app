import 'package:flutter/material.dart';

class CommonFunctions
{
  //static keyword used without making object
  static showMyDatePicker ({required BuildContext context, required DateTime selectedDate,required Function onSelect}) async
{
  DateTime? date = await showDatePicker(
        context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2023),
      lastDate: DateTime(2050)
  );
  if(date != null){
    onSelect(date);
  }
}

validator({required String id, required String category, required String type, required double amount, required String note, required String description, required String date, required String image}){

}

}
