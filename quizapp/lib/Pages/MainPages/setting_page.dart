import 'package:flutter/material.dart';
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
  bool sound = true;
  bool timer = true;
  bool nightmode = false;
  @override
  Widget build(BuildContext context) {
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
                  value: sound,
                  onChanged: (value) {
                    setState(() {
                      sound = value;
                    });
                    PeriferanceUpdate.setIsthereSound(sound);
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
                  value: timer,
                  onChanged: (value) {
                    setState(() {
                      timer = value;
                    });
                    PeriferanceUpdate.setIsthereSound(timer);
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
                    setState(() {
                      Periferance.isDark = value;
                    });
                    PeriferanceUpdate.setIsDarkStatus(value);
                  },
                ),
              ),
              // This is the setting to set Language
              ListTile(
                onTap: () {},
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
                onTap: () {},
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
}
