import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Pages/MainPages/home_page.dart';
import 'Pages/MainPages/setting_page.dart';
import 'Pages/MainPages/subcategory_page.dart';
import 'Pages/OnbordingScreen.dart';
import 'Pages/SplashScreen.dart';
import 'Pages/signIn_Page.dart';
import 'Pages/signUp_page.dart';
import 'Provider/AuthProvider.dart';
import 'Provider/PeriferanceProvider.dart';
// import 'Util/Color.dart';
import 'Util/Theme._date.dart';
import 'Controllers/student_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Map<String, dynamic> lightData = await colors.getLightData();
  // Map<String, dynamic> darkData = await colors.getDarkData();
  SharedPreferences pref = await SharedPreferences.getInstance();

  runApp(MyApp(
    // lightData: lightData,
    // darkData: darkData,
    pref: pref,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.pref});

  final SharedPreferences pref;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Periferance(prefs: widget.pref),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        initialRoute: "/SignUp",
        routes: {
          // "/": (context) => const SplashScreen(),
          "/SignIn": (context) => const SignIn(),
          "/onbording": (context) => const OnbordingPage(),
          "/SignUp": (context) => const SignUp(),
          "/home": (context) => const Home(),
          "/Setting": (context) => const SettingPage(),
          "/Subcategory": (context) => const Subcategory_Page(),
        },

        // home: Home(),
      ),
    );
  }
}
