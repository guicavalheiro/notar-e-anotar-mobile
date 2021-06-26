import 'package:flutter/cupertino.dart';

class DateStateManager {
  static final DateStateManager _data = new DateStateManager._internal();

  ValueNotifier<int> selectedDateIndex = ValueNotifier<int>(0);

  void changeDateIndex(int newIndex) {
    selectedDateIndex.value = newIndex;
    selectedDateIndex.notifyListeners();
  }

  factory DateStateManager() {
    return _data;
  }
  DateStateManager._internal();
}

final dateStateManager = DateStateManager();
