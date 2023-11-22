import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

// import '../providers/PeriferanceProvider.dart';

class OnbordingPage extends StatelessWidget {
  OnbordingPage({super.key});

  var PeriferianceState;
  var PeriferianceUpdate;
  @override
  Widget build(BuildContext context) {
    // PeriferianceState = Provider.of<PeriferanceDataProvider>(context);
    // PeriferianceUpdate =
    //     Provider.of<PeriferanceDataProvider>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: OnBoardingSlider(
            onFinish: () async {
              // await PeriferianceUpdate.OnBordingSetter();

              // await PeriferianceUpdate.updateIsOnboardingShowing(false);
              Navigator.pushReplacementNamed(context, '/SignIn');
            },
            skipTextButton: const Text("Skip"),
            pageBackgroundColor: Theme.of(context).colorScheme.background,
            controllerColor: Theme.of(context).colorScheme.tertiary,
            finishButtonText: "Start",
            finishButtonTextStyle:
                TextStyle(color: Theme.of(context).colorScheme.tertiary),
            finishButtonStyle: FinishButtonStyle(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              backgroundColor: Theme.of(context).primaryColor,
            ),
            imageVerticalOffset: 20,
            totalPage: 3,
            headerBackgroundColor: Theme.of(context).colorScheme.background,
            background: [
              Image.asset(
                "Assets/Images/onbording/1.png",
                fit: BoxFit.cover,
                width: size.width,
              ),
              Image.asset(
                "Assets/Images/onbording/2.png",
                fit: BoxFit.cover,
                width: size.width,
              ),
              Image.asset(
                "Assets/Images/onbording/3.png",
                // fit: BoxFit.cover,
                width: size.width,
              ),
            ],
            speed: 1.8,
            pageBodies: [
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      height: 450,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Wellcome to Kuraztech ',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .tertiaryContainer
                                  .withOpacity(0.7),
                            ),
                      ),
                    ),
                    Text(
                      "Take your exam preparation to new heights with our interactive Quiz App, offering a vibrant and immersive learning experience.",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .tertiaryContainer
                              .withOpacity(0.4)),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      height: 450,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Supports 3+ Language',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .tertiaryContainer
                                  .withOpacity(0.7),
                            ),
                      ),
                    ),
                    Text(
                      "Kuraztech suports more than 3 languages currently, which is English,Amharic,Oromiffa and Tigeregna",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .tertiaryContainer
                              .withOpacity(0.4)),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      height: 450,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Have 20+ Categories  ',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .tertiaryContainer
                                  .withOpacity(0.7),
                            ),
                      ),
                    ),
                    Text(
                      "QuizApp suports more than 20 Categories currently, and these Categories are divided in to Three.",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .tertiaryContainer
                              .withOpacity(0.4)),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
