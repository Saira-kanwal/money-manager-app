import 'package:intl/intl.dart';

class Transaction
{
  final int? id;
  final String? category;
  final String? type;
  final double? amount;
  final String? note;
  final String? description;
  final DateTime? transactionDate;
  final String? imagePath;

  Transaction({this.id,this.type,this.amount,this.category,this.description,this.imagePath,this.note,this.transactionDate});

  factory Transaction.fromMap (Map data)
  {
    return Transaction(
      id: data['id'],
      category: data['category'],
      type: data['type'],
      amount: data['amount'],
      description: data['description'],
      note: data['note'],
      transactionDate: DateTime.parse(data['transactionDate']),
      imagePath: data['imagePath']
    );
  }

  Map<String, dynamic> toMap()
  {
    return{
      "category" : category,
      "type" : type,
      "amount" : amount,
      "description" : description,
      "note" : note,
      "transactionDate" : DateFormat("yyyy-MM-dd").format(transactionDate!),  //sqlite support only this format
      "imagePath" : imagePath
    };
  }
}