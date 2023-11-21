import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../Widgets/DefaultTextformFild.dart';
import '../Widgets/LargeButtonOfSignIn.dart';
import '../Widgets/passwordTextformfild.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool? isRemember = false;
  bool isvisible = false;
  bool? isPassword = true;
  late Size size;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  @override
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 48.0),
                  child: Animate(
                    effects: const [
                      FadeEffect(),
                      MoveEffect(
                        begin: Offset(70, 0),
                        duration: Duration(seconds: 2),
                      )
                    ],
                    child: AvatarGlow(
                      glowColor: Theme.of(context).colorScheme.primary,
                      animate: true,
                      endRadius: 80.0,
                      duration: const Duration(milliseconds: 4000),
                      repeat: true,
                      showTwoGlows: true,
                      repeatPauseDuration: const Duration(milliseconds: 500),
                      child: Material(
                        // Replace this child with your own
                        elevation: 8.0,
                        shape: const CircleBorder(),
                        child: CircleAvatar(
                          backgroundColor: Colors.grey[100],
                          radius: 45.0,
                          child: Image.asset(
                            "Assets/Images/SignUp/ProfileAvatar.png",
                            // height: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Animate(
                      effects: const [
                        FadeEffect(),
                        MoveEffect(
                          begin: Offset(70, 0),
                          duration: Duration(seconds: 2),
                        )
                      ],
                      child: Form(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Sign Up",
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                ],
                              ),
                              // This is the plase where in put fields started
                              DefaultTextformWidget(
                                lableText: "Full Name",
                                prefixIcon: const Icon(Icons.person),
                                size: size,
                                textController: _nameController,
                                inputType: TextInputType.name,
                              ),
                              DefaultTextformWidget(
                                lableText: "Emaill",
                                prefixIcon: const Icon(Icons.mail),
                                size: size,
                                textController: _emailController,
                                inputType: TextInputType.emailAddress,
                              ),
                              DefaultTextformWidget(
                                lableText: "Phone Number",
                                prefixIcon: const Icon(Icons.phone),
                                size: size,
                                textController: _phoneController,
                                inputType: TextInputType.phone,
                              ),
                              PasswordTextField(
                                isvisible: isvisible,
                                size: size,
                                passwordController: _passwordController,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15.0),
                                child: largeButtonWidget(
                                  lable: "SignUp",
                                  size: size,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Do you have an account?",
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, "/SignIn");
                                    },
                                    child: const Text(
                                      "Sign In",
                                    ),
                                  ),
                                ],
                              ),

                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Divider(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .tertiary,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        child: Text(
                                          "Or Continue With",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                      ),
                                      Expanded(
                                        child: Divider(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .tertiary,
                                        ),
                                      ),
                                    ],
                                  ),
                                  //  this the the place where all social medias are
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 50.0, vertical: 2),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: () {},
                                          child: Image.asset(
                                              "Assets/Images/SignUp/Linkedin.png"),
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: Image.asset(
                                              "Assets/Images/SignUp/Google.png"),
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: Image.asset(
                                              "Assets/Images/SignUp/Facebook.png"),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
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
