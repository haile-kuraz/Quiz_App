import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Pages/MainPages/help_page.dart';
import 'Pages/MainPages/home_page.dart';
import 'Pages/MainPages/mainCategories_page.dart';
import 'Pages/MainPages/question_page.dart';
import 'Pages/MainPages/setting_page.dart';
import 'Pages/MainPages/subcategory_page.dart';
import 'Pages/OnbordingScreen.dart';
import 'Pages/SplashScreen.dart';
import 'Pages/signIn_Page.dart';
import 'Pages/signUp_page.dart';
import 'Widgets/CountDownTimer.dart';
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
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AuthProvider>(
        create: (context) => AuthProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => Periferance(prefs: pref),
      ),
    ],
    child: MyApp(
      // lightData: lightData,
      // darkData: darkData,
      pref: pref,
    ),
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
    var PeriferanceState = Provider.of<Periferance>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: PeriferanceState.getIsDark() == true ? darkTheme : lightTheme,
      // theme: darkTheme,

      initialRoute: "/",
      routes: {
        "/": (context) => const SplashScreen(),
        "/SignIn": (context) => const SignIn(),
        "/onbording": (context) => const OnbordingPage(),
        "/SignUp": (context) => const SignUp(),
        "/home": (context) => const Home(),
        "/Setting": (context) => const SettingPage(),
        "/Subcategory": (context) => const Subcategory_Page(),
        "/Help": (context) => Help_page(),
        "/Question": (context) => const Question_page(),
        "/Timmer": (context) => const CountDownTimmer(),
      },

      // home: Home(),
    );
  }
}
