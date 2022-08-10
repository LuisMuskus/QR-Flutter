
import 'package:flutter/material.dart';

class Uiprovider extends ChangeNotifier {

  int _selectedMenuOpt = 0;
  
  int get selectedMenuOpt {
    return this._selectedMenuOpt;
  }

  set selectedMenuOpt (int i){
    this._selectedMenuOpt = i;
    notifyListeners();
  }

}