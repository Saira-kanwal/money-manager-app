
import 'package:flutter/material.dart';

class BottomNavigationView extends StatefulWidget {
  const BottomNavigationView({Key? key}) : super(key: key);

  @override
  State<BottomNavigationView> createState() => _BottomNavigationViewState();
}

class _BottomNavigationViewState extends State<BottomNavigationView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: 100,
      width: double.maxFinite,
      child: BottomNavigationBar(
        iconSize: 35,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.purpleAccent,
        items: const [
          BottomNavigationBarItem(
              icon: CircleAvatar(
                // backgroundColor: Colors.,
                  child: Icon(Icons.wallet,color: Colors.purple,)
              ),
              label: ''
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.analytics_outlined, color: Colors.purple),
              label: ''
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add,color: Colors.purple,),
              label: ''
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.credit_card,color: Colors.purple,),
              label: ''
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person,color: Colors.purple,),
              label: ''
          ),
        ],
      ),
    );
  }
}

