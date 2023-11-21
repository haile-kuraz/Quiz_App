import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
// import 'package:audioplayers/audioplayers.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // final player = AudioPlayer();
  @override
  @override
  void initState() {
    AssetsAudioPlayer.newPlayer().open(
      Audio('Assets/Sounds/Effects/dramIntro.mp3'),
      autoStart: true,
    );
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, "/onbording");
      /*  CheckSignedIn(); */
    });
    super.initState();
  }

  // void CheckSignedIn() async {
  //   var AuthState = Provider.of<AuthProvider>(context, listen: false);
  //   bool isLoggedIn = await AuthState.isLoogedIn();
  //   if (isLoggedIn) {
  //     Navigator.pushNamed(context, "/home");
  //   } else {
  //     Navigator.pushNamed(context, "/loginPage");
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Animate(
              effects: const [
                FadeEffect(
                  duration: Duration(seconds: 2),
                ),
                ScaleEffect(
                  duration: Duration(seconds: 2),
                )
              ],
              child: Image.asset('Assets/Images/KurazLogo.png'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Animate(
                  effects: const [
                    MoveEffect(
                      begin: Offset(-70, 0),
                      duration: Duration(seconds: 2),
                    ),
                    FadeEffect(),
                  ],
                  child: Image.asset('Assets/Images/Quiz.png'),
                ),
                Animate(
                  effects: const [
                    MoveEffect(
                      begin: Offset(70, 0),
                      duration: Duration(seconds: 2),
                    ),
                    FadeEffect(),
                  ],
                  child: Image.asset('Assets/Images/App.png'),
                ),
              ],
            ),
            const SizedBox(
              height: 70,
            ),
          ],
        ),
      ),
    );
  }

  // void _playSound(String assetPath) async {
  //   await player.play(AssetSource(assetPath));
  // }
}
