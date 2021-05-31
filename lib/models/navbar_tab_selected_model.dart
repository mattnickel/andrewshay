import 'package:flutter/material.dart';
import '../pages/my_list.dart';
import '../pages/today.dart';
import '../pages/main_list.dart';





class NavbarTabSelectedModel extends ChangeNotifier {

  int _currentTab = 0;

  List <Widget> _pages = [
    MainList(),
    Today(),
    MyList(),
  ];


  set currentTab(int tab) { this._currentTab = tab; notifyListeners();}
  get currentTab => this._currentTab;
  get currentScreen => this._pages[this._currentTab];
}