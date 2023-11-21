import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        theme: lightTheme,
        initialRoute: "/ ",
        routes: {
          "/": (context) => const SplashScreen(),
          "/SignIn": (context) => const SignIn(),
          "/onbording": (context) => OnbordingPage(),
          "/home": (context) => const Home(),
          "/SignUp": (context) => const SignUp(),
        },

        // home: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("haha")),
      body: const SafeArea(
        child: Center(
          child: Text("This is the Home Page"),
        ),
      ),
    );
  }
}
