import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/translate/codegen_loader.g.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Pages/MainPages/help_page.dart';
import 'Pages/MainPages/home_page.dart';
import 'Pages/MainPages/question_page.dart';
import 'Pages/MainPages/setting_page.dart';
import 'Pages/MainPages/subcategory_page.dart';
import 'Pages/OnbordingScreen.dart';
import 'Pages/SplashScreen.dart';
import 'Pages/signIn_Page.dart';
import 'Pages/signUp_page.dart';
import 'Provider/DataProvider.dart';
import 'Provider/LanguageProvider.dart';
import 'Widgets/CountDownTimer.dart';
import 'Provider/AuthProvider.dart';
import 'Provider/PeriferanceProvider.dart';
import './firebase_options.dart';

// import 'Util/Color.dart';
import 'Util/Theme._date.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Request notification permission if not granted or explicitly denied
  // PermissionStatus notificationStatus = await Permission.notification.status;
  // if (notificationStatus.isDenied || notificationStatus.isRestricted) {
  //   await Permission.notification.request();
  // }

  // // Initialize background service
  // await initializeService();

  SharedPreferences pref = await SharedPreferences.getInstance();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('am'),
        Locale('ti'),
        Locale('om')
      ],
      path: 'Assets/translate',
      assetLoader: const CodegenLoader(),
      fallbackLocale: const Locale('en'),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<AuthProvider>(
            create: (context) => AuthProvider(),
          ),
          ChangeNotifierProvider<LanguageProvider>(
            create: (context) => LanguageProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => Periferance(prefs: pref),
          ),
          ChangeNotifierProvider(
            create: (context) => DataProvider(),
          ),
        ],
        child: MyApp(
          pref: pref,
        ),
      ),
    ),
  );
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
    var languageProvider = Provider.of<LanguageProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //  onGenerateTitle: (context) => AppLocalizations.of(context).title,
      theme: PeriferanceState.getIsDark() == true ? darkTheme : lightTheme,
      // theme: darkTheme,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: languageProvider.currentLocale,

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
