import 'package:flutter/material.dart';

class CoordinatorProvider extends ChangeNotifier {
  int companies = 28;
  int openings = 54;
  int applicants = 196;

  void updateData(int c, int o, int a) {
    companies = c;
    openings = o;
    applicants = a;
    notifyListeners();
  }
}