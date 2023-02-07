import 'dart:ffi';

class Expense {

  final DateTime? date;
  final String? category;
  final Double? amount;
  final String? note;
  final String? description;

  Expense({this.category,this.note,this.description,this.amount,this.date});

  factory Expense.fromMap (Map data)
  {
    return Expense(
        date: data ['date'],
        category: data['category'],
        amount:  data['amount'],
        note: data['note'],
        description: data['description']
    );
  }
}