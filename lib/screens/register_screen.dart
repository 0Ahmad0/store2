import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reham_1/constants/colors.dart';
import 'package:reham_1/widget/all_widget.dart';

import 'home_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? userNameController;
  String? emailController;
  String? passwordController;

  String? rePasswordController;

  bool showPass = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: textColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.elliptical(500, 200),
                      bottomRight: Radius.elliptical(500, 200),
                    )
                ),
                child:   Text(
                  'SignUp',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: getScreenSize(context).width * 0.15,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              )),
          Expanded(
            flex: 4,
            child: Form(
              key: formKey,
              child: ListView(
                padding: EdgeInsets.all(10.0),
                children: [
                  CustomeTextFiled(
                    // controller: userNameController,
                    hint: 'UserName',
                    icon: Icons.person,
                    onChange: (String? value) {
                      userNameController = value!;
                    },
                    validate: (String? value) {
                      return ((value!.isEmpty))
                          ? 'UserName Can\'t be Empty'
                          : null;
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  CustomeTextFiled(
                    // controller: emailController,
                    hint: 'Email',
                    icon: Icons.email,
                    onChange: (String? value) {
                      emailController = value!;
                    },
                    validate: (String? value) {
                      return ((value!.isEmpty) || (!value.contains('@')))
                          ? 'Do not use the @ char.'
                          : null;
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    // controller: passwordController,
                    obscureText: showPass,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        prefixIcon:
                        Icon(!showPass ? Icons.lock_open : Icons.lock_outline),
                        suffixIcon: IconButton(
                          icon: Icon(
                              !showPass ? Icons.visibility : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              showPass = !showPass;
                            });
                          },
                        ),
                        hintText: 'Password'),
                    onChanged: (String? value) {
                      passwordController = value!;
                    },
                    validator: (String? value) {
                      return (value!.isEmpty) ? 'Wrong password' : null;
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    // controller: rePasswordController,
                    obscureText: showPass,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        prefixIcon:
                        Icon(!showPass ? Icons.lock_open : Icons.lock_outline),
                        suffixIcon: IconButton(
                          icon: Icon(
                              !showPass ? Icons.visibility : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              showPass = !showPass;
                            });
                          },
                        ),
                        hintText: 'Confirm Password'),
                    onChanged: (String? value) {
                      rePasswordController = value!;
                    },
                    validator: (String? value) {
                      return ((value!.isEmpty)||(
                          rePasswordController != passwordController
                      )) ? 'not same password' : null;
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(20.0),
                    ),
                    onPressed: () {
                      Map creds = {
                        'userName': userNameController,
                        'email': emailController,
                        'password': passwordController,
                        'confirm': rePasswordController,
                        'devicename': 'mobile'
                      };
                      if (formKey.currentState!.validate()) {
                        goTo(context, HomeScreen());

                      } else {

                      }
                    },
                    child: Text('Sign Up'),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already Have Account?'),
                      TextButton(onPressed: () {
                        Navigator.pop(context);
                      }, child: Text('Sign In'))
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: Divider(color: Colors.green,)),
                      const SizedBox(
                        width: 20.0,
                      ),
                      CircleAvatar(child: Text("OR"),),
                      const SizedBox(
                        width: 20.0,
                      ),
                      Expanded(child: Divider(color: Colors.green)),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  buildRowSoshial()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
