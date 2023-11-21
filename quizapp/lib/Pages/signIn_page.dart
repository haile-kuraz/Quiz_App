import 'dart:ui' as ui;
import 'package:flutter/material.dart';

import '../../Util/Paiter.dart';
import '../Widgets/DefaultTextformFild.dart';
import '../Widgets/LargeButtonOfSignIn.dart';
import '../Widgets/passwordTextformfild.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool? isRemember = false;
  bool isvisible = false;
  bool? isPassword = true;
  late Size size;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: CustomPaint(
            size: Size(size.width,
                size.height), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
            painter: SignInPainter(context: context),

            child: Column(
              children: [
                Image.asset("Assets/Images/login.png"),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Form(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10),
                    child: Column(
                      children: [
                        // This is the Text form fild of Login page
                        DefaultTextformWidget(
                          inputType: TextInputType.emailAddress,
                          lableText: "Emaill",
                          prefixIcon: const Icon(Icons.mail),
                          size: size,
                          textController: _emailController,
                        ),
                        PasswordTextField(
                          isvisible: isvisible,
                          passwordController: _passwordController,
                          size: size,
                        ),

                        // This is the checkBox Area for Keeping Loged in login page
                        Row(
                          children: [
                            Checkbox(
                              activeColor:
                                  Theme.of(context).colorScheme.tertiary,
                              value: isRemember,
                              onChanged: (value) {
                                setState(() {
                                  isRemember = value;
                                });
                              },
                            ),
                            Text(
                              "Keep me Logedin",
                              style: Theme.of(context).textTheme.bodySmall,
                            )
                          ],
                        ),

                        // this is the text Button of login

                        largeButtonWidget(lable: "Signin", size: size),

                        // This is the forgotpassword Button
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Forgot your Password?",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account yet?",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, "/SignUp");
                              },
                              child: const Text(
                                "Register",
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
