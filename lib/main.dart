import 'package:bmi_calculator/core/view/provider/provider.dart';
import 'package:bmi_calculator/utils/theme/app_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/view/screens/Home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CalculatorProvider(),
        ),
      ],
      child: MaterialApp(
        theme: AppThemeData.lightThemeData,
        home:const HomeScreen(),
      ),
    );
  }
}
