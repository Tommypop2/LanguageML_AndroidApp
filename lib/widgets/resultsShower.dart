import 'package:flutter/cupertino.dart';

class ResultsShower extends StatefulWidget {
  final List orderedGenders;
  final List orderedOutputs;
  const ResultsShower(
      {Key? key, required this.orderedGenders, required this.orderedOutputs})
      : super(key: key);

  @override
  State<ResultsShower> createState() => _ResultsShowerState();
}

class _ResultsShowerState extends State<ResultsShower> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.topLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int i = 0; i < widget.orderedOutputs.length; i++)
              Text(
                "${widget.orderedGenders[i]}: ${(widget.orderedOutputs[i] * 100).toStringAsFixed(2)}%",
              )
          ],
        ),
      ),
    );
  }
}
