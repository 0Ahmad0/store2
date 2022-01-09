import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reham_1/constants/colors.dart';
import 'package:reham_1/screens/add_and_edit_screen.dart';
import 'package:reham_1/screens/details_screen.dart';
import 'package:reham_1/screens/login_screen.dart';
import 'package:reham_1/screens/profile_Screen.dart';
import 'package:reham_1/screens/register_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    setState(() {
      allProducts;
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          width: getScreenSize(context).width / 2,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              end: Alignment.bottomRight,
              colors: [
                Colors.green.shade300,
                Colors.white70,
              ]
            )
          ),
          child: SafeArea(
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.how_to_reg),
                  title: Text('Login'),
                  onTap: (){
                    Navigator.pop(context);
                    goTo(context, LoginScreen());
                  },
                ),
                Divider(
                  color: Colors.white,
                ),
                ListTile(
                  leading: Icon(Icons.login),
                  title: Text('SignUp'),
                  onTap: (){
                    Navigator.pop(context);
                    goTo(context, SignUpScreen());
                  },
                ),
                Divider(
                  color: Colors.white,
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('My Profile'),
                  onTap: (){
                    Navigator.pop(context);
                    goTo(context, ProfileScreen());
                  },
                ),
              ],
            ),
          ),
        ),

      ),
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            goTo(context, AddAndEditProductScreen());
          }, icon: Icon(Icons.add))
        ],
        title: Text('Home'),
      ),
      body: allProducts.isEmpty?
          Center(
            child: Text('No Item Yet',style: TextStyle(
              fontSize: 50.0
            ),),
          )
          :GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: allProducts.length,
        itemBuilder: (_, index) {
          return GestureDetector(
            onTap: () {
             goTo(context, ProductDetailsScreen(
               product: allProducts[index],
             ));
            },
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.grey,
                        Colors.green.shade300,
                      ]),
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45,
                      blurRadius: 8.0,
                      offset: Offset(5, 1.5),
                    )
                  ]),
              alignment: Alignment.center,
              margin: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Expanded(
                      flex: 2,
                      child: allProducts[index].img==null?Center(child: Text('No Image')):Image.file(
                        File(allProducts[index].img!.path),
                      ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.black45,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(8.0),
                            bottomLeft: Radius.circular(8.0),
                          )),
                      child: Text(
                      '${allProducts[index].name}',
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
