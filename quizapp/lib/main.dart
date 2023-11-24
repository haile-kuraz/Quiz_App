import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Pages/MainPages/home_page.dart';
import 'Pages/OnbordingScreen.dart';
import 'Pages/SplashScreen.dart';
import 'Pages/signIn_Page.dart';
import 'Pages/signUp_page.dart';
import 'Provider/AuthProvider.dart';
import 'Util/Color.dart';
import 'Util/Theme._date.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Map<String, dynamic> lightData = await colors.getLightData();
  Map<String, dynamic> darkData = await colors.getDarkData();
  runApp(MyApp(
    lightData: lightData,
    darkData: darkData,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.lightData, required this.darkData});
  final Map lightData;
  final Map darkData;

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
            create: (context) => AuthProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: darkTheme,
        initialRoute: "/home",
        routes: {
          // "/": (context) => const SplashScreen(),
          "/SignIn": (context) => const SignIn(),
          "/onbording": (context) => OnbordingPage(),
          "/SignUp": (context) => const SignUp(),
          "/home": (context) => const Home(),
        },

        // home: Home(),
      ),
    );
  }
}
