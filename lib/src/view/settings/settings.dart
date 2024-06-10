import 'package:abodein/src/view/registration/login_page.dart';
import 'package:abodein/utils/app_colors.dart';
import 'package:abodein/utils/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Settings',
          style: mediumTextStyle,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.046),
        child: Column(
          children: [
            SettingsSection(
              title: 'General',
              settings: [
                Container(
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(-0.3, 1),
                          blurRadius: 2,
                          blurStyle: BlurStyle.normal,
                          spreadRadius: 0,
                          color: greyShadeDark
                          // color: darktheme
                          //     ? Color.fromARGB(255, 165, 223, 254)
                          //     : Color.fromARGB(255, 248, 248, 248),
                          ),
                    ],
                  ),
                  child: SettingsItem(
                    icon: Icons.thumb_up_alt_outlined,
                    title: 'Leave feedback',
                    subtitle: 'Help us improve our app',
                    onTap: () {
                      // Handle feedback tap
                    },
                    showArrow: false,
                  ),
                ),
                sizedBox(height * 0.04, width),
                Container(
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(-0.3, 1),
                          blurRadius: 2,
                          blurStyle: BlurStyle.normal,
                          spreadRadius: 0,
                          color: greyShadeDark
                          // color: darktheme
                          //     ? Color.fromARGB(255, 165, 223, 254)
                          //     : Color.fromARGB(255, 248, 248, 248),
                          ),
                    ],
                  ),
                  child: Column(
                    children: [
                      SettingsSwitchItem(
                        icon: Icons.brightness_6,
                        title: 'Switch themes',
                        value: false,
                        onChanged: (value) {},
                      ),
                      Divider(),
                      SettingsItem(
                        icon: Icons.delete,
                        title: 'Clear cache',
                        onTap: () {
                          // Handle clear cache tap
                        },
                        showArrow: false,
                      ),
                      Divider(),
                      SettingsItem(
                        icon: Icons.help_outline,
                        title: 'FAQ',
                        onTap: () {
                          // Handle FAQ tap
                        },
                        showArrow: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            sizedBox(height * 0.02, width),
            SettingsSection(
              title: 'Legal',
              settings: [
                Container(
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(-0.3, 1),
                          blurRadius: 2,
                          blurStyle: BlurStyle.normal,
                          spreadRadius: 0,
                          color: greyShadeDark
                          // color: darktheme
                          //     ? Color.fromARGB(255, 165, 223, 254)
                          //     : Color.fromARGB(255, 248, 248, 248),
                          ),
                    ],
                  ),
                  child: Column(
                    children: [
                      SettingsItem(
                        icon: Icons.lock,
                        title: 'Data Privacy Terms',
                        onTap: () {
                          // Handle data privacy terms tap
                        },
                        showArrow: true,
                      ),
                      Divider(),
                      SettingsItem(
                        icon: Icons.description,
                        title: 'Terms and Conditions',
                        onTap: () {
                          // Handle terms and conditions tap
                        },
                        showArrow: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            sizedBox(height * 0.02, width),
            SettingsItem(
              icon: Icons.logout,
              title: 'Sign out',
              onTap: () {},
              showArrow: false,
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsSection extends StatelessWidget {
  final String title;
  final List<Widget> settings;

  SettingsSection({required this.title, required this.settings});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            color: Colors.grey,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Column(children: settings),
      ],
    );
  }
}

class SettingsItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback onTap;
  final bool showArrow;
  SettingsItem(
      {required this.icon,
      required this.title,
      this.subtitle,
      required this.onTap,
      required this.showArrow});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: blackShadeColor),
      title: Text(title, style: smallboldTextStyle),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: subtitlestyle,
            )
          : null,
      trailing: showArrow
          ? Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16)
          : null,
      onTap: onTap,
    );
  }
}

class SettingsSwitchItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  SettingsSwitchItem(
      {required this.icon,
      required this.title,
      required this.value,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title, style: GoogleFonts.poppins(fontSize: 16)),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeTrackColor: Colors.lightGreenAccent,
        activeColor: Colors.green,
      ),
    );
  }
}
