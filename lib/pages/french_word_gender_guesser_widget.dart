import 'package:flutter/material.dart';
import '../widgets/guesser.dart';

class FrenchWordGenderGuesser extends StatefulWidget {
  const FrenchWordGenderGuesser({Key? key}) : super(key: key);

  @override
  State<FrenchWordGenderGuesser> createState() =>
      _FrenchWordGenderGuesserState();
}

class _FrenchWordGenderGuesserState extends State<FrenchWordGenderGuesser> {
  @override
  Widget build(BuildContext context) {
    return const Guesser(
      language: "french",
      outputs: ["Masculine", "Feminine", "Plural"],
      modelpath: 'frenchGenderGuesserModel.tflite',
    );
  }
}
