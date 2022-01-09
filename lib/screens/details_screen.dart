import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:reham_1/constants/colors.dart';
import 'package:reham_1/models/product.dart';
import 'package:reham_1/screens/add_and_edit_screen.dart';
import 'package:reham_1/screens/home_screen.dart';
import 'package:reham_1/screens/profile_Screen.dart';

class ProductDetailsScreen extends StatefulWidget {
  Product? product;

  ProductDetailsScreen({this.product});

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => ProfileScreen()));
              },
              icon: Icon(Icons.person))
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(12.0),
        children: [
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.all(.5),
                width: double.infinity,
                height: size.width * 0.4,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0),
                    )),
                child: Column(
                  children: [
                    Expanded(
                        flex: 3,
                        child: widget.product!.img == null
                            ? Center(child: Text('No Image'))
                            : Image.file(
                          File(widget.product!.img!.path),
                        )),
                    Expanded(
                      child: Container(
                        color: Colors.white70,
                        child: Row(
                          children: [
                            Expanded(
                              child: FlatButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.comment),
                                label: Text('comments'),
                              ),
                            ),
                            Container(
                              width: .5,
                              height: 30,
                              color: Colors.black45,
                            ),
                            Expanded(
                              child: LikeButton(
                                likeCount: widget.product!.likes,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  IconButton(
                      onPressed: () {
                        goTo(
                            context,
                            AddAndEditProductScreen(
                              isEdit: true,
                              product: widget.product,
                            ));
                      },
                      icon: Icon(Icons.edit)),
                  IconButton(
                      onPressed: () {
                        int? index = widget.product!.id;
                        allProducts.removeAt(index!);
                        Navigator.pushReplacement(context
                            , MaterialPageRoute(builder: (ctx) => HomeScreen())
                        );
                      },
                      icon: Icon(Icons.delete)),
                ],
              )
            ],
          ),
          buildContainerDetaisl(
              text: 'Name: ${widget.product!.name}',
              icon: Icons.drive_file_rename_outline),
          buildContainerDetaisl(
              text: 'Category: ${widget.product!.category}',
              icon: Icons.category),
          buildContainerDetaisl(
              text: 'Email: ${widget.product!.email}',
              icon: Icons.email_outlined),
          buildContainerDetaisl(
              text: 'EndDate: ${widget.product!.dateTime}',
              icon: Icons.date_range_sharp),
          buildContainerDetaisl(
              text: 'Quantity: ${widget.product!.quantity}',
              icon: Icons.production_quantity_limits),
          buildContainerDetaisl(
              text: 'Price: ${widget.product!.price} \$',
              icon: Icons.monetization_on_outlined),
          buildContainerDetaisl(
              text: 'Offer1: ${widget.product!.offer1}',
              icon: Icons.date_range_sharp),
          buildContainerDetaisl(
              text: 'Offer2: ${widget.product!.offer2}',
              icon: Icons.date_range_sharp,
              raduis: true),
        ],
      ),
    );
  }

  Container buildContainerDetaisl({icon, text, raduis = false}) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.all(.5),
      decoration: BoxDecoration(
          color: Colors.green.withOpacity(.7),
          borderRadius: raduis
              ? BorderRadius.only(
            bottomRight: Radius.circular(25.0),
            bottomLeft: Radius.circular(25.0),
          )
              : null),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(
            width: 15.0,
          ),
          Text(
            text,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}
