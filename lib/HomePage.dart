import 'package:dsgreader/utils/constants/colors.dart';
import 'package:dsgreader/utils/constants/sizes.dart';
import 'package:dsgreader/utils/theme/custom_themes/appBarTheme.dart';
import 'package:dsgreader/utils/theme/custom_themes/textTheme.dart';
import 'package:dsgreader/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController t = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [/**
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: (() {
                        Navigator.of(context)
                            ..pop()
                            ..pop();
                      }),
                      child: Icon(Icons.arrow_back, size: 30, color: HColors.white),
                    )
                  ],
                )
              ),
            ),*/
            Center(
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 8),
                          child: Container(
                            height: 40,
                            child: TextField(
                              controller: t,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: HColors.darkGrey,
                                  contentPadding: EdgeInsets.all(10),
                                  hintText: "Search...",
                                  prefixIcon: Icon(Icons.search),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(40)
                                  )
                              ),
                            ),
                          )
                      )
                    ],
                  )
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: HColors.darkerGrey,
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        child: Container(
                          child: ListView(
                            children: [
                              SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Continue Reading", style: HTextTheme.darkTextTheme.headlineMedium),
                                    const Icon(Iconsax.arrow_right_2)
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                                //Text("Load call to server here\n Srolling Left <-> Right widget", style: HTextTheme.darkTextTheme.headlineSmall),
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Recent Updates", style: HTextTheme.darkTextTheme.headlineMedium),
                                    Icon(Iconsax.arrow_right_2),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              //Text("Load call to server here\n Srolling Left <-> Right widget", style: HTextTheme.darkTextTheme.headlineSmall),
                              SizedBox(height: 10),
                              Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                                  child: Row(

                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("New Titles", style: HTextTheme.darkTextTheme.headlineMedium),
                                      Icon(Iconsax.arrow_right_2),
                                    ],
                                  )
                              )
                            ],
                          )
                        )
                      )
                    )
                  ]
                )
              )
            )
          ],
        ),
      )

    );
  }
}
