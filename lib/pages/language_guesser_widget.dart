import 'package:flutter/material.dart';
import 'package:word_gender_guessers_flutter_app/widgets/guesser.dart';

class LanguageGuesser extends StatefulWidget {
  const LanguageGuesser({Key? key}) : super(key: key);

  @override
  State<LanguageGuesser> createState() => _LanguageGuesserState();
}

class _LanguageGuesserState extends State<LanguageGuesser> {
  @override
  Widget build(BuildContext context) {
    return const Guesser(
        language: "languages",
        outputs: ["English", "French", "Spanish"],
        modelpath: "languageGuesserModel.tflite");
  }
}
