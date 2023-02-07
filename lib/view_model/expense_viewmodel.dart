import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class ExpenseViewModel extends ChangeNotifier{

  final dateController = TextEditingController();
  final categoryController = TextEditingController();
  final noteController = TextEditingController();
  final amountController = TextEditingController();
  final descriptionController = TextEditingController();

  String _selectedType = "Expense";
  String get selectedType => _selectedType;

  set selectedType(String val)
  {
    _selectedType = val;
    notifyListeners();
  }
}