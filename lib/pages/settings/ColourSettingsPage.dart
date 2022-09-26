import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import "package:word_gender_guessers_flutter_app/storage/settings_holder.dart";

class ColourCustomisationsPage extends StatefulWidget {
  const ColourCustomisationsPage({Key? key, required this.title})
      : super(key: key);

  final String title;

  @override
  State<ColourCustomisationsPage> createState() => _ColourCustomisationsPage();
}

// MaterialColorPicker(
//         onColorChange: (Color colour) {},
//         selectedColor: Colors.green,
//       ),

class _ColourCustomisationsPage extends State<ColourCustomisationsPage> {
  // Some code nicked from the example and then modified (heavily) :)
  // ColorSwatch? _tempMainColor = Colors.green;
  Color? _tempShadeColor;
  // ColorSwatch? _mainColor = Colors.green;
  Color? _shadeColor;
  Color submittedColor = SettingsHolder.appBarBackgroundColour;
  late String val;
  void setValue() {
    if (val == "AppBarBackgroundColour") {
      SettingsHolder.appBarBackgroundColour = submittedColor;
    }
    if (val == "MainBackgroundColour") {
      SettingsHolder.mainBackgroundColour = submittedColor;
    }
    if (val == "NavigationAccentColour") {
      SettingsHolder.navigationAccentColour = submittedColor;
    }
    if (val == "AppbarAccentColour") {
      SettingsHolder.appBarAccentColour = submittedColor;
    }
    if (val == "InputBoxColour") {
      SettingsHolder.inputFieldColour = submittedColor;
    }
    if (val == "ButtonColour") {
      SettingsHolder.buttonColour = submittedColor;
    }
    if (val == "NavigationBackgroundColour") {
      SettingsHolder.navigationBackgroundColour = submittedColor;
    }

    SettingsHolder.serialiseSettings();
  }

  final borderColour = Colors.grey;
  final double borderWidth = 2;
  @override
  Widget build(BuildContext context) {
    void _openDialog(String title, Widget content) {
      showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            contentPadding: const EdgeInsets.all(6.0),
            title: Text(title),
            content: content,
            actions: [
              TextButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('SUBMIT'),
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    // _mainColor = _tempMainColor;
                    _shadeColor = _tempShadeColor;
                  });
                  submittedColor = _shadeColor!;
                  setValue();
                  // setState(() => _mainColor = _tempMainColor);
                  // setState(() => _shadeColor = _tempShadeColor);
                },
              ),
            ],
          );
        },
      );
    }

    Future<void> _openColorPicker() async {
      _openDialog(
        "Color picker",
        MaterialColorPicker(
          selectedColor: _shadeColor,
          onColorChange: (color) => setState(() => _tempShadeColor = color),
          // onMainColorChange: (color) => setState(() => _tempMainColor = color),
          onBack: () {},
        ),
      );
    }

    double buttonWidth = MediaQuery.of(context).size.width;
    double buttonHeight = 50;
    // [right, top]
    List<double> colourIndicatorPos = [0, 10];
    if (!identical(0.0, 0) && Platform.isAndroid) {
      colourIndicatorPos = [0, 0];
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: SettingsHolder.appBarBackgroundColour,
        title: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 88,
                // child: Hero(
                //   tag: "ColourSettingsHero",
                child: Text(
                  "Colour Settings",
                  style: TextStyle(
                    color: SettingsHolder.appBarAccentColour,
                  ),
                ),
                // ),
              ),
            ],
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: "Back",
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: SettingsHolder.appBarAccentColour,
        ),
      ),
      backgroundColor: SettingsHolder.mainBackgroundColour,
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                width: buttonWidth,
                height: buttonHeight,
                child: TextButton(
                  child: Stack(
                    children: [
                      const Center(
                        child: Text("Appbar Colour"),
                      ),
                      Positioned(
                        right: colourIndicatorPos[0],
                        top: colourIndicatorPos[1],
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: SettingsHolder.appBarBackgroundColour,
                            border: Border.all(
                              color: borderColour,
                              width: borderWidth,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  onPressed: () async {
                    val = "AppBarBackgroundColour";
                    await _openColorPicker();
                  },
                ),
              ),
              SizedBox(
                width: buttonWidth,
                height: buttonHeight,
                child: TextButton(
                  child: Stack(
                    children: [
                      const Center(
                        child: Text("Main Background Colour"),
                      ),
                      Positioned(
                        right: colourIndicatorPos[0],
                        top: colourIndicatorPos[1],
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: SettingsHolder.mainBackgroundColour,
                            border: Border.all(
                              color: borderColour,
                              width: borderWidth,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  onPressed: () async {
                    val = "MainBackgroundColour";
                    await _openColorPicker();
                  },
                ),
              ),
              SizedBox(
                width: buttonWidth,
                height: buttonHeight,
                child: TextButton(
                  child: Stack(
                    children: [
                      const Center(
                        child: Text("Navigation Accent Colour"),
                      ),
                      Positioned(
                        right: colourIndicatorPos[0],
                        top: colourIndicatorPos[1],
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: SettingsHolder.navigationAccentColour,
                            border: Border.all(
                              color: borderColour,
                              width: borderWidth,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  onPressed: () async {
                    val = "NavigationAccentColour";
                    await _openColorPicker();
                  },
                ),
              ),
              SizedBox(
                width: buttonWidth,
                height: buttonHeight,
                child: TextButton(
                  child: Stack(
                    children: [
                      const Center(
                        child: Text("Appbar Accent Colour"),
                      ),
                      Positioned(
                        right: colourIndicatorPos[0],
                        top: colourIndicatorPos[1],
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: SettingsHolder.appBarAccentColour,
                            border: Border.all(
                              color: borderColour,
                              width: borderWidth,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  onPressed: () async {
                    val = "AppbarAccentColour";
                    await _openColorPicker();
                  },
                ),
              ),
              SizedBox(
                width: buttonWidth,
                height: buttonHeight,
                child: TextButton(
                  child: Stack(
                    children: [
                      const Center(
                        child: Text("Input Box Colour"),
                      ),
                      Positioned(
                        right: colourIndicatorPos[0],
                        top: colourIndicatorPos[1],
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: SettingsHolder.inputFieldColour,
                            border: Border.all(
                              color: borderColour,
                              width: borderWidth,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  onPressed: () async {
                    val = "InputBoxColour";
                    await _openColorPicker();
                  },
                ),
              ),
              SizedBox(
                width: buttonWidth,
                height: buttonHeight,
                child: TextButton(
                  child: Stack(
                    children: [
                      const Center(
                        child: Text("Button Colour"),
                      ),
                      Positioned(
                        right: colourIndicatorPos[0],
                        top: colourIndicatorPos[1],
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: SettingsHolder.buttonColour,
                            border: Border.all(
                              color: borderColour,
                              width: borderWidth,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  onPressed: () async {
                    val = "ButtonColour";
                    await _openColorPicker();
                  },
                ),
              ),
              SizedBox(
                width: buttonWidth,
                height: buttonHeight,
                child: TextButton(
                  child: Stack(
                    children: [
                      const Center(
                        child: Text("Navigation Background Colour"),
                      ),
                      Positioned(
                        right: colourIndicatorPos[0],
                        top: colourIndicatorPos[1],
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: SettingsHolder.navigationBackgroundColour,
                            border: Border.all(
                              color: borderColour,
                              width: borderWidth,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  onPressed: () async {
                    val = "NavigationBackgroundColour";
                    await _openColorPicker();
                  },
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    SettingsHolder.resetSettings();
                    SettingsHolder.serialiseSettings();
                  });
                },
                icon: const Icon(Icons.restore),
                tooltip: "Reset Settings",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
