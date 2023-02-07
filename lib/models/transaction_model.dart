class Transaction
{
  final int? id;
  final String? category;
  final String? type;
  final double? amount;
  final String? note;
  final String? description;
  final String? transactionDate;
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
      transactionDate: data['transactionDate'],
      imagePath: data['imagePath']
    );
  }
}