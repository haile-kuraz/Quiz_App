import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../Provider/PeriferanceProvider.dart';
import '../../Widgets/SettingIcons.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool timer = true;
  List<Map> LanguageData = [
    {
      "name": "English",
      "value": "en",
    },
    {
      "name": "አማርኛ",
      "value": "en",
    },
    {
      "name": "ትግሪኛ",
      "value": "en",
    },
    {
      "name": "Afaan Oromo",
      "value": "en",
    },
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var PeriferanceUpdate = Provider.of<Periferance>(context, listen: false);
    var PeriferanceState = Provider.of<Periferance>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 1,
        title: const Text("Settings"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "System",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onTertiaryContainer,
                    ),
              ),
              // This is the setting to set volume
              ListTile(
                leading: const SettingIcons(
                  icon: FontAwesomeIcons.volumeHigh,
                ),
                title: Text(
                  "Sound",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                trailing: Switch(
                  activeColor: Theme.of(context).colorScheme.primary,
                  value: PeriferanceState.getIsthereSound() ?? true,
                  onChanged: (value) {
                    PeriferanceUpdate.setIsthereSound(value);
                  },
                ),
              ),
              // This is the setting to set timer
              ListTile(
                leading: const SettingIcons(
                  icon: FontAwesomeIcons.solidClock,
                ),
                title: Text(
                  "Timer",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                trailing: Switch(
                  activeColor: Theme.of(context).colorScheme.primary,
                  value: PeriferanceState.getisTimershowing() ?? true,
                  onChanged: (value) {
                    PeriferanceUpdate.setisTimershowing(value);
                  },
                ),
              ),
              Text(
                "Preferance",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onTertiaryContainer,
                    ),
              ),
              // This is the setting to set nightmode
              ListTile(
                leading: const SettingIcons(
                  icon: Icons.brightness_4,
                ),
                title: Text(
                  "Night Mode",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                trailing: Switch(
                  activeColor: Theme.of(context).colorScheme.primary,
                  value: PeriferanceState.getIsDark() ?? false,
                  onChanged: (value) {
                    PeriferanceUpdate.setIsDarkStatus(value);
                    Taskbarupdater(PeriferanceUpdate);
                  },
                ),
              ),
              // This is the setting to set Language
              ListTile(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return _LanguagePopUpbuilder(
                          size: size, LanguageData: LanguageData);
                    },
                  );
                },
                leading: const SettingIcons(
                  icon: FontAwesomeIcons.language,
                ),
                title: Text(
                  "Language",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                trailing: const Icon(FontAwesomeIcons.chevronRight),
              ),
              // This is the setting to set difficulty
              ListTile(
                onTap: () {},
                leading: const SettingIcons(
                  icon: Icons.signal_cellular_alt,
                ),
                title: Text(
                  "Difficulty",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                trailing: const Icon(FontAwesomeIcons.chevronRight),
              ),
              // This is the setting to set font
              ListTile(
                onTap: () {},
                leading: const SettingIcons(
                  icon: FontAwesomeIcons.font,
                ),
                title: Text(
                  "Font",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                trailing: const Icon(FontAwesomeIcons.chevronRight),
              ),

              Text(
                "Help and Privacy",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onTertiaryContainer,
                    ),
              ),
              // This is the setting to see privacy and policy
              ListTile(
                onTap: () {},
                leading: const SettingIcons(
                  icon: FontAwesomeIcons.shieldHalved,
                ),
                title: Text(
                  "Privacy and Security",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                trailing: const Icon(FontAwesomeIcons.chevronRight),
              ),
              // This is the setting to get help
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, "/Help");
                },
                leading: const SettingIcons(
                  icon: FontAwesomeIcons.solidCircleQuestion,
                ),
                title: Text(
                  "Help",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                trailing: const Icon(FontAwesomeIcons.chevronRight),
              ),
              // This is the setting to set Rate for app
              ListTile(
                onTap: () {},
                leading: const SettingIcons(
                  icon: FontAwesomeIcons.starHalfStroke,
                ),
                title: Text(
                  "Rate our App",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                trailing: const Icon(FontAwesomeIcons.chevronRight),
              ),
              // This is the setting to Delete the account
              ListTile(
                onTap: () {},
                leading: const SettingIcons(
                  icon: FontAwesomeIcons.userXmark,
                ),
                title: Text(
                  "Delete an Account",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                trailing: const Icon(FontAwesomeIcons.chevronRight),
              ),
              // This is the setting to Logout the  account
              ListTile(
                onTap: () {},
                leading: const SettingIcons(
                  icon: FontAwesomeIcons.rightFromBracket,
                ),
                title: const Text("Logout"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void Taskbarupdater(PeriferanceState) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: PeriferanceState.getIsDark() == false
          ? const Color(0xff1A1A1A)
          : Colors.white,
      statusBarIconBrightness: PeriferanceState.getIsDark() == true
          ? Brightness.light
          : Brightness.dark,
      systemNavigationBarColor: PeriferanceState.getIsDark() == false
          ? const Color(0xff1A1A1A)
          : Colors.white,
      systemNavigationBarIconBrightness: PeriferanceState.getIsDark() == true
          ? Brightness.light
          : Brightness.dark,
    ));
  }

  Widget _LanguagePopUpbuilder({size, LanguageData}) {
    return Dialog(
      child: SizedBox(
        height: size.height * 0.37,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  "Select Language",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.3,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {},
                    leading:
                        const SettingIcons(icon: FontAwesomeIcons.language),
                    title: Text(
                      "${LanguageData[index]["name"]}",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                    ),
                  );
                },
                itemCount: LanguageData.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
