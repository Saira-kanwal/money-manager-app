import 'package:flutter/material.dart';

class InsertPhoto extends StatelessWidget {
  const InsertPhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200,
          width: double.maxFinite,
          decoration:  const BoxDecoration(
            color: Colors.red,
            image: DecorationImage(
                image: AssetImage('assets/images/image_place_holder.png'),fit: BoxFit.fill),
            borderRadius:  BorderRadius.all(Radius.circular(20.0)),
          ),
          child: const Text(''),
        ),

        const Positioned(
            bottom: 20,
            right: 20,
            child:  CircleAvatar(
              radius: 25,
              backgroundColor: Colors.purple,
              child: Icon(Icons.camera_alt_outlined,color: Colors.white,),
            )
        )

      ]
    );
  }
}
