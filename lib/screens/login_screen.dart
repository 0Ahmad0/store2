import 'package:flutter/material.dart';
import 'package:reham_1/constants/colors.dart';
import 'package:reham_1/widget/all_widget.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();


  String? passwordController;
  String? emailController;

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
              'SignIn',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: getScreenSize(context).width * 0.15,
                fontWeight: FontWeight.w900,
              ),
            ),
          )),
          Expanded(
            flex: 3,
            child: Form(
              key: formKey,
              child: ListView(
                padding: EdgeInsets.all(10.0),
                children: [
                  CustomeTextFiled(
                    // controller: emailController,
                    hint: 'Email',
                    icon: Icons.email,
                    onChange: (String? value) {
                      emailController = value!;
                    },
                    validate: (String? value) {
                      return (value!.isEmpty||!value.contains('@'))
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
                      return (value!.isEmpty||value.length<8)
                          ? 'Wrong password will be > 8'
                          : null;
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

                      if (formKey.currentState!.validate()) {
                        print('OK');
                        goTo(context, HomeScreen());
                      } else {
                      }
                    },
                    child: Text('Login'),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t Have Account?'),
                      TextButton(onPressed: () {
                        // goTo(context: context, widget: SignUpScreen());
                      }, child: Text('Sign Up'))
                    ],
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


