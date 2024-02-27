import 'list_tiles/SettingsMenuTile.dart';
import 'package:dsgreader/sectionHeading.dart';
import 'package:dsgreader/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'list_tiles/SettingsMenuSwitchTile.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  static const bool userThemeSet = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBar( // App Bar
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16))),
              centerTitle: true,
              leading: GestureDetector(
                  child: const Icon(Icons.close), onTap: () {Navigator.of(context).pop(); } ),
              title: const Text("Settings", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            ),

            // Body Starts Here
            Padding(
              padding: const EdgeInsets.all(HSizes.md),
              child: Column(
                children: [
                  const SizedBox(height: HSizes.dividerHeight),
                  const SectionHeading(title: "Appearance", showActionButton: false,),
                  SettingsMenuSwitchTile(
                      icon: Iconsax.paintbucket5,
                      title: "Theme", subTitle: "Toggle between System Theme or User Theme.", trailing: Switch(value: userThemeSet, onChanged: (bool value) {}), isSwitched: userThemeSet,)
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}

// body > column(s) > decorated box > listview