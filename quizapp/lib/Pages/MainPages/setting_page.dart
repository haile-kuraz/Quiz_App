import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
// for localization
import 'package:easy_localization/easy_localization.dart';

import '../../Provider/LanguageProvider.dart';
import '../../Provider/LanguageProvider.dart';
import '../../Provider/PeriferanceProvider.dart';
import '../../Widgets/SettingIcons.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  bool timer = true;
  String selectedOption = 'Option 1';

  List<Map> LanguageData = [
    {
      "name": "English",
      "value": "en",
    },
    {
      "name": "አማርኛ",
      "value": "am",
    },
    {
      "name": "ትግሪኛ",
      "value": "ti",
    },
    {
      "name": "Afaan Oromo",
      "value": "om",
    },
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var PeriferanceUpdate = Provider.of<Periferance>(context, listen: false);
    var PeriferanceState = Provider.of<Periferance>(context);

    return Consumer<LanguageProvider>(
      builder: (context, languageProvider, child) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            body: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back),
                        ),
                        Center(
                          child: Text(
                            "Settings",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                      ],
                    )),
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "System",
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onTertiaryContainer,
                                  ),
                        ),
                        // This is the setting to set volume
                        ListTile(
                          leading: const SettingIcons(
                            icon: FontAwesomeIcons.volumeHigh,
                          ),
                          title: Text(
                            "Sound",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
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
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
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
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onTertiaryContainer,
                                  ),
                        ),
                        // This is the setting to set nightmode
                        ListTile(
                          leading: const SettingIcons(
                            icon: Icons.brightness_4,
                          ),
                          title: Text(
                            "Night Mode",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
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
                                  size: size,
                                  LanguageData: LanguageData,
                                );
                              },
                            );
                          },
                          leading: const SettingIcons(
                            icon: FontAwesomeIcons.language,
                          ),
                          title: Text(
                            "Language",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                ),
                          ),
                          trailing: const Icon(FontAwesomeIcons.chevronRight),
                        ),
                        // This is the setting to set difficulty
                        ListTile(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  shape: const ContinuousRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(25),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        RadioListTile(
                                          fillColor: MaterialStatePropertyAll(
                                            Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                          title: const Text("Easy"),
                                          value: 'easy',
                                          groupValue:
                                              PeriferanceState.getdifficulty(),
                                          onChanged: (value) {
                                            PeriferanceState.setdifficulty(
                                                value ?? 'easy');
                                          },
                                        ),
                                        RadioListTile(
                                          fillColor: MaterialStatePropertyAll(
                                            Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                          title: const Text('Medium'),
                                          value: 'medium',
                                          groupValue:
                                              PeriferanceState.getdifficulty(),
                                          onChanged: (value) {
                                            PeriferanceState.setdifficulty(
                                                value ?? 'medium');
                                          },
                                        ),
                                        RadioListTile(
                                          fillColor: MaterialStatePropertyAll(
                                            Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                          title: const Text('Hard'),
                                          value: 'hard',
                                          groupValue:
                                              PeriferanceState.getdifficulty(),
                                          onChanged: (value) {
                                            PeriferanceState.setdifficulty(
                                                value ?? 'hard');
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          leading: const SettingIcons(
                            icon: Icons.signal_cellular_alt,
                          ),
                          title: Text(
                            "Difficulty",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                ),
                          ),
                          trailing: const Icon(FontAwesomeIcons.chevronRight),
                        ),

                        Text(
                          "Help and Privacy",
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onTertiaryContainer,
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
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
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
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
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
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
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
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                ),
                          ),
                          trailing: const Icon(FontAwesomeIcons.chevronRight),
                        ),
                        // This is the setting to Logout the  account
                        ListTile(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text(
                                      "Are you sure,\nyou want to Logout"),
                                  actions: [
                                    TextButton(
                                      onPressed: () {},
                                      style: ButtonStyle(
                                          elevation:
                                              const MaterialStatePropertyAll(5),
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                            Theme.of(context)
                                                .colorScheme
                                                .background,
                                          )),
                                      child: const Text("Cancel"),
                                    ),
                                    SizedBox(
                                      width: size.width * 0.002,
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      style: ButtonStyle(
                                          elevation:
                                              const MaterialStatePropertyAll(5),
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                            Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          )),
                                      child: Text(
                                        "Logout",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium
                                            ?.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onBackground,
                                            ),
                                      ),
                                    )
                                  ],
                                );
                              },
                            );
                          },
                          leading: const SettingIcons(
                            icon: FontAwesomeIcons.rightFromBracket,
                          ),
                          title: const Text("Logout"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
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
            ? Brightness.dark
            : Brightness.light));
  }

  Widget _LanguagePopUpbuilder({size, LanguageData}) {
    var LanguageUpdate = Provider.of<LanguageProvider>(context);
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
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      LanguageUpdate.changeLanguage(
                          Locale(
                            LanguageData[index]["value"],
                          ),
                          context);
                      // ignore: use_build_context_synchronously
                    },
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
