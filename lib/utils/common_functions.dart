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

static showSnackBar({required BuildContext context, required String message})
{
  SnackBar snackBar = SnackBar(content: Text(message));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

}
