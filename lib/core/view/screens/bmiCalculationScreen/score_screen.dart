import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ScoreScreen extends StatefulWidget {
  final double bmiScoreValue;

  const ScoreScreen({super.key, required this.bmiScoreValue});

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculation Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: double.infinity,
          margin:
              const EdgeInsets.only(bottom: 10, top: 5, left: 10, right: 10),
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(
                8,
              ),
              border: Border.all(
                  color: theme.colorScheme.onSurface.withOpacity(.2))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Your Score",
                style: theme.textTheme.headlineMedium,
              ),
              SfRadialGauge(
                axes: [
                  RadialAxis(
                    showLastLabel: true,
                    maximum: 40,
                    minimum: 0,
                    ranges: [

                      GaugeRange(
                          label: "dhaka",
                          startValue: 0, endValue: 10, color:Colors.red),
                      GaugeRange(startValue: 10,endValue: 20,color: Colors.orange),
                      GaugeRange(startValue: 20,endValue: 40,color: Colors.blue)],


                  ),


                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
