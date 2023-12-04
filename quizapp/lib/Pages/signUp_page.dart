import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:image_picker/image_picker.dart';

import '../Util/Paiter.dart';
import '../Widgets/DefaultTextformFild.dart';
import '../Widgets/LargeButtonOfSignIn.dart';
import '../Widgets/passwordTextformfild.dart';
import '../Controllers/student_controller.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  File? _selectedImage;
  bool? isRemember = false;
  bool isvisible = false;
  bool? isPassword = true;
  late Size size;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final String _imageUrl = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              SizedBox(
                width: size.width,
                height: size.height * 0.2,
                child: CustomPaint(
                  size: Size(size.width,
                      size.height), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                  painter: SignUpShape(context: context),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                        child: InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text("Select an Image from"),
                                  actionsAlignment:
                                      MainAxisAlignment.spaceAround,
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        _pickImageFromGallery();
                                      },
                                      child: const Text("Gallary"),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        _pickImageFromCamera();
                                      },
                                      child: const Text("Camera"),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: AvatarGlow(
                            glowColor: Theme.of(context).colorScheme.primary,
                            animate: true,
                            endRadius: 80.0,
                            duration: const Duration(milliseconds: 4000),
                            repeat: true,
                            showTwoGlows: true,
                            repeatPauseDuration:
                                const Duration(milliseconds: 500),
                            child: Material(
                              // Replace this child with your own
                              elevation: 8.0,
                              shape: const CircleBorder(),
                              child: CircleAvatar(
                                backgroundColor:
                                    Theme.of(context).colorScheme.onBackground,
                                radius: 47,
                                child: CircleAvatar(
                                  backgroundColor: Colors.grey[100],
                                  radius: 45.0,
                                  child: _selectedImage != null
                                      ? ClipOval(
                                          child: Image.file(
                                            _selectedImage!,
                                            fit: BoxFit.cover,
                                            width: 90.0,
                                            height: 90.0,
                                          ),
                                        )
                                      : Image.asset(
                                          "Assets/Images/SignUp/ProfileAvatar.png",
                                          fit: BoxFit.cover,
                                          width: 90.0,
                                          height: 90.0,
                                        ),
                                ),
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
                            key: _formKey,
                            child: SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Sign Up",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                    ],
                                  ),
                                  // This is the plase where in put fields started
                                  DefaultTextformWidget(
                                    lableText: "Name",
                                    prefixIcon: const Icon(Icons.person),
                                    size: size,
                                    textController: _nameController,
                                    inputType: TextInputType.name,
                                    expression: RegExp(r'^[a-zA-Z]{1,45}$'),
                                  ),
                                  DefaultTextformWidget(
                                    lableText: "Emaill",
                                    prefixIcon: const Icon(Icons.mail),
                                    size: size,
                                    textController: _emailController,
                                    inputType: TextInputType.emailAddress,
                                    expression: RegExp(
                                        r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$'),
                                  ),
                                  DefaultTextformWidget(
                                    lableText: "Phone Number",
                                    prefixIcon: const Icon(Icons.phone),
                                    size: size,
                                    textController: _phoneController,
                                    inputType: TextInputType.phone,
                                    expression: RegExp(r'^\d{10}$'),
                                  ),
                                  ConstrainedBox(
                                    constraints: BoxConstraints(
                                      maxHeight: size.height * 0.03,
                                      maxWidth: size.width,
                                      minHeight: size.height * 0.01,
                                      minWidth: size.width,
                                    ),
                                  ),
                                  PasswordTextField(
                                    isvisible: isvisible,
                                    size: size,
                                    passwordController: _passwordController,
                                    Expression: RegExp(r'^[\w\d]{8,}$'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15.0),
                                    child: largeButtonWidget(
                                      lable: "SignUp",
                                      size: size,
                                      formKey: _formKey,
                                      myFunction: () {
                                        // Call the login function here
                                        student_controller.signUp(
                                            _nameController.text,
                                            _emailController.text,
                                            _phoneController.text,
                                            _passwordController.text,
                                            _imageUrl);
                                      },
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Do you have an account?",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, "/SignIn");
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
            ],
          ),
        ),
      ),
    );
  }

  Future _pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _selectedImage = File(returnedImage!.path);
      Navigator.of(context).pop();
    });
  }

  Future _pickImageFromCamera() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      _selectedImage = File(returnedImage!.path);
      Navigator.of(context).pop();
    });
  }
}
