import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/volt_counter_model.dart';

class VoltCounterViewModel extends ChangeNotifier {
  final VoltCounterModel model;
  late final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  VoltCounterViewModel(this.model) {
    _loadKwhPrice();
  }

  Future<void> _loadKwhPrice() async {
    final prefs = await _prefs;
    double kwhPrice = prefs.getDouble('kwh_price') ?? 0.15;
    model.kwhPriceStr = kwhPrice.toString();
  }

  void setPowerWattsStr(String value) {
    model.powerWattsStr = value;
    notifyListeners();
  }

  void setKwhPriceStr(String value) {
    model.kwhPriceStr = value;
    notifyListeners();
  }

  void calculateCosts() {
    try {
      model.powerWatts = double.parse(model.powerWattsStr);
      model.kwhPrice = double.parse(model.kwhPriceStr);
    } catch (e) {
      model.powerWatts = 0.0;
      model.kwhPrice = 0.0;
    }

    if (model.powerWatts == 0 || model.kwhPrice == 0) {
      model.costPerHour = 0.0;
      model.costPerDay = 0.0;
      model.costPerMonth = 0.0;
      model.costPerYear = 0.0;
    } else {
      double kw = model.powerWatts / 1000;
      model.costPerHour = kw * model.kwhPrice;
      model.costPerDay = model.costPerHour * 24;
      model.costPerMonth = model.costPerDay * 30;
      model.costPerYear = model.costPerDay * 365;
    }
    notifyListeners();
    _saveKwhPrice();
  }

  Future<void> _saveKwhPrice() async {
    final prefs = await _prefs;
    await prefs.setDouble('kwh_price', model.kwhPrice);
  }
}