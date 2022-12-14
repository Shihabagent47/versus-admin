import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../data/firebase.dart';
import '../models/product.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  var titleController = TextEditingController();
  var amountController = TextEditingController();

  var detailsController1 = TextEditingController();
  var detailsController2 = TextEditingController();
  var detailsController3 = TextEditingController();
  var detailsController4 = TextEditingController();

  var highlightsController1 = TextEditingController();
  var highlightsController2 = TextEditingController();
  var highlightsController3 = TextEditingController();
  var highlightsController4 = TextEditingController();

  var videoUrlController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    const List<String> list = <String>['car', 'bike', 'Others', 'electronics'];
    String dropdownValue = list.first;

    String? path1;
    String? path2;
    XFile? image1;
    XFile? image2;
    Future<String?> selectPicture(XFile? image, ImageSource source) async {
      image = await ImagePicker().pickImage(
        source: source,
        maxHeight: 1000,
        maxWidth: 1000,
      );

      return image?.path;
    }

    //    Future<void>pickImage()async{
    //      if(!kIsWeb){
    //        final ImagePicker _picker=ImagePicker();
    //        XFile? image=await _picker.pickImage(source: ImageSource.gallery);
    //        if(image!=null){
    //          var selected=File(image.path);
    //          setState((){
    //            // print(f);
    //            pickedImage1=selected;
    //
    //          });
    //        }
    //        else{
    //          print("no image");
    //        }
    //      }else if(kIsWeb)
    //
    //      {
    //   final ImagePicker _picker=ImagePicker();
    //   XFile? image=await _picker.pickImage(source: ImageSource.gallery);
    //   if(image!=null){
    //     var f=await image.readAsBytes();
    //     setState((){
    //       print(webImage1.isEmpty);
    //       webImage1=f;
    //       pickedImage1=File("a");
    //
    //       print(webImage1.isEmpty);
    //     });
    //   }
    //   else{
    //     print("no image");
    //   }
    // }
    //
    //    }

    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Center(
                child: Text(
              "Product Add",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            )),
          ),
          Container(
            width: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: EdgeInsets.all(5),
                  child: TextField(
                    expands: false,
                    controller: titleController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Product Title',
                      hintText: 'Product name',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: TextField(
                    expands: false,
                    controller: amountController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Amount',
                      hintText: 'amount',
                    ),
                  ),
                ),
                Card(
                  color: Colors.white70,
                  child: Column(
                    children: [
                      Text("Highlighted"),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: TextField(
                          expands: false,
                          controller: highlightsController1,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Highlight',
                            hintText: 'enter highlight',
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: TextField(
                          expands: false,
                          controller: highlightsController2,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Highlight',
                            hintText: 'enter highlight',
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: TextField(
                          expands: false,
                          controller: highlightsController3,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Highlight',
                            hintText: 'enter highlight',
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: TextField(
                          expands: false,
                          controller: highlightsController4,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Highlight',
                            hintText: 'enter highlight',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  color: Colors.white70,
                  child: Column(
                    children: [
                      Text("Details"),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: TextField(
                          expands: false,
                          controller: detailsController1,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Details',
                            hintText: 'enter highlight',
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: TextField(
                          expands: false,
                          controller: detailsController2,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Details',
                            hintText: 'enter highlight',
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: TextField(
                          expands: false,
                          controller: detailsController3,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Details',
                            hintText: 'enter highlight',
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: TextField(
                          expands: false,
                          controller: detailsController4,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Details',
                            hintText: 'enter highlight',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * .9,
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(width: 0.5))),
                      value: dropdownValue,
                      icon: const Icon(Icons.arrow_downward),
                      elevation: 16,
                      style: const TextStyle(color: Colors.black),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          dropdownValue = value!;
                        });
                      },
                      items: list.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: TextField(
                    expands: false,
                    controller: videoUrlController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Video Link',
                      hintText: 'provide youtube link',
                    ),
                  ),
                ),
                Center(
                    child: Text(
                  "Add Images",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        selectPicture(image1, ImageSource.gallery)
                            .then((value) => path1 = value);
                      },
                      child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(100),
                          child: Icon(Icons.add),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        selectPicture(image2, ImageSource.gallery)
                            .then((value) => path2 = value);
                      },
                      child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(100),
                          child: Icon(Icons.add),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                      textStyle:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });
                    Uint8List imageData1 = await XFile(path1!).readAsBytes();
                    Uint8List imageData2 = await XFile(path2!).readAsBytes();
                    // var i1=File.fromRawPath(webImage1);
                    //  var i2=File.fromRawPath(webImage1);
                    List<String> url = [];
                    final storageRef1 = storage.ref();
                    final mountainImagesRef1 =
                        storageRef1.child("products/${DateTime.now()}");
                    final mountainImagesRef2 =
                        storageRef1.child("products/${DateTime.now()}2");
                    //  File file1 = File(i1.path);
                    try {
                      await mountainImagesRef1
                          .putData(
                              imageData1,
                              SettableMetadata(
                                contentType: "image/jpeg",
                              ))
                          .whenComplete(() {
                        mountainImagesRef1
                            .getDownloadURL()
                            .then((value) => url.add(value));

                        mountainImagesRef2
                            .putData(
                                imageData2,
                                SettableMetadata(
                                  contentType: "image/jpeg",
                                ))
                            .whenComplete(() {
                          mountainImagesRef2
                              .getDownloadURL()
                              .then((value) => url.add(value));

                          Future.delayed(Duration(seconds: 3), () async {
                            var product = Product(
                                title: titleController.text,
                                category: dropdownValue,
                                created: Timestamp.now(),
                                videoUrl: videoUrlController.text,
                                details: [
                                  detailsController1.text,
                                  detailsController2.text,
                                  detailsController3.text,
                                  detailsController4.text
                                ],
                                highlights: [
                                  highlightsController1.text,
                                  highlightsController2.text,
                                  highlightsController3.text,
                                  highlightsController4.text
                                ],
                                images: url,
                                amount: int.parse(amountController.text),
                                ratedpeople: 0,
                                totalrating: 0);

                            final docRef = db
                                .collection("products")
                                .withConverter(
                                  fromFirestore: Product.fromFirestore,
                                  toFirestore: (Product product, options) =>
                                      product.toFirestore(),
                                )
                                .doc();
                            await docRef.set(product).whenComplete(() => {
                                  setState(() {
                                    isLoading = false;
                                  }),
                                  highlightsController1.clear(),
                                  highlightsController2.clear(),
                                  highlightsController3.clear(),
                                  highlightsController4.clear(),
                                  detailsController1.clear(),
                                  detailsController2.clear(),
                                  detailsController3.clear(),
                                  detailsController4.clear(),
                                  titleController.clear(),
                                  videoUrlController.clear(),
                                  amountController.clear(),
                                  url.clear(),
                                });
                          });
                        });
                      });
                    } catch (e) {}

                    // final storageRef2 = storage.ref();
                    // final mountainImagesRef2 = storageRef2.child("products/${DateTime.now()}");
                    // File file2 = File(i2.path);
                    // try {
                    //   await mountainImagesRef2.putFile(file2).whenComplete(() =>
                    //       mountainImagesRef2.getDownloadURL().then((value) => url.add(value))
                    //   );
                    // } catch (e) {
                    //
                    // }

                    //
                  },
                  child: isLoading
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,

                          // as elevated button gets clicked we will see text"Loading..."
                          // on the screen with circular progress indicator white in color.
                          //as loading gets stopped "Submit" will be displayed
                          children: const [
                            Text(
                              'Loading...',
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ],
                        )
                      : const Text('Upload Product'),
                )
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
