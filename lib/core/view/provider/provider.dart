import 'package:flutter/cupertino.dart';

class CalculatorProvider extends ChangeNotifier {
  //gender height
  double _genderHeight = 100;

  //get age
  int _age = 15;

  //int weight
  int _weight = 30;
  //bmi calculation score
  double _calculation=0;
  //get bmi calculation score
  double get calculation=>_calculation;

  //get gender height
  double get genderHeight => _genderHeight;

  //get age
  int get age => _age;

  //get weight
  int get weight => _weight;

  //set age
  setAge(int ageValue) {
    _age = ageValue;
    notifyListeners();
  }
  //set bmi calculation score
  setCalculation(double value){
    _calculation=value;
    notifyListeners();

  }

  //set weight
  setWeight(int weightValue) {
    _weight = weightValue;
    notifyListeners();
  }

  //set gender height
  setGenderHeight(double value) {
    _genderHeight = value;
    notifyListeners();
  }
}
