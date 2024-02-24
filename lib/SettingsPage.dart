import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
        ),
        centerTitle: true,
        leading: GestureDetector(
          child: const Icon(Icons.close), onTap: () {Navigator.of(context).pop(); } ),
        title: const Text("Settings", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
      ),
    );
  }
}
