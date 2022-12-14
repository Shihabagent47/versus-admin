import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:versus_admin/screens/product_screen.dart';

import '../menu_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex=0;

  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  String dropdownvalue = 'Item 1';
  List<Widget> widgetList=[
    ProductScreen(),
    Text("Product"),
    Text("Review"),
    Text("Home"),
    Text("Home"),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
                child: Card(
                  color: Colors.white,
                  elevation: 3,
                  child: Column(
              children: [
                  DrawerHeader(

                    child: Image.asset("assets/splash.png",fit: BoxFit.fill),
                  ),


                DropListCard()


                //
                // ListTile(leading: Icon(Icons.shopify),title: Text("Oreders"),trailing: Icon(Icons.keyboard_arrow_right),onTap: (){
                //   setState((){
                //     currentIndex=1;
                //   });
                //
                // }),
                // ListTile(leading: Icon(Icons.reviews),title: Text("Reviews"),trailing: Icon(Icons.keyboard_arrow_right),onTap: (){
                //   setState((){
                //     currentIndex=2;
                //   });
                //
                // }),
                // ListTile(leading: Icon(Icons.production_quantity_limits),title: Text("Promotions"),trailing: Icon(Icons.keyboard_arrow_right),onTap: (){
                //   setState((){
                //     currentIndex=3;
                //   });
                //
                // }),
                // ListTile(leading: Icon(Icons.headset_mic_outlined),title: Text("Support"),trailing: Icon(Icons.keyboard_arrow_right),onTap: (){
                //   setState((){
                //     currentIndex=4;
                //   });
                //
                // }),
              ],
            ),
                )),


            Expanded(
                flex: 5,
                child: Container(
                  child:widgetList[currentIndex] ,
                  color: Colors.white70
                ))

          ],
        ),
      ),
    );
  }
}
