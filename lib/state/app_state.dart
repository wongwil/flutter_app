import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_application_1/models/word_list.dart';

class MyAppState extends ChangeNotifier {
  final random = Random();
  int _currentIndex = 0;
  String get current => WordList.words[_currentIndex];

  void getNext() {
    _currentIndex = random.nextInt(WordList.words.length);
    notifyListeners();
  }

  var favorites = <String>{};

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }
}
