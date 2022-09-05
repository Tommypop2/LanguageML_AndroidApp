import 'package:flutter/material.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import "package:word_gender_guessers_flutter_app/helper_functions.dart";
import 'package:word_gender_guessers_flutter_app/widgets/resultsShower.dart';

class FrenchWordGenderGuesser extends StatefulWidget {
  const FrenchWordGenderGuesser({Key? key}) : super(key: key);

  @override
  State<FrenchWordGenderGuesser> createState() =>
      _FrenchWordGenderGuesserState();
}

class _FrenchWordGenderGuesserState extends State<FrenchWordGenderGuesser> {
  final TextEditingController textController = TextEditingController();
  String hintText = "Enter a word";
  List outputs = [];
  List outputGenders = [];
  Future<List<dynamic>> getOutputs(List<double> input) async {
    final interpreter =
        await Interpreter.fromAsset('frenchGenderGuesserModel.tflite');
    // var input = [];
    // for (int i = 0; i < 72; i++) {
    //   input.add(1.0);
    // }
    var output = List.filled(3, 0).reshape([1, 3]);
    interpreter.run(input, output);
    return output;
  }

  void submitText(String str) async {
    if (str == "") str = hintText;
    setState(() {
      hintText = str;
      textController.text = "";
    });
    str = str.toLowerCase();
    List<double> stringAsList = getStringAsList(str);
    int length = stringAsList.length;
    while (length < 72) {
      stringAsList.add(0);
      length += 1;
    }
    outputs = (await getOutputs(stringAsList))[0];
    outputGenders = ["Masculine", "Feminine", "Plural"];
    while (true) {
      int swaps = 0;
      for (int i = 1; i < outputs.length; i++) {
        final firstOutput = outputs[i - 1];
        final secondOutput = outputs[i];
        final firstGender = outputGenders[i - 1];
        final secondGender = outputGenders[i];
        if (firstOutput < secondOutput) {
          outputs[i] = firstOutput;
          outputs[i - 1] = secondOutput;
          outputGenders[i] = firstGender;
          outputGenders[i - 1] = secondGender;
          swaps += 1;
        }
      }
      if (swaps == 0) {
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ResultsShower(orderedGenders: outputGenders, orderedOutputs: outputs),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: TextField(
            controller: textController,
            onSubmitted: submitText,
            style: const TextStyle(
              color: Colors.red,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              filled: true,
              fillColor: Colors.white,
              border: const OutlineInputBorder(),
              hintStyle: const TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
