

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropListCard extends StatefulWidget {
  const DropListCard({Key? key}) : super(key: key);

  @override
  State<DropListCard> createState() => _DropListCardState();
}

class _DropListCardState extends State<DropListCard> {
  @override
  Widget build(BuildContext context) {
    return ListTile(

      subtitle: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Text("Manage"),
      ),
      leading: Icon(Icons.shopping_bag_outlined),title: Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Text("Products"),
    ),trailing: IconButton(onPressed: (){

    },
      icon: Icon(Icons.keyboard_arrow_down_rounded),
    ),onTap: (){
      setState((){
  //      currentIndex=0;
      });
    },);
  }
}
