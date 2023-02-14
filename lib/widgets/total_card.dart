import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class TotalCard extends StatelessWidget {
  final String title;
  final String value;
  const TotalCard({Key? key, required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.40,
      height: 120,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.monetization_on,color: Colors.white),
          Text(title,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.white),),
          Text(value,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: Colors.white),)
        ],
      ),
    );
  }
}
