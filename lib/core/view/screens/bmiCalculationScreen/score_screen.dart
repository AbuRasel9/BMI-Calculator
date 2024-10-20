import 'package:bmi_calculator/core/view/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:pretty_gauge/pretty_gauge.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class ScoreScreen extends StatefulWidget {
  const ScoreScreen({
    super.key,
  });

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  String bmiStatus = "";
  String message = "";
  Color statusColor = Colors.transparent;

  void checkBmiStatus() async {
    final provider = context.read<CalculatorProvider>();

    if (provider.calculation > 30 && provider.calculation <= 40) {
      bmiStatus = "Obsese";
      message = "Please work to reduce oesity";
      statusColor = Colors.pink;
    } else if (provider.calculation >= 25) {
      bmiStatus = "Over Weight";
      message = "Do regular exercise and reduce weight";
      statusColor = Colors.orange;
    } else if (provider.calculation >= 18.5) {
      bmiStatus = "Normal";
      message = "Enjoy, You are fit";
      statusColor = Colors.green;
    } else if (provider.calculation < 18.5) {
      bmiStatus = "Under Weight";
      message = "Try to increase weiht";
      statusColor = Colors.red;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    checkBmiStatus();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final calculationProvider = Provider.of<CalculatorProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculation Screen"),
      ),
      body: SingleChildScrollView(
        child: Padding(
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
                // SfRadialGauge(
                //   axes: [
                //     RadialAxis(
                //       showLastLabel: true,
                //       maximum: 40,
                //       minimum: 0,
                //       ranges: [
                //
                //         GaugeRange(
                //             label: "dhaka",
                //             startValue: 0, endValue: 10, color:Colors.red),
                //         GaugeRange(startValue: 10,endValue: 20,color: Colors.orange),
                //         GaugeRange(startValue: 20,endValue: 40,color: Colors.blue)],
                //
                //
                //     ),
                //
                //
                //   ],
                //

                PrettyGauge(
                  needleColor: theme.colorScheme.primary,
                  // gaugeSize: 200,
                  minValue: 0,
                  maxValue: 40,
                  segments: [
                    GaugeSegment(
                      "UnderWeight",
                      18.5,
                      theme.colorScheme.error,
                    ),
                    GaugeSegment(
                      "Normal",
                      6.4,
                      theme.colorScheme.tertiary,
                    ),
                    GaugeSegment(
                      "OverWeight",
                      5,
                      Colors.orange,
                    ),
                    GaugeSegment(
                      "Obese",
                      10.1,
                      Colors.pink,
                    ),
                  ],
                  valueWidget: Text(
                    calculationProvider.calculation.toStringAsFixed(1),
                    style: theme.textTheme.bodyLarge,
                  ),
                  currentValue: calculationProvider.calculation,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  bmiStatus,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: statusColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  message,
                  style: theme.textTheme.labelLarge,
                ),
                const SizedBox(
                  height: 10,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: theme.colorScheme.primary,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Re-Calculate")),
                    const SizedBox(
                      width: 8,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: theme.colorScheme.secondary,
                        ),
                        onPressed: () {
                          Share.share(
                            "Share Your BMI score ${calculationProvider.calculation} at age ${calculationProvider.age}",
                              subject: "Share Your Score"

                          );
                        },
                        child: const Text("Share-Score")),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
