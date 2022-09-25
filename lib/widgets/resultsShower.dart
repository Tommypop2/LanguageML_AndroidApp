import 'package:flutter/cupertino.dart';
import 'package:pie_chart/pie_chart.dart';

class ResultsShower extends StatefulWidget {
  final List orderedGenders;
  final List orderedOutputs;
  const ResultsShower({
    required Key key,
    required this.orderedGenders,
    required this.orderedOutputs,
  }) : super(key: key);

  @override
  State<ResultsShower> createState() => _ResultsShowerState();
}

class _ResultsShowerState extends State<ResultsShower> {
  @override
  Widget build(BuildContext context) {
    Map<String, double> coolData = {};
    for (int i = 0; i < widget.orderedGenders.length; i++) {
      coolData[widget.orderedGenders[i]] = widget.orderedOutputs[i];
    }
    // if (coolData.isEmpty) {
    //   coolData = {"NoData": 100};
    // }
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        child: coolData.isEmpty
            ? null
            : PieChart(
                dataMap: coolData,
                chartValuesOptions: const ChartValuesOptions(
                  showChartValueBackground: true,
                  showChartValues: true,
                  showChartValuesInPercentage: true,
                  showChartValuesOutside: false,
                  decimalPlaces: 2,
                ),
                legendOptions: LegendOptions(
                  showLegendsInRow: false,
                  legendPosition: MediaQuery.of(context).size.width < 400
                      ? LegendPosition.bottom
                      : LegendPosition.right,
                  showLegends: true,
                  legendTextStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       for (int i = 0; i < widget.orderedOutputs.length; i++)
        //         Text(
        //           "${widget.orderedGenders[i]}: ${(widget.orderedOutputs[i] * 100).toStringAsFixed(2)}%",
        //         )
        //     ],
        //   ),
      ),
    );
  }
}
