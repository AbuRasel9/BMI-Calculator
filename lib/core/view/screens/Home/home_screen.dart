import 'dart:math';

import 'package:bmi_calculator/core/view/provider/provider.dart';
import 'package:bmi_calculator/core/view/screens/Home/widget/age_weight_widget.dart';
import 'package:bmi_calculator/core/view/screens/Home/widget/gender_height.dart';
import 'package:bmi_calculator/core/view/screens/Home/widget/gender_widget.dart';
import 'package:bmi_calculator/core/view/screens/bmiCalculationScreen/score_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedGender = 1;
  int ageMinValue = 1;
  int ageMaxValue = 120;
  int weightMinValue = 1;
  int weightMaxValue = 250;
  int ageValue = 15;
  int weightValue = 30;
  double bmiScore = 0;

  Future<void> bmiCalculation() async {
    final provider = context.read<CalculatorProvider>();
    bmiScore = provider.setCalculation(
      provider.weight / pow(provider.genderHeight / 100, 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CalculatorProvider>(context);
    final theme = Theme.of(context);
    return Scaffold(
      //swipeable button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          bottom: 40,
          top: 40,
          left: 10,
          right: 10,
        ),
        child: SwipeButton(
          thumb: Icon(
            Icons.arrow_forward_ios_outlined,
            color: theme.colorScheme.onPrimary,
          ),
          activeThumbColor: theme.colorScheme.secondary,
          borderRadius: BorderRadius.circular(
            8,
          ),
          activeTrackColor: theme.colorScheme.primary,
          height: 42,
          child: Text(
            "SWIPE TO END...",
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onPrimary,
            ),
          ),
          onSwipeStart: () async {
            await bmiCalculation();
          },
          onSwipeEnd: () {
            Navigator.push(
              context,
              PageTransition(
                duration: const Duration(milliseconds: 350,),
                reverseDuration: const Duration(milliseconds: 350,),
                child: ScoreScreen(
                  bmiScoreValue: bmiScore,
                ),
                type: PageTransitionType.bottomToTop,
              ),
            );
          },
          onSwipe: () async {},
        ),
      ),
      appBar: AppBar(
        title: const Text("BMI Calculator"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          16,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: theme.colorScheme.surface,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),

                    Text(
                      "WELCOME BMI CALCULATOR",
                      style: theme.textTheme.headlineSmall,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        GenderWidget(
                          imgLik: "assets/images/man.png",
                          selected: selectedGender == 1,
                          genderText: "Male",
                          onSelected: () {
                            setState(() {
                              selectedGender = 1;
                            });
                          },
                        ),
                        GenderWidget(
                          imgLik: "assets/images/woman.png",
                          selected: selectedGender == 2,
                          genderText: "Male",
                          onSelected: () {
                            setState(() {
                              selectedGender = 2;
                            });
                          },
                        ),
                      ],
                    ),
                    //gender height
                    const GenderHeight(),
                    Row(
                      children: <Widget>[
                        //gender age
                        Expanded(
                          child: AgeWeightWidget(
                            title: "AGE",
                            increment: () {
                              if (ageValue < ageMaxValue) {
                                provider.setAge(ageValue++);
                              }
                            },
                            decrement: () {
                              if (ageValue > ageMinValue) {
                                provider.setAge(ageValue--);
                              }
                            },
                            value: ageValue,
                          ),
                        ),
                        //gender age
                        Expanded(
                          child: AgeWeightWidget(
                            title: "WEIGHT",
                            increment: () {
                              if (weightValue < ageMaxValue) {
                                provider.setWeight(weightValue++);
                              }
                            },
                            decrement: () {
                              if (weightValue > ageMinValue) {
                                provider.setWeight(weightValue--);
                              }
                            },
                            value: weightValue,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
