import 'package:flutter/material.dart';
import 'package:word_gender_guessers_flutter_app/widgets/guesser.dart';

class GermanWordGenderGuesser extends StatefulWidget {
  const GermanWordGenderGuesser({Key? key}) : super(key: key);

  @override
  State<GermanWordGenderGuesser> createState() =>
      _GermanWordGenderGuesserState();
}

class _GermanWordGenderGuesserState extends State<GermanWordGenderGuesser> {
  @override
  Widget build(BuildContext context) {
    return const Guesser(
      language: "german",
      outputs: ["Masculine", "Feminine", "Neuter"],
      modelpath: 'germanGenderGuesserModel.tflite',
    );
  }
}
