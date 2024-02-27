import 'package:flutter/material.dart';

import '../utils/constants/colors.dart';

class SettingsMenuSwitchTile extends StatelessWidget {
  const SettingsMenuSwitchTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    required this.isSwitched,
    this.trailing,
    this.onChanged,
  });

  final IconData icon;
  final String title, subTitle;
  final Widget? trailing;
  final VoidCallback? onChanged;
  final bool isSwitched;

  @override
  Widget build(BuildContext context) {

    return SwitchListTile(
      secondary: Icon(icon, size:28, color: HColors.primary),
      title: Text(title, style: Theme.of(context).textTheme.titleMedium),
      subtitle: Text(subTitle, style: Theme.of(context).textTheme.labelMedium),
      value: isSwitched,
      onChanged: (bool value) {  },
    );
  }
}