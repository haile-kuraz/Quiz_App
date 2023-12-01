import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../Util/Paiter.dart';
import '../Provider/PeriferanceProvider.dart';
import '../Widgets/DefaultTextformFild.dart';
import '../Widgets/LargeButtonOfSignIn.dart';
import '../Widgets/passwordTextformfild.dart';
import '../Controllers/student_controller.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool? isRemember = false;
  bool isvisible = false;
  bool? isPassword = true;
  bool isProcessing = false;
  var PeriferianceState;
  var PeriferianceUpdate;

  late Size size;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    PeriferianceState = Provider.of<Periferance>(context);
    PeriferianceUpdate = Provider.of<Periferance>(context, listen: false);
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: isProcessing,

        opacity: 0.5,
        color: Colors.black,
        progressIndicator: CircularProgressIndicator(),
        // offset: double
        dismissible: true,
        blur: 0.1,
        child: SingleChildScrollView(
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
                Animate(
                  effects: const [
                    FadeEffect(),
                    MoveEffect(
                      begin: Offset(0, 50),
                      duration: Duration(seconds: 1),
                    )
                  ],
                  child: Form(
                    key: _formKey,
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
                            expression: RegExp(
                                r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$'),
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
                            passwordController: _passwordController,
                            size: size,
                            Expression: RegExp(r'^[\w\d]{8,}$'),
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

                          largeButtonWidget(
                            lable: "Signin",
                            size: size,
                            formKey: _formKey,
                            myFunction: () async {
                              // Call the login function here
                              setState(() {
                                isProcessing = true;
                              });
                              await student_controller.login(
                                _emailController.text,
                                _passwordController.text,
                              );
                              setState(() {
                                isProcessing = false;
                              });
                              await PeriferianceUpdate.setOnboardingStatus(
                                  false);
                            },
                          ),

                          // This is the forgotpassword Button
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed("/home");
                            },
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
