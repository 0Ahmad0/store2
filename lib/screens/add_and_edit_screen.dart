import 'dart:io';


import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reham_1/constants/colors.dart';
import 'package:reham_1/models/product.dart';
import 'package:reham_1/screens/home_screen.dart';

class AddAndEditProductScreen extends StatefulWidget {
  final bool? isEdit;
  final Product? product;

  const AddAndEditProductScreen({Key? key, this.isEdit = false, this.product}) : super(key: key);
  @override
  _AddAndEditProductScreenState createState() => _AddAndEditProductScreenState();
}

class _AddAndEditProductScreenState extends State<AddAndEditProductScreen> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();

  PickedFile? imageFile = null;
  String? number;
  int? numLikes,quantity,offer1,offer2;
  List<String>? comments;
  String? name, category,email,endDate;
  double? price;
  void _openGallery(BuildContext context) async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    setState(() {
      imageFile = pickedFile!;
    });

    Navigator.pop(context);
  }

  void _openCamera(BuildContext context) async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
    );
    setState(() {
      imageFile = pickedFile!;
    });
    Navigator.pop(context);
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Choose option",
              style: TextStyle(color: Colors.blue),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Divider(
                    height: 1,
                    color: Colors.blue,
                  ),
                  ListTile(
                    onTap: () {
                      _openGallery(context);
                    },
                    title: Text("Gallery"),
                    leading: Icon(
                      Icons.account_box,
                      color: Colors.blue,
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.blue,
                  ),
                  ListTile(
                    onTap: () {
                      _openCamera(context);
                    },
                    title: Text("Camera"),
                    leading: Icon(
                      Icons.camera,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.isEdit!
                ?'Edit Product'
                :'Add Product'
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _key,
        child: ListView(
          padding: EdgeInsets.all(12.0),
          children: [
            GestureDetector(
              onTap: (){
                _showChoiceDialog(context);
              },
              child: (imageFile == null)
                  ? Image.asset(
                'images/logo.png',
                width: size.width *0.3,
                height: size.width *0.3,
              )
                  : Image.file(
                File(imageFile!.path),
                fit: BoxFit.contain,
              ),
            ),
            Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    (imageFile == null)
                        ? Text("Choose Image")
                        : SizedBox()
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextFormFiledWidget(
              initialValue:
              widget.isEdit!
                  ?widget.product!.name!
                  :'',
              icon: FontAwesomeIcons.file,
              hintText: 'Name',
              textInputType: TextInputType.text,
              onChange: (text) {
                name = text;
              },
              validator: (text) {
                if (text!.isEmpty) {
                  return 'Cann\'t Be Empty';
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(
              height: 20.0,
            ), //
            DropdownButtonFormField<String>(

              decoration: InputDecoration(border: OutlineInputBorder(),prefixIcon: Icon(Icons.category)),
              hint: Text(   widget.isEdit!
                  ?widget.product!.category!
                  :'Category',),
              isExpanded: true,
              onChanged: (text) {
                category = text;
              },
              items: categoryDropDown
                  .map(
                    (e) => DropdownMenuItem<String>(
                  child: Text('${e}'),
                  value: e,
                ),
              )
                  .toList(),
            ),
            const SizedBox(
              height: 20.0,
            ), //

            TextFormFiledWidget(
              // textEditingController: quantity,
              initialValue: widget.isEdit!
                  ?'${widget.product!.price!}'
                  :'',
              icon: Icons.monetization_on,
              hintText: 'Price',
              textInputType: TextInputType.number,
              onChange: (text) {
                price = double.parse(text);
              },
              validator: (text) {
                if (text!.isEmpty) {
                  return 'Cann\'t Be Empty';
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(
              height: 20.0,
            ), ///
            DateTimePicker(
              readOnly: widget.isEdit!?true:false,
              decoration: InputDecoration(border: OutlineInputBorder(),prefixIcon: Icon(Icons.date_range_sharp)),
              initialValue: DateTime.now().toString(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2030),
              onChanged: (text){
                endDate  = text;
                },
              validator: (val) {
                return null;
              },
            ),
            const SizedBox(
              height: 20.0,
            ), //
            TextFormFiledWidget(
              initialValue: widget.isEdit!
                  ?'${widget.product!.quantity!}'
                  :'',
              // textEditingController: quantity,
              icon: Icons.view_list,
              hintText: 'Quantity',
              textInputType: TextInputType.number,
              onChange: (text) {
                quantity = int.parse(text);
              },
              validator: (text) {
                if (text!.isEmpty) {
                  return 'Cann\'t Be Empty';
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextFormFiledWidget(
              initialValue: widget.isEdit!
                  ?'${widget.product!.email!}'
                  :'',
              // textEditingController: quantity,
              icon: Icons.email_outlined,
              hintText: 'Email Or Phone',
              textInputType: TextInputType.text,
              onChange: (text) {
                email = text;
              },
              validator: (text) {
                if (text!.isEmpty) {
                  return 'Cann\'t Be Empty';
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(
              height: 20.0,
            ), ////
            TextFormFiledWidget(
              initialValue: widget.isEdit!
                  ?'${widget.product!.offer1!}'
                  :'',
              // textEditingController: quantity,
              icon: Icons.local_offer,
              hintText: 'Offer1',
              textInputType: TextInputType.number,
              onChange: (text) {
                offer1 = int.parse(text);
              },
              validator: (text) {
                if (text!.isEmpty) {
                  return 'Cann\'t Be Empty';
                } else {
                  return null;
                }
              },
            ), //
            const SizedBox(
              height: 20.0,
            ), //
            TextFormFiledWidget(
              initialValue: widget.isEdit!
                  ?'${widget.product!.offer2!}'
                  :'',
              // textEditingController: quantity,
              icon: Icons.local_offer,
              hintText: 'Offer2',
              textInputType: TextInputType.number,
              onChange: (text) {
                offer2 = int.parse(text);
              },
              validator: (text) {
                if (text!.isEmpty) {
                  return 'Cann\'t Be Empty';
                } else {
                  return null;
                }
              },
            ), //

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
            widget.isEdit!
                ?Icons.edit
                :Icons.add
        ),
        onPressed: (){
          if(_key.currentState!.validate()){
            setState(() {
              allProducts.add(
                  Product(id: allProducts.length,
                      img: imageFile,
                      name: name,
                      numView: 120,
                      quantity: quantity,
                      category: category,
                      price: price,
                      dateTime: endDate,
                      offer1: offer1,
                      offer2: offer2,
                      likes: 100,
                      email:email )
              );
              // print(allProducts.length);
            });
            Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (ctx)=>HomeScreen()));
          }
          //ToDo: Check is Edit Or Add Prouduct
          // Navigator.pop(context);
        },
      ),
    );
  }
}



class TextFormFiledWidget extends StatelessWidget {
  final IconData? icon;
  final String? hintText;
  final String? initialValue;
  final Function(String)? onChange;
  String? Function(String? val)? validator;
  final TextInputType? textInputType;
  final bool? isObserver;
  final TextEditingController? textEditingController;

  TextFormFiledWidget(
      {Key? key,
        required this.icon,
        required this.hintText,
        required this.onChange,
        required this.validator,
        required this.textInputType,
        this.textEditingController,
        this.initialValue,
        this.isObserver = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      controller: textEditingController,
      textInputAction: TextInputAction.next,
      keyboardType: textInputType,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: hintText,
        prefixIcon: Icon(icon),
      ),
      onChanged: onChange,
      validator: validator,
    );
  }
}
