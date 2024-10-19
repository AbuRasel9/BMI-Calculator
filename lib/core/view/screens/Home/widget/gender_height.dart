import 'package:bmi_calculator/core/view/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GenderHeight extends StatefulWidget {
  const GenderHeight({super.key});

  @override
  State<GenderHeight> createState() => _GenderHeightState();
}

class _GenderHeightState extends State<GenderHeight> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final calculatorProvider = Provider.of<CalculatorProvider>(context);
    return Container(
      margin: const EdgeInsets.all(10),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8,),
          border:
              Border.all(color: theme.colorScheme.onSurface.withOpacity(.2,),),),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "HEIGHT",
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          //height value
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                calculatorProvider.genderHeight.toStringAsFixed(0),
                style: theme.textTheme.headlineMedium,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "CM",
                style: theme.textTheme.labelLarge,
              ),
            ],
          ),
          Slider(
            activeColor: theme.colorScheme.primary,
              inactiveColor: theme.colorScheme.onSurface.withOpacity(.3),
              min: 0,
              max: 200,
              value: calculatorProvider.genderHeight, onChanged: (value){
            calculatorProvider.setGenderHeight(value);
          })
        ],
      ),
    );
  }
}
