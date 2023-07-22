import 'package:flutter/material.dart';

class PageIndexProvider extends ChangeNotifier{
  var pageIndex=0;

  changeIndex(p){
    pageIndex=p;
    notifyListeners();
  }
}