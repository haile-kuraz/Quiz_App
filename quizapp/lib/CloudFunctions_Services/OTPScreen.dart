// // ignore: file_names
// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
// import 'package:zonerapp/Widget/bottomSheet.dart';
// import '../Widget/LoginButton.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import '../api/customer_signup.dart';

// class OTPScreen extends StatefulWidget {
//   const OTPScreen({
//     super.key,
//   });
//   @override
//   State<OTPScreen> createState() => _OTPScreenState();
// }

// class _OTPScreenState extends State<OTPScreen> {
//   TextEditingController controller = TextEditingController();
//   String? verificationId;
//   String smsCode = "";
//   bool _validate = false;
//   String? email;
//   String? phoneNo;
//   String? password;
//   String? fullName;
//   bool isLoading = false;
//   bool isError = false;
//   String otpMessage = "";
//   bool isCodeSent = false;
//   bool isLogin = false;
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(Duration.zero, () {
//       // Retrieve the arguments using ModalRoute
//       final Map<String, dynamic> args =
//           ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
//       setState(() {
//         email = args['email'];
//         phoneNo = args['phoneNo'];
//         password = args['password'];
//         fullName = args['fullName'];
//         isLogin = args['isLogin'];
//         print("the phoneNo passed $phoneNo is login $isLogin");
//       });

//       verifyPhoneNumber(phoneNo ?? "");
//     });
//   }

//   int _resendTimeout = 60; // seconds
//   Timer? _timer;
//   bool isMounted = true;
//   @override
//   void dispose() {
//     isMounted = false;
//     _timer?.cancel(); // Cancel the timer to avoid memory leaks
//     super.dispose();
//   }

//   void startResendTimer() {
//     _timer = Timer.periodic(Duration(seconds: 1), (timer) {
//       if (isMounted) {
//         setState(() {
//           if (_resendTimeout > 0) {
//             _resendTimeout--;
//           } else {
//             _timer?.cancel(); // Stop the timer when the timeout is reached
//           }
//         });
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     print(isLogin);
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//         backgroundColor: Colors.white,
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(
//               width: size.width * 0.5,
//               child: Image.asset('Assets/Images/Logo.png'),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(bottom: 28.0, top: 5),
//               child: Column(
//                 children: const [
//                   Text(
//                     "OTP VERIFICATION",
//                     style: TextStyle(
//                       fontWeight: FontWeight.w700,
//                       fontSize: 14,
//                     ),
//                   ),
//                   Text(
//                     "Enter the OTP sent to the mobile",
//                     style: TextStyle(
//                       fontWeight: FontWeight.w400,
//                       color: Color(0xFF6D6D6D),
//                       fontSize: 12,
//                     ),
//                   ),
//                   Text(
//                     "number you entered",
//                     style: TextStyle(
//                       fontWeight: FontWeight.w400,
//                       color: Color(0xFF6D6D6D),
//                       fontSize: 12,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(
//                 vertical: 15.0,
//                 horizontal: 10,
//               ),
//               child: PinCodeTextField(
//                 appContext: context,
//                 controller: controller,
//                 length: 6,
//                 cursorHeight: 19,
//                 cursorColor: Colors.black,
//                 enableActiveFill: true,
//                 textStyle: const TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.normal,
//                 ),
//                 boxShadows: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.5),
//                     blurRadius: 1,
//                     blurStyle: BlurStyle.normal,
//                     spreadRadius: 0,
//                     offset: const Offset(0, 4),
//                   )
//                 ],
//                 inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//                 pinTheme: PinTheme(
//                   shape: PinCodeFieldShape.box,
//                   fieldWidth: 50,
//                   activeFillColor: Colors.white,
//                   borderRadius: const BorderRadius.all(
//                     Radius.circular(10),
//                   ),
//                   inactiveColor: Colors.black,
//                   borderWidth: 1,
//                   activeColor: Colors.blue,
//                   selectedColor: Colors.black,
//                   selectedFillColor: Colors.white,
//                   inactiveFillColor: Colors.white,
//                 ),
//                 onChanged: (value) {
//                   // setState(() {
//                   //   smsCode = value;
//                   // });
//                   // ignore: avoid_print
//                   print(value);
//                 },
//                 onCompleted: (value) {
//                   print("onCompleted $value");
//                   smsCode = value;
//                   verifyOTP(smsCode);
//                 },
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 28.0),
//               child: Column(
//                 children: [
//                   SizedBox(
//                     width: size.width * 0.65,
//                     child: ElevatedButton(
//                         onPressed: () {
//                           print(controller.text);
//                           if (controller.text.isEmpty) {
//                             setState(() {
//                               _validate = true;
//                             });
//                           }
//                           // Navigator.pushNamed(context, "/NewOrder");
//                         },
//                         style: ButtonStyle(
//                             minimumSize: MaterialStatePropertyAll(
//                               Size(
//                                   MediaQuery.of(context).size.width * 0.68, 40),
//                             ),
//                             // padding: MaterialStatePropertyAll(EdgeInsets.all(10)),
//                             elevation: MaterialStatePropertyAll(0),
//                             backgroundColor: MaterialStatePropertyAll(
//                               Colors.amber,
//                             )),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Padding(
//                                 padding: const EdgeInsets.all(11.0),
//                                 child: !isLoading
//                                     ? Text(
//                                         "VERIFY CODE",
//                                         style: TextStyle(
//                                           color: Colors.black,
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 12,
//                                         ),
//                                       )
//                                     : Text("Loading...")),
//                           ],
//                         )),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 18.0),
//                     child: LoginButton(
//                       register: true,
//                       icon: Icons.person,
//                       label: _resendTimeout > 0
//                           ? "RESEND CODE(${_resendTimeout}sec)"
//                           : "RESEND CODE",
//                       col: Colors.black,
//                       Tcol: Colors.white,
//                       Icol: Colors.yellow,
//                       hasIcon: false,
//                       onPressed: () {
//                         _resendTimeout > 0 ? null : verifyPhoneNumber(phoneNo!);
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ));
//   }

// //verify  phonenumber
//   Future<void> verifyPhoneNumber(String phoneNumber) async {
//     verificationCompleted(AuthCredential authCredential) async {
//       print("Phone number automatically verified and signed in.");
//     }

//     verificationFailed(FirebaseAuthException authException) {
//       print(authException);
//       setState(() {
//         isLoading = false;
//       });
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//         backgroundColor: Colors.red,
//         content: Text('Phone Verification Failed'),
//       ));
//       Navigator.pop(context);
//     }

//     codeSent(String verificationId, [int? forceResendingToken]) {
//       setState(() {
//         print("now excuted ");

//         this.verificationId = verificationId;
//       });
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//         backgroundColor: Colors.green,
//         content: Text('Code Sent To Your Phone'),
//       ));
//       setState(() {
//         isLoading = false;
//       });
//     }

//     codeAutoRetrievalTimeout(String verificationId) {
//       setState(() {});
//     }

//     await FirebaseAuth.instance.verifyPhoneNumber(
//       phoneNumber: phoneNumber,
//       verificationCompleted: verificationCompleted,
//       verificationFailed: verificationFailed,
//       codeSent: codeSent,
//       codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
//     );

//     startResendTimer();
//   }

// // Add a new function to verify the OTP entered by the user
//   Future<void> verifyOTP(String otp) async {
//     setState(() {
//       isLoading = true;
//     });
//     // Create the AuthCredential with the verificationId and the entered OTP
//     AuthCredential authCredential = PhoneAuthProvider.credential(
//       verificationId: verificationId ?? "",
//       smsCode: otp,
//     );

//     // Sign in with the AuthCredential
//     try {
//       UserCredential userCredential =
//           await FirebaseAuth.instance.signInWithCredential(authCredential);
//       // Verification successful, you can access the user details through `userCredential.user`

//       // ignore: use_build_context_synchronously
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//         backgroundColor: Colors.green,
//         content: Text('Otp Verified'),
//       ));
//       isLogin ? "" : signUpToHasura();
//       print(
//           "OTP verification successful. User ID: ${userCredential.user?.uid}");
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//         backgroundColor: Colors.red,
//         content: Text('OTP Verification failed'),
//       ));
//       print("OTP verification failed: $e");
//     }
//   }

// // Call this function with the entered OTP to verify it
// // Example:
// // verifyOTP("123456");

// //signup after phone verification
//   void signUpToHasura() async {
//     try {
//       bool success = await signUp(
//         email!,
//         fullName!,
//         phoneNo!,
//         password!,
//       );
//       if (success == true) {
//         // ignore: use_build_context_synchronously
//         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//           backgroundColor: Colors.green,
//           content: Text('Successfully Signedup'),
//         ));
//         Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
//       } else {
//         // ignore: use_build_context_synchronously
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           backgroundColor: Colors.red,
//           content: const Text('Signup  failed'),
//           action: SnackBarAction(
//               label: "Try Again",
//               onPressed: () {
//                 Navigator.of(context).pop();
//               }),
//         ));
//         print('Signup failed.');
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         backgroundColor: Colors.red,
//         content: const Text('Error in Signup'),
//         action: SnackBarAction(
//             label: "Try Again",
//             onPressed: () {
//               Navigator.of(context).pop();
//             }),
//       ));
//       // Handle the signup error and display a message to the user.
//       print('Signup Unsucces: $e');
//     }
//     setState(() {
//       isLoading = false;
//     });
//   }
// }